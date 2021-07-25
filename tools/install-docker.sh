#!/bin/bash

# sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# export DEBIAN_FRONTEND=noninteractive
# apt-get update
# apt-get -y install curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository "deb [arch=${CORE}] https://download.docker.com/linux/ubuntu bionic stable"

# apt-get update
# apt-get install -y docker-ce

# for alpine 
apk add docker
