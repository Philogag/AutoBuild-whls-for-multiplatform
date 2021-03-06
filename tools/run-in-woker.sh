#!/bin/sh
# 外层

echo $PWD

ln -s $PWD/tools /opt/
ln -s $PWD/builds /opt/
# ls 

sed -i s/'${CORE}'/${CORE}/g ./tools/worker.Dockerfile
docker build -f ./tools/worker.Dockerfile -t worker .

docker run -it \
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
    worker \
    sh /opt/tools/run-in-multiarch.sh

files=`ls /opt/export | sed 's/ /\n/g' | grep whl `
for file in ${files[@]}
do
    targ=${file%*.whl}.${PY}.${CORE}.whl
    mv /opt/export/$file /opt/export/$targ
done

echo -e "\n\nBuild Output:"
ls /opt/export
echo -e "\n\nB"
