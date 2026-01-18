#!/bin/bash

echo "🔍 检查部署配置..."
echo ""

# 检查.env文件
if [ ! -f .env ]; then
    echo "❌ .env 文件不存在"
    exit 1
fi

# 加载环境变量
export $(grep -v '^#' .env | xargs)

# 检查必要变量
check_var() {
    if [ -z "$2" ]; then
        echo "❌ $1 未设置"
        return 1
    else
        echo "✅ $1: ${2:0:10}..."
        return 0
    fi
}

all_good=true
check_var "SEPOLIA_RPC_URL" "$SEPOLIA_RPC_URL" || all_good=false
check_var "PRIVATE_KEY" "$PRIVATE_KEY" || all_good=false
check_var "ETHERSCAN_API_KEY" "$ETHERSCAN_API_KEY" || all_good=false

echo ""
if [ "$all_good" = true ]; then
    echo "✅ 配置检查通过！"
else
    echo "❌ 配置不完整，请检查 .env 文件"
    exit 1
fi
