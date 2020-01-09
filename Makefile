# 安装gods-pen-cli工具方便clone项目，并且启动基本服务
install:
	npm i -g gods-pen-cli && docker-compose up -d

fetch:
	gods-pen serve fetch

# 启动所有服务
build:
	gods-pen serve build

start-server:
	cd ./gods-pen-server && npm run serve

