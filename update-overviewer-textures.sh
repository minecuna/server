#!/bin/bash

version=$1

path="$HOME/.minecraft/versions/${version}/"

# Create the path if it doens't exist
if [ ! -d $path ]; then
    mkdir -p $path
fi

url="https://s3.amazonaws.com/Minecraft.Download/versions/${version}/${version}.jar"

wget $url -P $path
