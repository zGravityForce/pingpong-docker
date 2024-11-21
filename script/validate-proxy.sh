#!/bin/bash

HTTPS_PROXY_VALUE=$(env | grep ^HTTPS_PROXY= | cut -d '=' -f 2)

if [ -z "$HTTPS_PROXY_VALUE" ]; then
  echo "HTTPS_PROXY is not set."
  exit 1
else
  echo "HTTPS_PROXY is set to: $HTTPS_PROXY_VALUE"
fi


# 运行 curl 命令，通过代理访问 https://ifconfig.co
curl -x $HTTPS_PROXY_VALUE https://ifconfig.co

# 或者，直接使用 HTTPS_PROXY 环境变量（不需要 -x）
curl https://ifconfig.co
