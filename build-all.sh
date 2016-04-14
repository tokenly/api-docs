#!/bin/bash

ls sources | xargs -L 1 ./build-version.sh

# cp the root files
/bin/cp -rv ./html-root/index.html ./builds/
/bin/cp -rv ./html-root/_shared ./builds/
