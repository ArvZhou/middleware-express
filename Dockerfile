# 基础镜像为 node 版本 18
FROM node:18

# 指定工作目录
WORKDIR /app

# 拷贝包管理文件
COPY package*.json /app

COPY *.lock /app

# npm 源，选用国内镜像源以提高下载速度
RUN npm config set registry https://registry.npm.taobao.org/

# npm 安装依赖
RUN npm install

# 将当前目录（dockerfile所在目录）下所有文件都拷贝到工作目录下（.gitignore中的文件除外）
COPY . /app

EXPOSE 3100

# 执行启动命令.
CMD ["npm", "run", "start"]
