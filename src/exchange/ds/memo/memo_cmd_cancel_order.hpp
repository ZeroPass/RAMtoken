#pragma once
#include "../../constants.hpp"
#include "../../utils.hpp"

#include <eosiolib/types.h>
#include <string>
#include <string_view>

namespace eosram::ds {
    using namespace std::string_view_literals;

    class memo_cmd_cancel_order : public memo_cmd<memo_cmd_cancel_order>
    {
    public:
        static constexpr memo_cmd_type type() {
            return memo_cmd_type(0xcca6ece1);
        }

        static constexpr std::string_view cmd_tag() {
            return "cancel"sv;
        }

        static constexpr std::string_view arg_delim() {
            return ":"sv;
        }

        memo_cmd_cancel_order(transaction_id_type txid) :
            txid_(txid)
        {}

        transaction_id_type txid() const {
            return txid_;
        }

        std::string to_string() const
        {
            std::string memo;
            memo.append(cmd_tag())
                .append(arg_delim())
                .append(to_hex(txid_));
            return memo;
        }

        static memo_cmd_cancel_order parse(const std::string& memo, std::size_t& ofs)
        {
            eosio_assert(ofs + sizeof(txid_) * 2 == memo.size(), "memo_cmd_cancel_order: Invalid transaction id!");

            memo_cmd_cancel_order cancel_cmd;
            cancel_cmd.txid_ = from_hex<transaction_id_type>(memo, ofs);
            return cancel_cmd;
        }

    private:
        memo_cmd_cancel_order() = default;
        transaction_id_type txid_;
    };
}
