# 构建 docker-compose依赖的本地镜像
build:
	docker-compose build

# 启动所有服务
start-server:
	docker-compose up -d

# 中止所有服务
stop-server:
	docker-compose stop

# 终止并移除所有服务
remove-server:
	docker-compose down
