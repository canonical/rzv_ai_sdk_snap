#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: rzv-ai-sdk-q08.object-counter vehicle <USB|MIPI>"
    exit 1
fi

cd $SNAP/usr/q08/bin && exec ./object_counter "$@"
