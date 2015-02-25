cmake_minimum_required(VERSION 2.8.12)
project (Engine)

#include_directories ("../Extern/PugiXml/src")
add_executable(Engine Main.cpp)

set (EXTRA_LIBS ${EXTRA_LIBS} PugiXml) #Add PugiXml to EXTRA_LIBS

target_link_libraries (Engine  ${EXTRA_LIBS})
