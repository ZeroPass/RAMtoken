#pragma once
#include <algorithm>
#include <cctype>
#include <string>
#include <string_view>
#include <utility>

#include "memo_cmd.hpp"
#include "memo_cmd_cancel_order.hpp"
#include "memo_cmd_make_order.hpp"
#include "../../log.hpp"

namespace eosram {
    class memo_parser
    {
    public:
        memo_parser(std::string memo)
        {
            eosio_assert(memo.size() <= 256, "memo_parser: memo has more than 256 bytes");
            std::transform(memo.begin(), memo.end(), memo.begin(), ::tolower);
            memo_ = std::move(memo);
            parse_cmd_type();
        }

        memo_cmd_type memo_cmd_type() const
        {
            return cmd_;
        }

        auto memo_cmd_type_as_int() const
        {
            return memo_cmd_type_to_int(cmd_);
        }

        template<typename T>
        T get()
        {
            DEBUG_ASSERT(T::type() == cmd_, "memo_parser::get: Invalid type!");
            return memo_cmd<T>::parse(memo_, ofs_);
        }

    private:
        void parse_cmd_type()
        {
            // cancel_order cmd
            if(memo_starts_with(memo_cmd_cancel_order::cmd_tag())) 
            {
                auto cmd_tag = memo_cmd_cancel_order::cmd_tag();
                auto delim = memo_cmd_cancel_order::arg_delim();

                eosio_assert(memo_contains_at(delim, cmd_tag.size()), "memo_parser: Invalid arg delimiter!");

                cmd_ = memo_cmd_cancel_order::type();
                ofs_ = cmd_tag.size() + delim.size();
                ofs_ = std::min(ofs_, memo_.size());
            } 
            else { // make_order cmd
                cmd_ = memo_cmd_make_order::type();
            }
        }

    private:
        bool memo_starts_with(std::string_view str)
        {
            auto pos = memo_.find(str);
            return pos != memo_.npos && pos == 0;
        }

        bool memo_contains_at(std::string_view str, std::size_t ofs = 0)
        {
            return str_contains_at(memo_, ofs, str);
        }

    private:
        ::eosram::memo_cmd_type cmd_;
        std::string memo_;
        std::size_t ofs_ = 0;
    };
}