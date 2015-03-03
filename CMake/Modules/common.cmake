# Macro for checking the SOURCE_FILES variable is properly initialized
macro (check_source_files)
    if (NOT SOURCE_FILES)
        message (FATAL_ERROR "Could not configure and generate the project file because no source files have been defined yet. "
            "You can define the source files explicitly by setting the SOURCE_FILES variable in your CMakeLists.txt; or ")
    endif ()
endmacro ()


if (LINUX)
    message("Add TIME_LINUX preprocessor definition")
    add_definitions(-DTIME_LINUX)
endif()
if (WINDOWS)
    message("Add TIME_WINDOWS preprocessor definition")
    add_definitions(-DTIME_WINDOWS)
endif()


if (LINUX)

     if (TE_64BITS)
            set_property (GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS TRUE)
        else()
            set_property (GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
        endif ()


    set (CMAKE_BUILD_TYPE Debug)


    # execute_process (COMMAND echo COMMAND ${CMAKE_C_COMPILER} -E -dM - OUTPUT_VARIABLE PREDEFINED_MACROS ERROR_QUIET)
    # string (REGEX MATCH "#define +__(x86_64|aarch64)__ +1" matched "${PREDEFINED_MACROS}")
    # if (matched)
    # set (TE_64BITS TRUE)
    # else ()
    # set (TE_64BITS FALSE)
    # endif ()

    set (TE_64BITS FALSE)

     if (TE_64BITS)
    	message ("wouesh on passe en 64 bits !!!")
    	set (DASH_MBIT -m64) # This variable is intentionally not defined on Android and RPI platform
    else ()
    	message ("wouesh on passe en 33 bits !!!")
    	set (DASH_MBIT -m32)
    endif ()

    set (CMAKE_C_FLAGS_DEBUG  "${CMAKE_C_FLAGS_DEBUG} ${DASH_MBIT}")
    message("ici => ${CMAKE_C_FLAGS_DEBUG}")
    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${DASH_MBIT}")
    message("ici => ${CMAKE_CXX_FLAGS_DEBUG}")
    set (CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} ${DASH_MBIT}")
    set (CCMAKE_EXE_LINKER_FLAGS_DEBUG "${CCMAKE_EXE_LINKER_FLAGS_DEBUG} ${DASH_MBIT}")
    set (CMAKE_MODULE_LINKER_FLAGS_DEBUG "${CMAKE_MODULE_LINKER_FLAGS_DEBUG} ${DASH_MBIT}")

endif()