#/bin/sh
# 中间层

echo Install docker

rc-status -a
rc-update add docker default
# sh /opt/tools/install-docker.sh # 1> /dev/null 2> /dev/null
service docker start
service docker status
sleep 5
# docker ps -a
docker version
echo Done.

uname -a
# ls /opt/
# 运行内层
docker run -it \
    -v /opt/export:/opt/export \
    -v /opt/tools:/opt/tools \
    -v /opt/builds:/opt/builds \
    -w /opt/builds \
    -e LIB=${LIB}  \
    --rm \
    python:${PY}-buster \
    bash /opt/tools/run-in-builder.sh
