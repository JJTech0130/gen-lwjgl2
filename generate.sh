#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64
##FIXME: Versions are static
git clone https://github.com/LWJGL/lwjgl.git
versions=('master' 'lwjgl2.9.3' 'lwjgl2.9.2' 'lwjgl2.9.1' 'lwjgl2.9.0')
for version in "${versions[@]}"
do
  echo " ================ Compiling LWJGL version $version. ================ "
  echo " "
  cd lwjgl
  git checkout $version
  echo "Using aarch64 version of JAWT"
  #Replace i386 with aarch64 in platform_build/linux_ant/build.xml
  sed -i 's/i386/aarch64/g' platform_build/linux_ant/build.xml
  echo "Staring ANT with modified path"
  env PATH=${JAVA_HOME}/bin:${PATH} ant
  cd ..
  mkdir $version
  cp lwjgl/libs/linux/* $version
done
#Move latest nightly to correct folder
mv ./master ./lwjgl2.9.4-nightly
