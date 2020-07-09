#!/bin/bash
##FIXME: Versions are static
versions=('master' 'lwjgl2.9.3' 'lwjgl2.9.2' 'lwjgl2.9.1' 'lwjgl2.9.0')
for version in "${versions[@]}"
do
  echo "Compiling LWJGL version $version."
done
