# Define target name
set (TARGET_NAME PugiXml)



# Define source files
#Génération de la liste des fichiers sources

file(

        GLOB_RECURSE

        source_files

        src/*

)

add_library(

        PugiXml

        SHARED

        ${source_files}

)
