cmake_minimum_required(VERSION 2.8)


if (WIN32)
    message("coucou")
    add_custom_target(libEGL
                      COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/x86/libEGL.dll ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/
                      COMMENT "Copying ${qtlib}${TYPE}4.dll to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/")

    add_custom_target(libGLESv2
                      COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/x86/libGLESv2.dll ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/
                      COMMENT "Copying ${qtlib}${TYPE}4.dll to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/")

endif()