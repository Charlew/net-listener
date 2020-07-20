#!/bin/bash

containerName=$1

if [[ -z ${containerName} ]]; then
    echo "Missing container name! Setting default value" >&2
    containerName="net-listener"
fi

docker build -t ${containerName} .
docker run --rm -ti ${containerName}