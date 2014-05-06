#!/bin/bash

# Generate the output
config="$HOME/config/overviewer-config"
logs="/var/log/minecraft/overviewer.log"
overviewer="/usr/bin/overviewer.py"
s3cmd="/usr/bin/s3cmd"

$overviewer --config=$config >> $logs

# Push to s3 and invalidate the cloudfront distro

$s3cmd --cf-invalidate sync --delete-removed --no-progress $HOME/overviewer s3://minecuna-overviewer >> $logs
