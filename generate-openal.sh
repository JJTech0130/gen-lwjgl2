#!/bin/bash
# Compiles OpenAL. Run AFTER generate.sh!

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64 #Replace with java home, MUST BE OPENJDK 8


git clone https://github.com/kcat/openal-soft.git

# Version of OpenAL to use
version='openal-soft-1.15.1'

echo " $(tput setaf 6)================ Compiling OpenAL version $(tput bold)$version$(tput sgr 0)$(tput setaf 6). ================$(tput sgr 0) "
echo " "

cd openal-soft/build

git reset --hard
git checkout $version

cmake ..
make

cd ../..
