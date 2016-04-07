#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./build-version.sh NEW_VERSION"
    exit 0
fi

NEW_VERSION=$1

# remove source
SOURCE_DIR="sources/${NEW_VERSION}"
NEW_BUILD_DIR="builds/${NEW_VERSION}"

# make sure builds directory exists
mkdir -p builds

if [ -e $SOURCE_DIR ]; then
    if [ -e ./source ]; then
        rm -rf ./source
    fi
    # copy the source directory
    cp -r $SOURCE_DIR ./source || die "unable to create source directory"

    # make the build
    bundle exec middleman build --clean

    # move the build
    if [ -e $NEW_BUILD_DIR ]; then
        rm -rf $NEW_BUILD_DIR
    fi
    mv build $NEW_BUILD_DIR

    # clean up
    rm -rf ./build/*
else
    echo "File $SOURCE_DIR did not exist"
    exit 1
fi

# cleanup source