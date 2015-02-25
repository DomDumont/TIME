project (TIME)

cmake_minimum_required(VERSION 2.8.12)

# Set CMake modules search path
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)


set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libdom)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libdom)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bindom)


# Include TIME Cmake common module
include (common)

add_subdirectory (Sources)
add_subdirectory (Docs)
add_subdirectory (Extern)

