#!/bin/bash

# Just download
wget -q https://download.pytorch.org/whl/cu113/torch-1.10.1%2Bcu113-cp37-cp37m-win_amd64.whl

cp *.whl /opt/export/
echo Download Done.
