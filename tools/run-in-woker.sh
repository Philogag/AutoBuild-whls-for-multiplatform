#!/bin/sh

## 本脚本用于配置外层虚拟指令集docker，并传入构建参数

docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /opt/export:/opt/export \
    -v $PWD/tools:/opt/tools \
    -v $PWD/builds:/opt/builds \
    -e CORE=${CORE} \
    -e PY=${PY}     \
    -e LIB=${LIB}   \
    -u root \
    --rm \
    --privileged \
    --name=multiarch-runner \
    multiarch/ubuntu-core:${CORE}-focal \
    bash /opt/tools/run-in-multiarch.sh
