# Whl自动构建工具

基于 multiarch内运行的docker 和 python-docker 容器自动编译模块为多版本whl


## 工作结构

运行结构
+ Travis-CI物理机
    + run-in-woker.sh
    + docker : multiarch/ubuntu-core
        + install-docker-cli
        + run-in-multiarch.sh
        + docker : python
            + run-in-build.sh
            + ./build/xxx.sh

## 如何使用本项目

1. Fork 此项目
2. 前往 [Travis-CI](https://travis-ci.com/) 绑定自己的 github，并同步仓库
3. 打开 [Github Auth tokens](https://github.com/settings/tokens) 新建 Token，并复制
4. 前往 [Travis-CI](https://travis-ci.com/) 对应仓库页面，进入 More options > Setting 
    + 激活 General > Build pushed branches 自动构建
    + 新建 Environment Variables
        + NAME: "GITHUB_OAUTH_TOKEN"
        + VALUE: 第3步生成的Token
        + 点击Add保存
5. clone 项目到本地
5. 编写bash构建脚本并置入./builds
6. 修改 .travis.yml 配置文件中的 env 模块
7. commit 并 push，自动触发Travis构建

## .travis.yml 变量配置

仅需配置 `env:` 模块即可  
每行为一个构建版本

+ CORE 取值：  
see tags on docker image: multiarch/ubuntu-core:(?)-focal
https://hub.docker.com/r/multiarch/ubuntu-core/tags?page=1&ordering=last_updated&name=focal

+ PY 取值：  
see tags on docker image: python:(?)-buster
https://hub.docker.com/_/python?tab=tags&page=1&ordering=last_updated&name=buster