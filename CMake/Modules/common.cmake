# Macro for checking the SOURCE_FILES variable is properly initialized
macro (check_source_files)
    if (NOT SOURCE_FILES)
        message (FATAL_ERROR "Could not configure and generate the project file because no source files have been defined yet. "
            "You can define the source files explicitly by setting the SOURCE_FILES variable in your CMakeLists.txt; or ")
    endif ()
endmacro ()
