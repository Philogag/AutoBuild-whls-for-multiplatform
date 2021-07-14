#!/bin/sh
# 外层

echo $PWD

ln -s $PWD/tools /opt/tools
ln -s $PWD/builds /opt/builds
ls 

docker run -itd \
    -v /opt/export:/opt/export \
    -v /opt/tools:/opt/tools \
    -v /opt/builds:/opt/builds \
    -e CORE=${CORE} \
    -e PY=${PY}     \
    -e LIB=${LIB}   \
    -u root \
    --rm \
    --privileged \
    --name=multiarch-runner \
    multiarch/ubuntu-core:${CORE}-focal \
    /sbin/init
# enable systemctl

docker exec -it multiarch-runner \
    bash /opt/tools/run-in-multiarch.sh
