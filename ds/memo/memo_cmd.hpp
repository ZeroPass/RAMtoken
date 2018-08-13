#pragma once
#include <string>
#include <string_view>

namespace eosram {
    enum class memo_cmd_type {};

    constexpr auto memo_cmd_type_to_int(memo_cmd_type t) 
    {
        return static_cast<std::underlying_type<
            memo_cmd_type>::type>(t);
    }

    /* CRTP interface for memo command */
    template<typename T>
    class memo_cmd
    {
    public:
        static constexpr memo_cmd_type type() {
            return T::type();
        }

        static constexpr auto type_as_int() {
            return memo_cmd_type_to_int(type());
        }

        static constexpr std::string_view cmd_type_tag() {
            return T::cmd_type_tag();
        }

        static constexpr std::string_view arg_delim() {
            return T::arg_delim();
        }

    protected:
        static T parse(const std::string& memo, std::size_t& ofs) {
            return T::parse(memo, ofs);
        }
    
    private:
        memo_cmd() = default;
        friend T;
        friend class memo_parser;
    };
}