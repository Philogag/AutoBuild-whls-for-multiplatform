#/bin/bash
# 中间层


bash /opt/tools/install-docker.sh

uname -a
ls /opt/builds
 # 运行内层
docker run -it \
    -v /opt/export:/opt/export \
    -v /opt/export:/opt/export \
    -v /opt/tools:/opt/tools \
    -v /opt/builds:/opt/builds \
    -w /opt/builds \
    -e LIB=${LIB}  \    
    -u root \
    --rm \
    --privileged \
    python:${PY}-buster \
    bash /opt/run-in-builder.sh