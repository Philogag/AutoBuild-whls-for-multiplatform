#!/bin/bash

# apt-get install -y gcc
# yum install -y gcc

pip download pyhdfs # 下载源码包
pip install ./*.whl # 安装依赖包

package_file=`ls | grep tar.gz`
tar -zxvf $package_file
folder=${package_file%\.tar.gz}
cd $folder

python3 setup.py bdist_wheel

cp ./dist/*.whl /opt/export/

ls /opt/export/
