#!/usr/bin/env bash

echo cmake_generic.sh

# Determine source tree and build tree
if [ "$1" ] && [[ ! "$1" =~ ^- ]]; then 
	BUILD=$1; shift; 
elif [ -f $(pwd)/CMakeCache.txt ]; then
	BUILD=$(pwd); 
else 
	echo An error has occured, build tree has to be provided as the first argument OR call this script in a build tree itself; exit 1; fi
SOURCE=$(dirname $0)
if [ "$SOURCE" == "." ]; then SOURCE=$(pwd); fi
if [ "$BUILD" == "." ]; then BUILD=$(pwd); fi


# Detect CMake toolchains directory if it is not provided explicitly
[ "$TOOLCHAINS" == "" ] && TOOLCHAINS=$SOURCE/CMake/Toolchains

echo $TOOLCHAINS
echo $BUILD

IFS=#
OPTS=
for a in $@; do
    case $a in
        -DWIN32=1)
            WINDOWS=1 && OPTS="-DCMAKE_TOOLCHAIN_FILE=$TOOLCHAINS/mingw.toolchain.cmake"
            ;;
    esac
done

# Create project with the chosen CMake generator and toolchain
cmake -E make_directory "$BUILD" && cmake -E chdir "$BUILD" cmake $OPTS $@ "$SOURCE" 
unset IFS





