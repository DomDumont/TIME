cmake_minimum_required(VERSION 2.8)
project (Engine)


include_directories ("./Platform")
include_directories ("./Utils")


    file(

            GLOB_RECURSE
            source_files
            ./*
    )

    set(source_files ${source_files} Main.cpp)
    add_executable(Engine ${source_files})


# if (LINUX)

#     if (TE_64BITS)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86-64/libEGL.so)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86-64/libGLESv2.so)
#     else()
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libEGL.so)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libGLESv2.so)
#     endif()

#         find_package (OpenGL REQUIRED)
#         include_directories (${OpenGL_INCLUDE_DIRS})
#         find_package (X11 REQUIRED)
#         include_directories (${X11_INCLUDE_DIRS})

#         if(NOT X11_FOUND)
#             message(FATAL_ERROR "Failed to find X11 which is required to build nsu")
#         endif(NOT X11_FOUND)

#         message("PREFIX PATH ="  "$ENV{CMAKE_PREFIX_PATH}")
#         message("X11 Librairies = " "${X11_LIBRARIES}")
#         message("X11 Libs = " "${X11_LIBS}")
#         target_link_libraries (Engine  ${X11_LIBRARIES})
#         set (EXTRA_LIBS ${EXTRA_LIBS} PugiXml) #Add PugiXml to EXTRA_LIBS
#         target_link_libraries (Engine  ${EXTRA_LIBS})
# endif()

# if (WIN32)
#     set(TE_64BITS FALSE)
    
#     if (TE_64BITS)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86-64/libEGL.lib)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86-64/libGLESv2.lib)
#     else()
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libEGL.lib)
#         target_link_libraries(Engine ${CMAKE_CURRENT_SOURCE_DIR}/../Extern/AmdSDK/x86/libGLESv2.lib)
#     endif()

#     set (EXTRA_LIBS ${EXTRA_LIBS} PugiXml) #Add PugiXml to EXTRA_LIBS
#     target_link_libraries (Engine  ${EXTRA_LIBS})

# endif()










