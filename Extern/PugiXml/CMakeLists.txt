# Define target name
set (TARGET_NAME PugiXml)

set(_INSTALL_LIBS "PugiXml")

# Define source files
#Génération de la liste des fichiers sources

file(

        GLOB_RECURSE
        source_files
        src/*
)



add_library(PugiXml  STATIC  ${source_files} )

target_include_directories(PugiXml  PUBLIC "src")
