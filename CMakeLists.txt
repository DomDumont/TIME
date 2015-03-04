project (TIME)


cmake_minimum_required(VERSION 2.8)

# Set CMake modules search path
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)

#set_property (GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS OFF)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libdom)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libdom)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bindom)

option(FORCE_WINDOWS "ForceWindows" OFF)
option(FORCE_LINUX "ForceLinux" OFF)

message("env linux =  $ENV{LINUX}")
message("env windows =  $ENV{WINDOWS}")

if (FORCE_WINDOWS OR "$ENV{WINDOWS}" STREQUAL "1" )
  message('Windows forced or detected')
  set(WINDOWS TRUE)
endif()

if (FORCE_LINUX OR "$ENV{LINUX}" STREQUAL "1" )
  message('Linux forced or detected')
  set(LINUX TRUE)
endif()



# Include TIME Cmake common module
include (common)

add_subdirectory (Sources)
#add_subdirectory (Docs)
add_subdirectory (Extern)

