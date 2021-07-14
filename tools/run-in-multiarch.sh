#/bin/bash

# 中间层

bash /opt/tools/install-docker.sh

uname -a
ls /opt/builds
 # 运行内层
docker run -it \
    -v /opt/export:/opt/export \
    -v /opt/builds:/opt/builds \
    python:${PY}-buster \
    cd /opt/builds && bash ./${LIB}.sh