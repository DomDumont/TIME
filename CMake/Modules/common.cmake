# Macro for checking the SOURCE_FILES variable is properly initialized
macro (check_source_files)
    if (NOT SOURCE_FILES)
        message (FATAL_ERROR "Could not configure and generate the project file because no source files have been defined yet. "
            "You can define the source files explicitly by setting the SOURCE_FILES variable in your CMakeLists.txt; or ")
    endif ()
endmacro ()

# execute_process (COMMAND echo COMMAND ${CMAKE_C_COMPILER} -E -dM - OUTPUT_VARIABLE PREDEFINED_MACROS ERROR_QUIET)
# string (REGEX MATCH "#define +__(x86_64|aarch64)__ +1" matched "${PREDEFINED_MACROS}")
# if (matched)
# set (TE_64BITS TRUE)
# else ()
# set (TE_64BITS FALSE)
# endif ()

 if (TE_64BITS)
	message ("wouesh on passe en 64 bits !!!")
	set (DASH_MBIT -m64) # This variable is intentionally not defined on Android and RPI platform
else ()
	message ("wouesh on passe en 32 bits !!!")
	set (TE_MBIT -m32)
endif ()

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${DASH_MBIT}")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${DASH_MBIT}")
set (CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${DASH_MBIT}")
set (CCMAKE_EXE_LINKER_FLAGS "${CCMAKE_EXE_LINKER_FLAGS} ${DASH_MBIT}")
set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${DASH_MBIT}")

