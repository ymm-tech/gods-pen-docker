# godspen On-Premise

## WHAT

码良 依赖 es、redis、mysql、邮件、oss服务，其中 es、redis、mysql ，nginx默认由docker容器提供，见 docker-compose.yaml。 码良的源码独立部署，方便开发和修改

## 视频教程
[点击前往](https://www.bilibili.com/video/av82434809/)

## HOW

### 必要条件

- linux 系统或其他 linux 发行版 [推荐阿里云上购买服务器](https://www.aliyun.com/product/ecs?aly_as=P6zVCnft&source=5176.11533457&userCode=5m3njzh3&type=copy)，或者 macOS 或者能安装docker的win
- 至少 3GB 内存，10G 可用存储空间 （如不使用 docker 容器提供 es、redis、mysql 全部或部分服务，可适当减少。单个es节点占用约1GB内存，默认启动了两个）
- docker  
```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
- docker-compose [安装教程](https://docs.docker.com/compose/install/)

- 阿里云开通oss服务 [开通地址](https://www.aliyun.com/product/oss?spm=5176.12825654.eofdhaal5.87.ba052c4a8HQU3D&aly_as=ge-cEkgv&userCode=5m3njzh3)

- 邮件服务 开通smtp服务 [开通教程](https://jingyan.baidu.com/article/6079ad0eb14aaa28fe86db5a.html)

### 获取代码

[项目地址](https://github.com/ymm-tech/gods-pen-docker) 

```bash
git clone https://github.com/ymm-tech/gods-pen-docker.git
git checkout -b source_deploy origin/source_deploy
```
或直接下载 并切换分支并解压备用。

### 配置

nginx.conf 是nginx的配置文件，整合了码良内部的多个服务，是最终交付服务的实际入口。默认包含了最简配置，静态文件服务（含 html5 history 模式的支持，缓存）和api服务的反向代理，如需进行域名绑定等操作，可自行修改该文件进行配置。

docker-compose.yml 配置了码良依赖的基础服务。方便使用docker一键安装

## 安装

### 安装基础依赖

`make install` 命令会安装gods-pen-cli .以及安装码良涉及到的基础服务  es、redis、mysql ，nginx.

### 获取码良源码

`make fetch` 命令会通过安装好的gods-pen-cli 命令获取最新的源码到本地，运行后根目录会多出来3个目录 
1. `gods-pen` 码良编辑器，预览器
2. `gods-pen-admin` 码良管理后台
3. `gods-pen-server` 码良后端接口服务

### 修改配置

依赖安装好后，将第三方 es、redis、mysql、邮件、oss 服务信息配置到 `gods-pen-server/config/config.production.js` 内。

### 打包源码
`make build` 会打包`gods-pen` 和 `gods-pen-admin` 两个前端项目。并把打包好的内容放到 gods-pen-dist 目录下面。 nginx默认就是指向的这个目录

### 启动服务

 `make start`

启动成功后，访问地址为`http://<host:port>/admin`，如使用了 nginx.conf 默认配置，访问地址即 http://127.0.0.1/admin

### 中止服务

`make stop-server` 。暂停服务，不会删除现有容器，可通过 `make start-server` 再次恢复运行。

### 终止服务

`make remove-server` 。移除服务，会删除现有容器，可通过 `make start-server` 重新创建容器启动服务。

