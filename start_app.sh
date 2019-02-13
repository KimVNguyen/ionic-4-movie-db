#!/bin/bash

for d in */ ; do
    app_dir="$d"
    break
done

cd $app_dir
ionic serve