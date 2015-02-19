find_program(PANDOC pandoc)
mark_as_advanced(PANDOC)

IF(NOT PANDOC)
  message(FATAL_ERROR  "ben il n'y a pas pandoc c'est balo")
else()
    message("cool il y a pandoc sur cette bécane")
ENDIF()



#-----------------------------------------------------------------------------#
set(all_docs_sources)
set(all_docs)

function(pandoc source output) # extraargs...
#    set(abs_source ${CMAKE_CURRENT_SOURCE_DIR}/${source})
#   set(abs_output ${CMAKE_CURRENT_BINARY_DIR}/${output})

    # Use native Windows syntax to avoid "c:/foo.txt" being treated as a
    # remote URI by Pandoc 1.5 and 1.6.
    file(TO_NATIVE_PATH ${source} abs_source_native)

    list(APPEND all_docs ${output})
    set(all_docs ${all_docs} PARENT_SCOPE)

    add_custom_command(
        OUTPUT  ${output}
        DEPENDS ${source}
        COMMAND ${PANDOC} ${abs_source_native} --toc --standalone ${ARGN}
                -o ${output}
        )
endfunction(pandoc source output)

#-----------------------------------------------------------------------------#
function(cat IN_FILE OUT_FILE)
    list(APPEND all_docs_sources ${IN_FILE})
    set(all_docs_sources ${all_docs_sources} PARENT_SCOPE)    
  file(READ ${IN_FILE} CONTENTS)
  file(APPEND ${OUT_FILE} "${CONTENTS}")
endfunction()



file(

        GLOB_RECURSE
        source_files
        Sources/*.md
)

set(MERGED_FILE "${CMAKE_CURRENT_BINARY_DIR}/merged.md")



# Prepare a temporary file to "cat" to:
file(WRITE ${MERGED_FILE} "")

# Call the "cat" function for each input file
foreach(MD_FILE  ${source_files})
  cat(${MD_FILE} ${MERGED_FILE})
endforeach()


pandoc(${MERGED_FILE}  html/out.html )




add_custom_target(docs
    ALL
    DEPENDS ${all_docs} ${all_docs_sources}
    )
