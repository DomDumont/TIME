project (TIME)


cmake_minimum_required(VERSION 2.8)

# Pour voir ce qu'il se passe

set ( CMAKE_VERBOSE_MAKEFILE true )



# Test

if (MINGW)
    message ("Oh Oh MINGW ONLY")
endif ()

if (CMAKE_CROSSCOMPILING)
    message ("Oh Oh CMAKE_CROSSCOMPILING ONLY")
endif ()


if (MINGW AND CMAKE_CROSSCOMPILING)
    message ("Oh Oh MINGW AND CMAKE_CROSSCOMPILING")
    set (MINGW_PREFIX "" CACHE STRING "Prefix path to MinGW cross-compiler tools (MinGW cross-compiling build only)")
    set (MINGW_SYSROOT "" CACHE PATH "Path to MinGW system root (MinGW cross-compiling build only)")
endif ()



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
  message("Windows forced or detected")
  set(WINDOWS TRUE)
endif()

if (FORCE_LINUX OR "$ENV{LINUX}" STREQUAL "1" )
  message("Linux forced or detected")
  set(LINUX TRUE)
endif()



# Include TIME Cmake common module
include (common)

add_subdirectory (Sources)
#add_subdirectory (Docs)
add_subdirectory (Extern)

