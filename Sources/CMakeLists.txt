cmake_minimum_required(VERSION 2.8)
project (Engine)


include_directories ("./Platform")
include_directories ("./Utils")


FILE(GLOB Platform_Windows_CPP "./Platform/Windows/*.cpp")
FILE(GLOB Platform_Linux_CPP "./Platform/Linux/*.cpp")
FILE(GLOB Utils_Windows_CPP "./Utils/Windows/*.cpp")
FILE(GLOB Utils_Linux_CPP "./Utils/Linux/*.cpp")
FILE(GLOB Common_CPP "./*.cpp")

set (All_CPP ${Common_CPP} )
if (LINUX)
  message("this is linux so we add linux cpp files")
  set(All_CPP ${All_CPP} ${Platform_Linux_CPP} ${Utils_Linux_CPP})  
endif()

if (WINDOWS)
  message("this is windows")
  set(All_CPP ${All_CPP} ${Platform_Windows_CPP} ${Utils_Windows_CPP})  
endif()


  
add_executable(Engine ${All_CPP})

if (WINDOWS)
  target_link_libraries(Engine opengl32.lib)
  if(MSVC) # Check if we are using the Visual Studio compiler
    set_target_properties(Engine PROPERTIES LINK_FLAGS_RELEASE "/SUBSYSTEM:WINDOWS")
    set_target_properties(Engine PROPERTIES LINK_FLAGS_DEBUG "/SUBSYSTEM:WINDOWS")
  endif()

endif()


SET(CPACK_GENERATOR "ZIP")
INSTALL(TARGETS Engine DESTINATION rototo) 
INCLUDE(CPack)

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

