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

if(CMAKE_BUILD_TYPE EQUAL "DEBUG")
    add_compile_definitions(DEBUG=1)
endif()

set(CMAKE_CXX_STANDARD 17)  # require C++17 std
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# if no wasm root is given use default path
if(EOSIO_CDT_ROOT STREQUAL "" OR NOT EOSIO_CDT_ROOT)
   set(EOSIO_CDT_ROOT "/usr/local/eosio.cdt")
endif()

# append the path to the module to include
list(APPEND CMAKE_MODULE_PATH ${EOSIO_CDT_ROOT}/lib/cmake)

#include the toolchain cmake
include(EosioWasmToolchain)

if(GEN_ABI)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --abigen")
endif()

add_executable(${PROJECT_NAME}.wasm 
    "eosram.exchange.cpp" 
    "ds/ram_exchange_state.cpp" 
)
