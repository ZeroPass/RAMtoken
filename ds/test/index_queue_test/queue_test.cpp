#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/crypto.h>

#include "../../index_queue.hpp"


using namespace eosio;


class queue_test : public eosio::contract 
{
    struct queue_value 
    {
        uint64_t key;
        int32_t value;

        constexpr bool operator == (const queue_value& qv) const { 
            return key == qv.key && value == qv.value;
        }
        constexpr bool operator != (const queue_value& qv) { return !(*this == qv); }
        uint64_t get_key() const { return key; }
    };

    static constexpr uint64_t index_key = N("key");
    typedef index_queue<N(eosq),
        queue_value, 
        indexed_by<index_key, const_mem_fun<queue_value, uint64_t, &queue_value::get_key>>
    > q_t;

public:
    using contract::contract;
    queue_test(account_name self) :
        contract(self),
        m_q(self, self)
    {}

    /// @abi action 
    void push(int32_t n)
    {
        uint64_t seed = expiration() + tapos_block_num();
        queue_value qv { get_random_key(seed), n };
        m_q.push(/*payer=*/get_self(), std::move(qv));

        eosio_assert((--m_q.end())->value == n, "Failed to add element at the end of the queue!");
        print_f("Number: % was inserted into queue", n);
    }

    /// @abi action
    void pop()
    {
        ::print("Removing top element\n");
        auto e = m_q.pop();
        if(e){
            print_f("Removed element: %\n", e->value);
        }
    }

    /// @abi action
    void top()
    {
        auto it = m_q.top();
        eosio_assert(it == m_q.begin(), "Invalid top element!");

        if(it == m_q.end()) {
            ::print("Queue is empty!");
        }
        else {
            print_f("Top element in queue: [ord_idx:% key:% val: %]\n", it.internal_idx(), it->key, it->value);
        }
    }

    /// @abi action
    void bottom()
    {
        if(m_q.empty()) {
            ::print("Queue is empty!");
        }
        else
        {
            auto it = --m_q.end();
            print_f("Bottom element in queue: [ord_idx:% key:% val: %]\n", it.internal_idx(), it->key, it->value);
        }
    }

    /// @abi action
    void fill(uint64_t n_elements)
    {
        print_f("Inserting % random elements into queue...\n", n_elements);
        uint64_t seed = expiration() + tapos_block_num();
        while(n_elements --> 0) 
        {
            uint64_t data = now() + n_elements;
            checksum160 cs = {0};
            ripemd160(reinterpret_cast<char*>(&data), sizeof(data), &cs);

            // Push element to the back of the queue
            m_q.emplace(/*payer=*/get_self(), 
                get_random_key(seed + n_elements), cs.hash[0]);

            eosio_assert((--m_q.end())->value == cs.hash[0], "Failed to add element at the end of the queue!");
        }

        print("Success!");
    }

    /// @abi action
    void remove(uint64_t key)
    {
        auto it = m_q.find<index_key>(key);
        if(it != m_q.end()) {
            m_q.erase(it);
        } 
        else {
            ::print("Key not found!\n");
        }
    }

    /// @abi action
    void clear(account_name payer)
    {
        print("Removing all elements in queue...");
        auto it = m_q.begin();
        if(it != m_q.end()) {
            clearrange(payer, it->key, 50);
        }
    }

    /// @abi action
    void clearrange(account_name payer, uint64_t first_key, uint64_t num)
    {
        auto it = eraser(first_key, num);
        if(it != m_q.end()) 
        {
            auto next_key = it->key;

            // Defered call
            transaction out{};
            out.actions.emplace_back
            (
                permission_level{_self, N(active)},
                _self,                                  // account
                N(clearrange),                          // function
                std::make_tuple(payer, next_key, num)   // args
            );

            out.send((static_cast<uint128_t>(payer) << 64) | next_key,
                payer, /*replace_existing=*/ true);
        }
    }

    /// @abi action
    void printkey(uint64_t key)
    {
        auto it = m_q.find<index_key>(key);
        if(it != m_q.end()) {
            print_f("Elemen at key %: %\n", key, it->value);
        } 
        else {
            ::print("Key not found!\n");
        }
    }

    /// @abi action
    void printtop(uint64_t n_elements = 50)
    {
        auto it = m_q.begin();
        if(it != m_q.end()) {
            printrange(it->key, n_elements);
        }
        else {
            ::print("Queue is empty!");
        }
    }

    /// @abi action
    void printrange(uint64_t first_key, uint64_t num = 50)
    {
        auto it = m_q.find<index_key>(first_key);
        if(it == m_q.end()) {
            print("Invalid key or queue is empty!");
        }

        for(; it != m_q.end() && num > 0; ++it, --num) {
            print_f("[ord_idx:% key:% val: %]\n", it.internal_idx(), it->key, it->value);
        }
    }

    /// @abi action
    void runtests(account_name payer)
    { 
        eosio_assert(m_q.empty(), "Queue must be empty in order to run the tests!");

        queue_value qv1 { 1,      62651      };
        queue_value qv2 { 62262,  65654      };
        queue_value qv3 { 554654, 565        };
        queue_value qv4 { 489912, 1652556454 };
        queue_value qv5 { 120654, 0          };

        // Fill queue
        m_q.push(payer, qv1);
        m_q.push(payer, qv2);
        m_q.push(payer, qv3);
        m_q.push(payer, qv4);
        m_q.emplace(payer, qv5.key, qv5.value);

        // Iterate through queue
        {
            auto it = m_q.begin();
            eosio_assert(*it == qv1            , "*it ==  qv1");
            eosio_assert(it.internal_idx() == 0, "it.internal_idx() == 0");

            it++;
            eosio_assert(*it == qv2            , "*it ==  qv2");
            eosio_assert(it.internal_idx() == 1, "it.internal_idx() == 1");

            it++;
            eosio_assert(*it == qv3            , "*it ==  qv3");
            eosio_assert(it.internal_idx() == 2, "it.internal_idx() == 2");

            it++;
            eosio_assert(*it == qv4            , "*it ==  qv4");
            eosio_assert(it.internal_idx() == 3, "it.internal_idx() == 3");

            it++;
            eosio_assert(*it == qv5            , "*it ==  qv5");
            eosio_assert(it.internal_idx() == 4, "it.internal_idx() == 4");

            it++;
            eosio_assert(it == m_q.end(), "it == m_q.end()");

            // Revrse
            --it;
            eosio_assert(*it == qv5            , "*it ==  qv5");
            eosio_assert(it.internal_idx() == 4, "it.internal_idx() == 4");

            --it;
            eosio_assert(*it == qv4            , "*it ==  qv4");
            eosio_assert(it.internal_idx() == 3, "it.internal_idx() == 3");

            --it;
            eosio_assert(*it == qv3            , "*it ==  qv3");
            eosio_assert(it.internal_idx() == 2, "it.internal_idx() == 2");

            --it;
            eosio_assert(*it == qv2            , "*it ==  qv2");
            eosio_assert(it.internal_idx() == 1, "it.internal_idx() == 1");

            --it;
            eosio_assert(*it == qv1            , "*it ==  qv1");
            eosio_assert(it.internal_idx() == 0, "it.internal_idx() == 0");

            // zig-zag
            eosio_assert(*(++it) == qv2, "*(++it) == qv2");

            it--;
            eosio_assert(*(it) == qv1, "*(++it) == qv1");
            eosio_assert(it->key == qv1.key, "it->key == qv1.key");
            eosio_assert(it->value == qv1.value, "it->value == qv1.value");
        }

        // check top element
        eosio_assert(m_q.top() != m_q.end()       , "m_q.top() != m_q.end()");
        eosio_assert(*m_q.top() ==  qv1           , "m_q.top() ==  qv1");
        eosio_assert(m_q.top().internal_idx() == 0, "m_q.top().interest_idx() == 0");
        eosio_assert(m_q.begin() == m_q.top()     , "m_q.begin() == m_q.top()");

        // Get queue element by key
        auto qv1_it = m_q.find<index_key>(qv1.key);
        eosio_assert(qv1_it != m_q.end()             , "qv1_it != m_q.end()");
        eosio_assert(m_q.contains<index_key>(qv1.key), "m_q.contains<index_key>(qv1.key)");
        eosio_assert(*qv1_it == qv1                  , "*qv1_it == qv1");
        eosio_assert(qv1_it.internal_idx() == 0      , "qv1_it.internal_idx() == 0");
        eosio_assert(qv1_it == m_q.top()             , "qv1_it == m_q.top()");

        auto qv2_it = m_q.find<index_key>(qv2.key);
        eosio_assert(qv2_it != m_q.end()             , "qv2_it != m_q.end()");
        eosio_assert(m_q.contains<index_key>(qv2.key), "m_q.contains<index_key>(qv2.key)");
        eosio_assert(*qv2_it == qv2                  , "*qv2_it == qv2");
        eosio_assert(qv2_it.internal_idx() == 1      , "qv2_it.internal_idx() == 1");

        auto qv3_it = m_q.find<index_key>(qv3.key);
        eosio_assert(qv3_it != m_q.end()             , "qv3_it != m_q.end()");
        eosio_assert(m_q.contains<index_key>(qv3.key), "m_q.contains<index_key>(qv3.key)");
        eosio_assert(*qv3_it == qv3                  , "*qv3_it == qv3");
        eosio_assert(qv3_it.internal_idx() == 2      , "qv3_it.internal_idx() == 2");

        auto qv4_it = m_q.find<index_key>(qv4.key);
        eosio_assert(qv4_it != m_q.end()             , "qv4_it != m_q.end()");
        eosio_assert(m_q.contains<index_key>(qv4.key), "m_q.contains<index_key>(qv1.key)");
        eosio_assert(*qv4_it == qv4                  , "*qv4_it == qv4");
        eosio_assert(qv4_it.internal_idx() == 3      , "qv4_it.internal_idx() == 3");

        auto qv5_it = m_q.find<index_key>(qv5.key);
        eosio_assert(qv5_it != m_q.end()             , "qv5_it != m_q.end()");
        eosio_assert(m_q.contains<index_key>(qv5.key), "m_q.contains<index_key>(qv5.key)");
        eosio_assert(*qv5_it == qv5                  , "*qv5_it == qv5");
        eosio_assert(qv5_it.internal_idx() == 4      , "qv5_it.internal_idx() == 4");

        // remove top element
        auto opt = m_q.pop();
        qv1_it = m_q.find<index_key>(qv1.key);
        eosio_assert(opt.valid()                      , "opt.valid()");
        eosio_assert(*opt == qv1                      , "*opt == qv1");
        eosio_assert(qv1_it == m_q.end()              , "qv1_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv1.key), "!m_q.contains<index_key>(qv1.key)");
        eosio_assert(*m_q.top() == qv2                , "*m_q.top() == qv2");

        // Erase qv4
        qv4_it = m_q.find<index_key>(qv4.key);
        eosio_assert(*qv4_it == qv4, "*qv4_it == qv4");

        qv5_it = m_q.erase(qv4_it);
        qv4_it = m_q.find<index_key>(qv4.key);
        eosio_assert(qv4_it == m_q.end()              , "qv4_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv4.key), "!m_q.contains<index_key>(qv1.key)");
        eosio_assert(*qv5_it == qv5                   , "*qv5_it == qv5");
        eosio_assert(*m_q.top() == qv2                , "*m_q.top() == qv2");
        eosio_assert(*(++m_q.begin()) == qv3          , "*(++m_q.begin()) == qv3");
        eosio_assert(*(++(++m_q.begin())) == qv5      , "*(++(++m_q.begin())) == qv5");

        // Add qv6
        queue_value qv6 { 985798, 1264257};
        m_q.push(payer, qv6);
        eosio_assert(*m_q.top() == qv2, "*m_q.top() == qv2");
        eosio_assert(*(--m_q.end()) == qv6, "*(--m_q.end()) == qv6");

        auto qv6_it = m_q.find<index_key>(qv6.key);
        eosio_assert(qv6_it != m_q.end()             , "qv6_it != m_q.end()");
        eosio_assert(qv6_it.internal_idx() == 5      , "qv6_it.internal_idx() == 5");
        eosio_assert(m_q.contains<index_key>(qv6.key), "m_q.contains<index_key>(qv6.key)");

        // Remove qv2
        opt = m_q.pop();
        qv2_it = m_q.find<index_key>(qv2.key);
        eosio_assert(opt.valid()                      , "opt.valid()");
        eosio_assert(*opt == qv2                      , "*opt == qv2");
        eosio_assert(qv2_it == m_q.end()              , "qv2_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv2.key), "!m_q.contains<index_key>(qv2.key)");
        eosio_assert(*m_q.top() == qv3                , "*m_q.top() == qv3");
        eosio_assert(*(++m_q.begin()) == qv5          , "*(++m_q.begin()) == qv5");
        eosio_assert(*(++(++m_q.begin())) == qv6      , "*(++(++m_q.begin())) == qv6");

        // Remove qv6
        qv6_it = --m_q.end();
        qv6_it = m_q.erase(qv6_it);
        eosio_assert(qv6_it == m_q.end()  , "qv6_it == m_q.end()");
        eosio_assert(*(--m_q.end()) == qv5, "*(--m_q.end()) == qv5");

        // Add qv7
        queue_value qv7 { 325, 652674};
        m_q.push(payer, qv7);
        eosio_assert(*m_q.top() == qv3    , "*m_q.top() == qv3");
        eosio_assert(*(--m_q.end()) == qv7, "*(--m_q.end()) == qv7");

        auto qv7_it = m_q.find<index_key>(qv7.key);
        eosio_assert(qv7_it != m_q.end()             , "qv7_it != m_q.end()");
        eosio_assert(qv7_it.internal_idx() == 5      , "qv7_it.internal_idx() == 7");
        eosio_assert(m_q.contains<index_key>(qv7.key), "m_q.contains<index_key>(qv7.key)");

        // Remove qv3
        opt = m_q.pop();
        qv3_it = m_q.find<index_key>(qv3.key);
        eosio_assert(opt.valid()                      , "opt.valid()");
        eosio_assert(*opt == qv3                      , "*opt == qv3");
        eosio_assert(qv3_it == m_q.end()              , "qv3_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv3.key), "!m_q.contains<index_key>(qv3.key)");
        eosio_assert(*m_q.top() == qv5                , "*m_q.top() == qv5");
        eosio_assert(*(++m_q.begin()) == qv7          , "*(++m_q.begin()) == qv7)");
        eosio_assert((++(++m_q.begin())) == m_q.end() , "(++(++m_q.begin())) == m_q.end()");

        // Remove qv5
        opt = m_q.pop();
        qv5_it = m_q.find<index_key>(qv5.key);
        eosio_assert(opt.valid()                      , "opt.valid()");
        eosio_assert(*opt == qv5                      , "*opt == qv5");
        eosio_assert(qv5_it == m_q.end()              , "qv5_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv5.key), "!m_q.contains<index_key>(qv5.key)");
        eosio_assert(*m_q.top() == qv7                , "*m_q.top() == qv7");
        eosio_assert(++m_q.begin() == m_q.end()       , "++m_q.begin() == m_q.end()");

        // Remove qv7
        opt = m_q.pop();
        qv7_it = m_q.find<index_key>(qv7.key);
        eosio_assert(opt.valid()                      , "opt.valid()");
        eosio_assert(*opt == qv7                      , "*opt == qv7");
        eosio_assert(qv7_it == m_q.end()              , "qv7_it == m_q.end()");
        eosio_assert(!m_q.contains<index_key>(qv7.key), "!m_q.contains<index_key>(qv7.key)");

        // Check that queue is empty
        eosio_assert(m_q.top() == m_q.end()  , "m_q.top() == m_q.end()");
        eosio_assert(m_q.begin() == m_q.end(), "m_q.begin() == m_q.end()");
        eosio_assert(m_q.empty()             , "m_q.empty()");

        print("All tests have passed!");
    }

    /// @abi action
    void onerror() // handle deferred transaction error
    {
        auto error = onerror::from_current_action();
        ::print_f("Error occoured! sender_id:%", error.sender_id);

        auto error_trx = error.unpack_sent_trx();
        for(const auto& a : error_trx.actions) 
        {
            print_f("account: %\n", name{a.account});
            print_f("name: %\n", name{a.name});
        }
    }

private:
    q_t::const_iterator eraser(uint64_t first_key, uint64_t num)
    {
        auto it = m_q.find<index_key>(first_key);
        for(; it != m_q.end() && num > 0; --num) {
            it = m_q.erase(it);
        }
        return it;
    }

private:
    static uint64_t get_random_key(uint128_t seed)
    {
        uint128_t data = now() + seed;
        checksum256 cs = {0};
        sha256(reinterpret_cast<char*>(&data), sizeof(data), &cs);
        return static_cast<uint64_t>(cs.hash[0]);
    }

private:
    q_t m_q;
};

EOSIO_ABI( queue_test, (push)(pop)(top)(bottom)(fill)(remove)(clear)(clearrange)(printkey)(printtop)(printrange)(runtests)(onerror) )