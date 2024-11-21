# 基于 Ubuntu 22.04 基础镜像
FROM ubuntu:22.04

# 设置环境变量，避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装 curl
RUN apt-get update && apt-get install -y curl && apt-get clean

# 设置工作目录
WORKDIR /app

# 容器启动时默认进入 bash
CMD ["bash"]
