#!/bin/bash

apt-get install lsb-core -y

apt-get -y install curl software-properties-common apt-transport-https
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=${CORE}] https://download.docker.com/linux/ubuntu focal stable"

apt-get update
apt-get install docker-ce