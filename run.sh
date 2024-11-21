#!/bin/bash

# 设置变量
DATA_DIR="./data"
DOCKER_COMPOSE_FILE="docker-compose.yml"

# 检查 data 目录是否存在
if [ ! -d "$DATA_DIR" ]; then
  echo "目录 $DATA_DIR 不存在，正在创建..."
  mkdir -p "$DATA_DIR"
fi

# 修改 data 目录权限为 777
echo "修改目录 $DATA_DIR 的权限为 777..."
chmod -R 777 "$DATA_DIR"

# 检查 docker-compose.yml 文件是否存在
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
  echo "未找到 $DOCKER_COMPOSE_FILE 文件，请确保脚本与 docker-compose.yml 位于同一目录。"
  exit 1
fi

# 运行 Docker Compose
echo "运行 Docker Compose..."
docker compose up -d --build

# 检查 Docker Compose 状态
if [ $? -eq 0 ]; then
  echo "Docker Compose 启动成功！"
else
  echo "Docker Compose 启动失败，请检查错误信息。"
  exit 1
fi

