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
    --rm \
    --privileged \
    python:${PY}-buster \
    bash /opt/tools/run-in-builder.sh

OUTPUT=`ls /opt/export | sed 's/ /\n/g' | grep whl | head -n 1` 
BUILD_OUTPUT=${OUTPUT%*.whl}.${PY}.${CORE}.whl
mv /opt/export/$OUTPUT /opt/export/$BUILD_OUTPUT 
echo $BUILD_OUTPUT