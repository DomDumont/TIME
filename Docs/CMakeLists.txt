cmake_minimum_required(VERSION 2.8.12)

FIND_PROGRAM(PANDOC pandoc)

mark_as_advanced(PANDOC)

IF(NOT PANDOC)
  message(FATAL_ERROR  "ben il n'y a pas pandoc c'est balo")
else()
    message("cool il y a pandoc sur cette bécane")
ENDIF()

file(

        GLOB_RECURSE
        MD_FILES
        Sources/*.md
)

set(rototo)
foreach(loop_var ${MD_FILES})
	file(TO_NATIVE_PATH ${loop_var} toto)
	set (rototo ${rototo} ${toto})
endforeach(loop_var)


string (REPLACE ";" "  " MD_FILES_STR "${rototo}")
message (${MD_FILES_STR})

    add_custom_command(
        OUTPUT  html/out.html
        DEPENDS ${MD_FILES}
        COMMAND ${PANDOC} ${MD_FILES} -o html/out.html
        )


add_custom_target(docs
    ALL
    DEPENDS html/out.html
    )
