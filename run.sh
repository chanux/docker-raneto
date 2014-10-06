#!/bin/bash
set -o errexit

if [ "$(ls -A /data/raneto 1&>/dev/null )" ];then
    echo "==> Raneto content found. Continuing with it."
else
    echo "==> No content found. Using default content."
    cp -r /raneto/content /data/raneto
fi

npm start
