#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }

# checkout
if [ -e ./source/.lockfile ]; then
    die "Found lockfile.  Please commit the folder first. "
fi;

ls sources | xargs -L 1 ./scripts/build-folder.sh

# cp the root files
/bin/cp -rv ./html-root/index.html ./builds/
/bin/cp -rv ./html-root/_shared ./builds/
