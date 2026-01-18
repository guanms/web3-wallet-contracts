#!/bin/bash

echo "🔍 测试 Sepolia RPC 节点可用性..."
echo ""

urls=(
  "BlockPi:https://ethereum-sepolia.blockpi.network/v1/rpc/public"
  "PublicNode:https://eth-sepolia.publicnode.com"
  "1RPC:https://1rpc.io/sepolia"
  "Cloudflare:https://sepolia.etherscan.io"
  "Blast:https://sepolia.blastapi.io"
  "NodeReal:https://eth-sepolia.public.nodereal.io"
)

working_urls=()

for item in "${urls[@]}"; do
  name="${item%%:*}"
  url="${item##*:}"
  echo -n "测试 $name ... "

  if timeout 5 cast block latest --rpc-url "$url" &> /dev/null; then
    echo "✅ 可用"
    working_urls+=("$name:$url")
  else
    echo "❌ 超时或不可用"
  fi
done

echo ""
echo "===================="

if [ ${#working_urls[@]} -gt 0 ]; then
  echo "✅ 找到 ${#working_urls[@]} 个可用节点"
  echo ""
  echo "推荐使用: ${working_urls[0]%%:*}"
  echo "URL: ${working_urls[0]#*:}"
  echo ""
  read -p "是否自动更新 .env 文件? (y/n) " -n 1 -r
  echo ""

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    best_url="${working_urls[0]#*:}"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "s|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=$best_url|" .env
    else
      sed -i "s|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=$best_url|" .env
    fi
    echo "✅ 已更新 .env 文件"
    echo "现在可以运行: ./deploy-sepolia.sh"
  fi
else
  echo "❌ 所有节点都不可用"
  echo ""
  echo "建议："
  echo "1. 检查网络连接"
  echo "2. 尝试使用 VPN"
  echo "3. 稍后重试"
fi
