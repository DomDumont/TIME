cmake_minimum_required(VERSION 2.8)
add_subdirectory (Engine)

foreach (TARGET PugiXml)
    add_subdirectory (Extern/${TARGET})
endforeach ()