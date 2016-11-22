#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

# ls -al source
SOURCE_DIR="./sources/${FOLDER_NAME}"
if [ -e $SOURCE_DIR ]; then
    ls $SOURCE_DIR | cat
else
    die "File $SOURCE_DIR did not exist"
fi
