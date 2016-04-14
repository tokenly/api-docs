#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

if [ -z "$1" ]; then
    echo "Usage: build-folder.sh FOLDER_NAME"
    exit 0
fi

FOLDER_NAME=$1
NEW_BUILD_DIR="./builds/$FOLDER_NAME"

# checkout
if [ -e ./source/.lockfile ]; then
    die "Found lockfile.  Please commit the folder first. "
fi;

# checkout the folder
./scripts/checkout-folder.sh $FOLDER_NAME 1

# build
echo "building $FOLDER_NAME"
bundle exec middleman build --clean

# move the build
if [ -e $NEW_BUILD_DIR ]; then
    rm -rf $NEW_BUILD_DIR
fi
mv ./build $NEW_BUILD_DIR

# clean up source
rm -rf ./source
