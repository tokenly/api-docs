#!/bin/bash

ls sources | xargs -L 1 ./build-version.sh
