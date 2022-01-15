#!/bin/bash

wget -q https://download.pytorch.org/whl/cu113/torch-1.10.1%2Bcu113-cp37-cp37m-win_amd64.whl

mkdir /opt/export/
cp *.whl /opt/export/
