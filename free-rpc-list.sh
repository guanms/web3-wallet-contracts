#!/bin/bash

# 快速切换RPC节点的脚本

echo "🔄 选择 Sepolia RPC 提供商："
echo ""
echo "1) Ankr (推荐，稳定)"
echo "2) PublicNode (快速)"
echo "3) BlockPi (欧洲)"
echo "4. 1RPC (全球)"
echo "5) 所有节点测试"
echo ""
read -p "请选择 (1-5): " choice

case $choice in
  1)
    url="https://rpc.ankr.com/eth_sepolia"
    name="Ankr"
    ;;
  2)
    url="https://eth-sepolia.publicnode.com"
    name="PublicNode"
    ;;
  3)
    url="https://ethereum-sepolia.blockpi.network/v1/rpc/public"
    name="BlockPi"
    ;;
  4)
    url="https://1rpc.io/sepolia"
    name="1RPC"
    ;;
  5)
    echo "🔍 测试所有节点..."
    echo ""

    urls=(
      "Ankr:https://rpc.ankr.com/eth_sepolia"
      "PublicNode:https://eth-sepolia.publicnode.com"
      "BlockPi:https://ethereum-sepolia.blockpi.network/v1/rpc/public"
      "1RPC:https://1rpc.io/sepolia"
      "Cloudflare:https://sepolia.etherscan.io"
    )

    for item in "${urls[@]}"; do
      name="${item%%:*}"
      url="${item##*:}"
      echo -n "测试 $name ... "

      if cast block latest --rpc-url "$url" &> /dev/null; then
        echo "✅ 可用"
      else
        echo "❌ 不可用"
      fi
    done
    exit 0
    ;;
  *)
    echo "无效选择"
    exit 1
    ;;
esac

echo ""
echo "切换到 $name: $url"

# 更新 .env 文件
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' "s|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=$url|" .env
else
  # Linux
  sed -i "s|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=$url|" .env
fi

echo "✅ .env 文件已更新"
echo ""
echo "现在可以运行: ./deploy-sepolia.sh"
