#!/bin/bash

scan_dir=/opt/export/
scan_ext="*"
maxsize=$((1024*1024*1024)) # 1GB

cd $scan_dir

if [[ ! -d "../tobezip" ]]; then
    mkdir ../tobezip
fi

files=`ls`
for file in $files
do
    filesize=$(ls -l $file | awk '{ print $5 }')
    filename=$(ls -l $file | awk '{ print $9 }')

    if [[ $filesize -gt $maxsize ]]; then
        mv $filename ../tobezip/
    fi
done

cd ../tobezip
find . -type f -name "*.$scan_ext" -exec zip -r -0 -s 1g $scan_dir/{}.zip {} \;