#include <eosiolib/eosio.hpp>
#include <eosiolib/multi_index.hpp>
#include <eosiolib/optional.hpp>

#include <limits>
#include <utility>
#include <type_traits>

namespace eosio {

    template<uint64_t QueueName, typename ValueType,  typename... Indices>
    class index_queue
    {
        struct qe_t
        {
            uint64_t idx;
            ValueType v;

            operator ValueType& () { return v; };
            operator const ValueType& () const { return v; };
            uint64_t primary_key() const { return idx; }
            EOSLIB_SERIALIZE(qe_t, (idx)(v));
        };
        using qi_t = multi_index<QueueName, qe_t, Indices...>;
        static constexpr auto max_idx = std::numeric_limits<uint64_t>::max() - 1;

    public:
        struct const_iterator : public std::iterator<std::bidirectional_iterator_tag, const ValueType> 
        {
            friend bool operator == ( const const_iterator& a, const const_iterator& b ) 
            {
                return a.it_ == b.it_;
            }

            friend bool operator != ( const const_iterator& a, const const_iterator& b ) 
            {
                return a.it_ != b.it_;
            }

            const ValueType& operator*() const
            {
                return it_->v; 
            }

            const ValueType* operator->() const
            {
                return &it_->v;
            }

            const_iterator operator++(int)
            {
                const_iterator result(*this);
                ++(*this);
                return result;
            }

            const_iterator operator--(int)
            {
                const_iterator result(*this);
                --(*this);
                return result;
            }

            const_iterator& operator++()
            {
                it_++;
                return *this;
            }

            const_iterator& operator--()
            {
                it_--;
                return *this;
            }

            uint64_t internal_idx() const
            {
                return it_->idx;
            }

        private:
            using qi_it_t = typename qi_t::const_iterator;
            const_iterator(qi_it_t it) : 
                it_(std::move(it)) 
            {}

            const qi_it_t& get_underlying_it() const
            {
                return it_;
            }

            operator const qi_it_t& () const
            {
                return get_underlying_it();
            }

        private:
            qi_it_t it_;
            friend class index_queue;
        };


        // Constructor
        index_queue(uint64_t code, uint64_t scope) : 
            qi_(code, scope)
        {}

        const_iterator begin() const
        {
            return qi_.begin();
        }

        const_iterator end() const
        {
            return qi_.end();
        }

        template<uint64_t IndexName, typename Key>
        bool contains(const Key& key) const
        {
            return find<IndexName>(key) != end();
        }

        bool empty() const
        {
            return qi_.begin() == qi_.end();
        }

        template<uint64_t IndexName, typename Key>
        const_iterator find(const Key& k) const
        {
            auto idx = qi_.template get_index<IndexName>();
            auto it = idx.find(k);
            if(it != idx.end()) {
                return qi_.iterator_to(*it);
            }
            return end();
        }

        uint64_t get_code() const
        {
            return qi_.get_code();
        }

        uint64_t get_scope() const
        {
            return qi_.get_scope();
        }

        template<typename ...Args>
        void emplace(account_name payer, Args&& ... args) 
        {
            push(ValueType{std::forward<Args>(args)...}, payer);
        }

        const_iterator erase(const_iterator it)
        {
            auto rit = qi_.erase(it);
            eosio_assert(it.get_underlying_it() != qi_.end(), "Queue element was not erased properly!");
            return rit;
        }

        void modify(const_iterator it, ValueType value, account_name payer) 
        {
            eosio_assert(it != end(), "Cannot modify index_queue element, invalid iterator!");
            qi_.modify(it, payer, [&](auto& qe) {
                qe.v = std::move(value);
            });
        }

        optional<ValueType> pop()
        {
            optional<ValueType> v;
            auto it = qi_.begin();
            if(it != qi_.end()) 
            {
                v = std::move(it->v);
                erase(it);
            }

            return v;
        }

        void push(ValueType value, account_name payer)
        {
            uint64_t idx = 0;
            auto it = qi_.rbegin();
            if(it != qi_.rend()) 
            {
                idx = it->idx + 1;
                eosio_assert(idx < max_idx, "Cannot push element to queue, idx is at max limit");
            }

            qi_.emplace(payer, [&](auto& qe) {
                qe.idx = idx;
                qe.v = std::move(value);
            });
        }

        const_iterator top() const
        {
            return qi_.begin();
        }

    private:
        qi_t qi_;
    };
}