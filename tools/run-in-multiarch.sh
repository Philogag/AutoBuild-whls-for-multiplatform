#/bin/bash
# 中间层

echo Install docker-cli
bash /opt/tools/install-docker.sh 1> /dev/null 2> /dev/null
docker version
echo Done.

uname -a
ls /opt/builds
 # 运行内层
docker run -it \
    -v /opt/export:/opt/export \
    -v /opt/tools:/opt/tools \
    -v /opt/builds:/opt/builds \
    -w /opt/builds \
    -e LIB=${LIB}  \
    --rm \
    --privileged \
    python:${PY}-buster \
    bash /opt/tools/run-in-builder.sh

files=`ls /opt/export | sed 's/ /\n/g' | grep whl `
for file in ${files[@]}
do
    targ=${file%*.whl}.${PY}.${CORE}.whl
    mv /opt/export/$file /opt/export/$targ 
done

echo -e "\n\nBuild Output:"
ls /opt/export
echo -e "\n\nB"