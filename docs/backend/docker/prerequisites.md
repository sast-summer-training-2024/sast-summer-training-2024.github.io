# 课前准备
## 前置知识
无，但是最好熟悉 linux 基本命令行操作
## 环境配置
### macOS 或 Windows
通过 [Docker Desktop](https://www.docker.com/products/docker-desktop/) 进行安装   
此外，macOS 也可以通过 [HomeBrew](https://brew.sh/) 安装 Docker Desktop     
`brew install --cask docker`
### linux
有三种方法进行安装：

- 运行 `curl -fsSL https://get.docker.com/ | sudo sh`，利用官方提供的安装脚本进行安装，之后用 `sudo usermod -aG docker $USER` 把用户添加到 Docker 用户组

- 按 [官方文档](https://docs.docker.com/engine/install/ubuntu/) 上指导安装

- 下载 Docker Desktop linux 版

启动 Docker: `sudo systemctl start Docker` 或者 `sudo service Docker start`

此外，如果是 Windows+WSL2 双系统的话，推荐还是安装 Docker Desktop Windows版方便统一管理，而且如果是 WSL2 未配置代理，可以规避掉最近国内镜像源接连关闭导致需要从外网拉 Docker 镜像的情况，详情见[官方文档](https://docs.docker.com/desktop/wsl/)
## 测试环境
运行命令 `docker run --rm hello-world` 如果看到 "Hello From Docker" 的输出，说明环境基本配置成功    
## 备注
大家应该都听说过国内 Docker 镜像站陆续下架的情况，所以现在不推荐像之前暑培文档一样换源，而是在可以科学上网的情况下直接使用默认源就行   
此外遇到配置环境的问题可以直接在群里滴滴讲师   