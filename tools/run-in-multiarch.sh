#/bin/bash

# 中间层

bash /opt/tools/install-docker.sh

uname -a

docker -version
docker --daemon

 # 运行内层
docker run \
    -v /opt/export:/opt/export \
    -v /opt/builds:/opt/builds \
    python:${PY}-buster \
    bash /opt/builds/${LIB}.sh