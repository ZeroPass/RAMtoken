cmake_minimum_required(VERSION 3.5)
project(eosram.token VERSION 1.0.0)

option(GEN_ABI "Generate ABI" OFF)

find_package(eosio.cdt)

if(GEN_ABI)
    add_contract(${PROJECT_NAME} ${PROJECT_NAME} eosram.token.cpp)
else()
    add_executable(${PROJECT_NAME}.wasm eosram.token.cpp)
endif()

