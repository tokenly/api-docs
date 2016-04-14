#!/bin/bash

die() { echo "$@" 1>&2 ; exit 1; }


echo -n "Are you sure you want to erase the currently checked out source? [N/y]: "
read confirm
if [ "$confirm" != "y" ]; then
    echo "aborting"
    exit 0
fi

# clear the source
rm -rf ./source

echo "source directory cleared"
