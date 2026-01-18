#!/bin/bash

# 加载环境变量
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "错误: .env 文件不存在"
    echo "请先创建 .env 文件并配置以下变量:"
    echo "  - SEPOLIA_RPC_URL"
    echo "  - PRIVATE_KEY"
    echo "  - ETHERSCAN_API_KEY"
    exit 1
fi

# 检查必要的环境变量
if [ -z "$SEPOLIA_RPC_URL" ] || [ -z "$PRIVATE_KEY" ]; then
    echo "错误: 缺少必要的环境变量"
    echo "请检查 .env 文件中的配置"
    exit 1
fi

echo "🚀 开始部署到 Sepolia 测试网..."
echo "RPC URL: $SEPOLIA_RPC_URL"
echo ""

# 部署合约
forge script script/DeployMiniNFT.s.sol:DeployMiniNFT \
    --rpc-url "$SEPOLIA_RPC_URL" \
    --broadcast \
    --verify \
    -vv

# 检查部署结果
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo "请查看上面的输出获取合约地址"
else
    echo ""
    echo "❌ 部署失败"
    echo "请检查错误信息"
    exit 1
fi
