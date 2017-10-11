#!/bin/bash
find /Volumes/Helloprint/shops -name style.scss | while read file
do
        echo $file
        /usr/local/bin/sassc -m -t compressed -I /Volumes/Helloprint/whitelabel/css "$file" "${file%.scss}.css"
done
