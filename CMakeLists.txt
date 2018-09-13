cmake_minimum_required(VERSION 3.5)
project(eos_ram_t_e VERSION 1.0.0)

option(BUILD_TOKEN "Build ram.token" ON)
option(BUILD_EXCHANGE "Build ram.exchange" ON)

if(NOT CMAKE_BINARY_DIR)
    set(CMAKE_BINARY_DIR bin)
endif()

if(BUILD_TOKEN)
    add_subdirectory(src/token)
endif()

if(BUILD_EXCHANGE)
    add_subdirectory(src/exchange)
endif()
