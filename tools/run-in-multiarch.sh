#/bin/bash

# 中间层

bash /opt/tools/install-docker.sh

uname -a

 # 运行内层
docker run -it \
    -v /opt/export:/opt/export \
    -v /opt/builds:/opt/builds \
    python:${PY}-buster \
    bash /opt/builds/${LIB}.sh