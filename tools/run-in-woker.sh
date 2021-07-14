#!/bin/sh
# 外层

echo $PWD

ln -s $PWD/tools /opt/tools
ln -s $PWD/builds /opt/builds
ls 

docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
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
    bash /opt/tools/run-in-multiarch.sh
