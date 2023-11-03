# 停止正在运行的容器
docker stop container_middleware_express

# 删除正在运行的容器
docker rm -f container_middleware_express

# 删除已存在的镜像
docker rmi image_middleware_express:latest 

# 构建镜像
docker build -t  image_middleware_express:latest . 

# 基于构建的镜像创建容器，并将服务的日志目录挂载到宿主机，没有日志可以不挂，视自己情况挂载
docker run -d -p 3100:3100 -v /path/logs:/app/logs --name container_middleware_express image_middleware_express
