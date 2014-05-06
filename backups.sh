#!/bin/bash

glacier="$HOME/boto_venv/bin/glacier"
xz="/usr/bin/xz"

timestamp="`date +%Y`-`date +%m`-`date +%d`"
archive="$HOME/$timestamp.tar.xz"
backup_dir="$HOME/backup"

# clean backup dir
rm -rf $backup_dir

# copy the folder so it can't change under tar
cp -R $HOME/minecraft $backup_dir
tar -cf - $backup_dir | $xz --compress --stdout - > $archive

# Push the compressed backup to glacier
$glacier upload minecuna-backups $archive

# clean backup dir
rm -rf $backup_dir
