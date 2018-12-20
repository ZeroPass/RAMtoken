cmake_minimum_required(VERSION 3.5)
project(eosram.exchange VERSION 1.0.0)

option(GEN_ABI "Generate ABI" OFF)

if(NOT RAM_TOKEN_CONTRACT)
    message(SEND_ERROR "RAM_TOKEN_CONTRACT - RAM token contract is not set")
    set(RAM_TOKEN_CONTRACT "" CACHE STRING "RAM token contract name")
else()
    configure_file ("constants.hpp.in"
        "${CMAKE_CURRENT_SOURCE_DIR}/constants.hpp"
        @ONLY
    )
endif()

if(CMAKE_BUILD_TYPE MATCHES Debug)
    add_compile_definitions(DEBUG=1)
    message(WARNING "Debug mode is enabled!")
endif()

find_package(eosio.cdt)

if(GEN_ABI)
    add_contract(${PROJECT_NAME} ${PROJECT_NAME}
        eosram.exchange.cpp
        ds/ram_exchange_state.cpp
    )
else()
    add_executable(${PROJECT_NAME}.wasm
        eosram.exchange.cpp
        ds/ram_exchange_state.cpp
    )
endif()
