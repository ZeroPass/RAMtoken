cmake_minimum_required(VERSION 3.5)
project(eosram.token VERSION 1.0.0)

# if no wasm root is given use default path
if(EOSIO_CDT_ROOT STREQUAL "" OR NOT EOSIO_CDT_ROOT)
   set(EOSIO_CDT_ROOT "/usr/local/eosio.cdt")
endif()

# append the path to the module to include
list(APPEND CMAKE_MODULE_PATH ${EOSIO_CDT_ROOT}/lib/cmake)

#include the toolchain cmake
include(EosioWasmToolchain)

set(CMAKE_CXX_FLAGS " -abigen ${CMAKE_CXX_FLAGS} ")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../../bin/token")
add_executable(${PROJECT_NAME}.wasm eosram.token.cpp )
