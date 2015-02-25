cmake_minimum_required(VERSION 2.8)
project (Engine)


include_directories ("../Extern/PugiXml/src")
include_directories ("../Extern/AmdSDK/include")
include_directories ("./Platform")

file(

        GLOB_RECURSE
        source_files
        Platform/Linux/*
)

message("coucou 1 : " "${source_files}")
set(source_files ${source_files} Main.cpp)
message("coucou 2 : " "${source_files}")

add_executable(Engine ${source_files})

set (EXTRA_LIBS ${EXTRA_LIBS} PugiXml) #Add PugiXml to EXTRA_LIBS

target_link_libraries (Engine  ${EXTRA_LIBS})
target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libEGL.so)
target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libGLESv2.so)

find_package(X11)

  if(NOT X11_FOUND)
    message(FATAL_ERROR "Failed to find X11 which is required to build nsu")
  endif(NOT X11_FOUND)

target_link_libraries (Engine  ${X11_LIBRARIES})

