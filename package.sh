#!/bin/bash

lwjgldirs="$(find -maxdepth 1 -type d -name 'lwjgl2*')"
#echo "List: $lwjgldirs"
for lwjgldir in $lwjgldirs
do
  version="$(echo $lwjgldir | awk '{sub(/.\/lwjgl*/,""); print}')" #Remove ./lwjgl from beginning
  echo "$(tput setaf 6)================ Packaging LWJGL version $(tput bold)$version$(tput sgr 0)$(tput setaf 6). ================$(tput sgr 0)"
  echo " "
  cd $lwjgldir
  jar -cf ./lwjgl-platform-$version-natives-linux.jar ./liblwjgl.so ./libopenal.so
  cd ..
done
