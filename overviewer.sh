#!/bin/bash

# Generate the output
config="$HOME/config/overviewer-config"
overviewer="/usr/bin/overviewer.py"

$overviewer --config=$config $HOME/minecraft $HOME/overviewer

# Push to s3 and invalidate the cloudfront distro
s3cmd="/usr/bin/s3cmd"

day="date +%d"
month="date +%m"
year="date +%Y"

$s3cmd --cf-invalidate sync $HOME/overviewer s3://minecuna-overviewer/$year/$month/$day/
