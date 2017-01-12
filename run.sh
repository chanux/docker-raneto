#!/usr/bin/env bash
set -o errexit

if [ "$(ls -A /data/raneto 1&>/dev/null )" ];then
    echo "==> Raneto content found. Continuing with it."
else
    echo "==> No content found. Using default content."
    if [ ! -d /data/raneto ];then
        mkdir -p /data/raneto
    fi
    cp -r /raneto/content /data/raneto
fi

npm start
