#!/bin/bash
##FIXME: Versions are static
git clone https://github.com/LWJGL/lwjgl.git
versions=('master' 'lwjgl2.9.3' 'lwjgl2.9.2' 'lwjgl2.9.1' 'lwjgl2.9.0')
for version in "${versions[@]}"
do
  echo "Compiling LWJGL version $version."
  cd lwjgl
  git checkout $version
  #git status
  env PATH=${JAVA_HOME}/bin:${PATH} ant
  cd ..
  mkdir $version
  cp lwjgl/libs/linux/* $version 
done
