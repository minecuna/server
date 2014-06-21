#!/bin/bash

# Generate the output
config="$HOME/config/overview-config"
logs="/var/log/minecraft/overviewer.log"
overviewer="/usr/bin/overviewer.py"
s3cfg="$HOME/.s3cfg-overviewer"
s3cmd="/usr/bin/s3cmd"

$overviewer --config=$config >> $logs 2>&1

# Push to s3 and invalidate the cloudfront distro

$s3cmd --config=$s3cfg sync --delete-removed --no-progress $HOME/overviewer/* s3://map.minecuna.co.uk >> $logs
