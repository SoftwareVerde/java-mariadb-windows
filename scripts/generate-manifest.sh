#!/bin/bash

echo -n 'Version: '
read version

build='windows'

cd "src/main/resources/mysql/${build}"
pwd

echo "${version}" > ".version"

rm -f manifest
for file in $(find . -type f | sed "s|^\./||" | grep -v 'manifest'); do
    echo -n "/mysql/${build}/${file}" >> manifest
    if [[ -x "${file}" ]]; then
        echo -n ' x' >> manifest
    fi
    echo >> manifest
done

cat manifest
