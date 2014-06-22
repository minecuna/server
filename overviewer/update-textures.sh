#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Specify a version, e.g. 1.7.9"
    exit 1
fi

version=$1

path="$HOME/.minecraft/versions/${version}/"

# Create the path if it doens't exist
if [ ! -d $path ]; then
    mkdir -p $path
fi

url="https://s3.amazonaws.com/Minecraft.Download/versions/${version}/${version}.jar"

wget $url -P $path
