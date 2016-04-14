#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

# get the lockfile
if [ -e ./source/.lockfile ]; then
    FOLDER_NAME=$(cat ./source/.lockfile)
fi;

if [ -z "$FOLDER_NAME" ]; then
    die "source directory not checked out"
fi;

echo "committing changes to sources/$FOLDER_NAME directory"

# mv the source directory
SOURCE_DIR="./sources/${FOLDER_NAME}"
rm -rf $SOURCE_DIR
rm ./source/.lockfile
mv source $SOURCE_DIR

# clean up
rm -rf ./build/*

