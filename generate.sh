#!/bin/bash
# Make sure you install libxcursor-dev, libxxf86vm-dev, and libxrandr-dev

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64 #Replace with java home, MUST BE OPENJDK 8

# Clean up old builds
rm ./lwjgl2* -r

git clone https://github.com/LWJGL/lwjgl.git

#versions=('master' 'lwjgl2.9.3' 'lwjgl2.9.2' 'lwjgl2.9.1' 'lwjgl2.9.0') #Version 2.9.1 and 2.9.0 won't compile
versions=('master' 'lwjgl2.9.3' 'lwjgl2.9.2') #Versions to compile, correspond to branch/tag names

for version in "${versions[@]}"
do
  echo " $(tput setaf 6)================ Compiling LWJGL version $(tput bold)$version$(tput sgr 0)$(tput setaf 6). ================$(tput sgr 0) "
  echo " "
  cd lwjgl
  git reset --hard
  git checkout $version
  #git status
  echo "Using aarch64 version of JAWT"
  #Replace i386 with aarch64 in platform_build/linux_ant/build.xml
  sed -i 's/i386/aarch64/g' platform_build/linux_ant/build.xml
  echo "Staring ANT with modified path"
  env PATH=${JAVA_HOME}/bin:${PATH} ant
  cd ..
  mkdir $version
  cp lwjgl/libs/linux/* $version -r
done
#Move latest nightly to correct folder
mv ./master ./lwjgl2.9.4-nightly
