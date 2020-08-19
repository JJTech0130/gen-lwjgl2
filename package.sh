#!/bin/bash

lwjgldirs="$(find -maxdepth 1 -type d -name 'lwjgl2*')"
#echo "List: $lwjgldirs"
for lwjgldir in $lwjgldirs
do
  version="$(echo $lwjgldir | awk '{sub(/.\/lwjgl*/,""); print}')" #Remove ./lwjgl from beginning
  echo "$(tput setaf 6)================ Packaging LWJGL version $(tput bold)$version$(tput sgr 0)$(tput setaf 6). ================$(tput sgr 0)"
  echo " "
  cd $lwjgldir
  cp ../openal-soft/build/libopenal.so ./
  jar -cf ./lwjgl-platform-$version-natives-linux.jar ./liblwjgl.so ./libopenal.so
  jar -cf ./lwjgl-$version.jar ./org/lwjgl/input/ ./org/lwjgl/openal/ ./org/lwjgl/opencl/ ./org/lwjgl/opengl/ ./org/lwjgl/opengles/ ./org/lwjgl/*.class
  jar -cf ./lwjgl_util-$version.jar ./org/lwjgl/util/glu/ ./org/lwjgl/util/input/ ./org/lwjgl/util/jinput/ ./org/lwjgl/util/mapped/ ./org/lwjgl/util/vector/ ./org/lwjgl/util/*.class
  cd ..
done
