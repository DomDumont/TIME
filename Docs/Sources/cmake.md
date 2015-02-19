## CMake


### Targets :

* add_library
* add_executable
* add_custom_target

Les librairies peuvent être static, shared ou module.

si on ne met rien, cmake regarde la valeur de la variable BUILD_SHARED_LIBS pour savoir si il doit mettre la librairie en staic ou shared.

pour les executables.
set_target_properties et get_target_property.
