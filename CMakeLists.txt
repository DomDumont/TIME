project (TIME)

cmake_minimum_required(VERSION 2.8)

# Set CMake modules search path
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)

# Include TIME Cmake common module
include (common)

add_subdirectory (Sources)
add_subdirectory (Extern)

