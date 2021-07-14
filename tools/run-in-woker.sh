#!/bin/sh

## 本脚本用于配置外层虚拟指令集docker，并传入构建参数

docker run \
    -v /opt/export:/opt/export \
    -v ./tools:/opt/tools \
    -v ./builds:/opt/builds \
    -e CORE=${CORE} \
    -e PY=${PT}     \
    -e LIB=${LIB}   \
    multiarch/ubuntu-core:{CORE}-focal \
    bash /opt/tools/run-in-multiarch.sh
