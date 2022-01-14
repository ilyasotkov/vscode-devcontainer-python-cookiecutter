#!/usr/bin/env bash

set -eux
cd $(dirname $0)/..

mkdir -p ./tmp
cd ./tmp
cookiecutter .. \
    --no-input \
    --overwrite-if-exists --default-config \
    python_version=$PYTHON_VERSION

cd $(cat ../cookiecutter.json | jq -r ".project_name")
ls -alh
docker run -t $(docker build -q . --target test)
