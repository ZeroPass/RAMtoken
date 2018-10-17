#pragma once
#include "../../order_utils.hpp"
#include "../../types.hpp"
#include "../../utils.hpp"

#include <string>
#include <string_view>

namespace eosram::ds {
    using namespace std::string_view_literals;

    class memo_cmd_make_order : public memo_cmd<memo_cmd_make_order>
    {
    public:
        static constexpr memo_cmd_type type() {
            return memo_cmd_type(0xc02de2);
        }

        static constexpr std::string_view cmd_tag() {
            return ""sv;
        }

        static constexpr std::string_view arg_delim() {
            return ","sv;
        }

        static constexpr std::string_view arg_convert_tag() {
            return "convert"sv;
        }

        memo_cmd_make_order(ttl_t ttl = infinite_ttl, bool force_convert = false)
        {
            set_ttl(ttl);
            set_convert(force_convert);
        }

        ttl_t ttl() const
        {
            return ttl_;
        }

        bool convert_on_expire() const
        {
            return convert_;
        }

        static memo_cmd_make_order parse(const std::string& memo, std::size_t& ofs)
        {
            memo_cmd_make_order order_cmd;
            if(memo.empty()) {
                return order_cmd; // return default cmd
            }

            // Parse ttl
            std::size_t parse_pos = 0UL;
            const ttl_t ttl = to_number(memo, &parse_pos);
            order_cmd.set_ttl(ttl);

            // Verify parser state
            eosio_assert(parse_pos != 0, "memo_cmd_make_order: Invalid memo!");

            const bool is_at_end = parse_pos == memo.size();
            eosio_assert(is_at_end || str_contains_at(memo, parse_pos++, arg_delim()),
                "memo_cmd_make_order: Invalid arg delim!");

            // Check for convert arg
            if(!is_at_end)
            {
                const bool has_arg = str_contains_at(memo, parse_pos, arg_convert_tag());
                eosio_assert(has_arg && ( parse_pos + arg_convert_tag().size() ) == memo.size(), 
                    "memo_cmd_make_order: Invalid argument!");

                order_cmd.set_convert(true);
            }
            else if(req_convert_on_ote) {
                eosio_assert(!is_ote_order(order_cmd.ttl()), "OTE order requires arg 'convert'");
            }

            return order_cmd;
        }

        std::string to_string() const
        {
            std::string memo(cmd_tag());
            if(!ttl_infinite(ttl_)) 
            {
                memo.append(eosram::to_string(ttl_));
                if(convert_) 
                {
                    memo.append(arg_delim());
                    memo.append(arg_convert_tag());
                }
            }

            return memo;
        }

    private:
        void set_ttl(ttl_t ttl)
        {
            eosio_assert(ttl_valid(ttl), "memo_cmd_make_order: Invalid TTL!");
            ttl_ = std::max(ttl, infinite_ttl);
            set_convert(convert_); // reset convert on expire if ttl is infinite
        }

        void set_convert(bool force_convert)
        {
            convert_ = ttl_infinite(ttl_) ? false : force_convert;
        }

    private:
        ttl_t ttl_;
        bool convert_;
    };
}
