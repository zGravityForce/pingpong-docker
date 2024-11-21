# 基于 Ubuntu 22.04 基础镜像
FROM ubuntu:22.04

# 设置环境变量，避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件包列表并安装 curl、vim 和 wget，同时清理无用文件
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# Copy the entire script folder into the container
COPY script /app/script

# Make all scripts in the script folder executable
RUN chmod -R +x /app/script

# 容器启动时默认进入 bash
CMD ["bash"]
