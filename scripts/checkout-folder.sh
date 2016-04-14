#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

if [ -z "$1" ]; then
    echo "Usage: checkout-folder.sh <folder_name> [quiet]"
    exit 0
fi

FOLDER_NAME=$1
QUIET=$2

# cp source
SOURCE_DIR="./sources/${FOLDER_NAME}"
if [ -e $SOURCE_DIR ]; then
    if [ -e ./source/.lockfile ]; then
        echo -n "Found lockfile.  Are you sure you want to erase the currently checkout out source? [N/y]: "
        read confirm
        if [ "$confirm" != "y" ]; then
            echo "aborting"
            exit
        fi
    fi

    echo "Checking out folder $FOLDER_NAME from sources/$FOLDER_NAME"
    rm -rf ./source/*

    # copy the source directory
    mkdir -p ./source
    cp -r $SOURCE_DIR/* ./source || die "unable to copy to source directory"
    echo -n "$FOLDER_NAME" > ./source/.lockfile || die "unable to create lockfile"

    # make sure build directory exists
    mkdir -p ./build

else
    die "File $SOURCE_DIR did not exist"
fi

if [ "$QUIET" != "1" ]; then
    echo "Finished checking out folder $FOLDER_NAME.  You can now develop locally with:"
    echo "  bundle exec middleman server"
    echo
fi;