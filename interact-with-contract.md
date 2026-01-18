# 与 MiniNFT 合约交互

## 合约信息

- **地址:** 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21
- **网络:** Sepolia 测试网
- **验证状态:** 已验证

## 使用 Cast 命令行交互

### 1. Mint NFT

```bash
# Mint 到你的地址
source .env
cast send 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "mint(address)" \
  $(cast wallet address --private-key "$PRIVATE_KEY") \
  --rpc-url "$SEPOLIA_RPC_URL" \
  --private-key "$PRIVATE_KEY"
```

### 2. 查询 Token 所有者

```bash
# 查询 Token ID 0 的所有者
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "ownerOf(uint256)(address)" \
  0 \
  --rpc-url "$SEPOLIA_RPC_URL"
```

### 3. 查询余额

```bash
# 查询某个地址拥有的 NFT 数量
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "balanceOf(address)(uint256)" \
  $(cast wallet address --private-key "$PRIVATE_KEY") \
  --rpc-url "$SEPOLIA_RPC_URL"
```

### 4. 查询下一个 Token ID

```bash
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "nextTokenId()(uint256)" \
  --rpc-url "$SEPOLIA_RPC_URL"
```

## 使用 Etherscan 交互

### 在 Etherscan 上操作：

1. 访问合约页面:
   https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21

2. 连接 MetaMask

3. 切换到 Sepolia 网络

4. 点击 "Write Contract" 标签

5. 连接钱包后调用 mint 函数

## MetaMask 交互步骤

1. **添加合约到 MetaMask**
   - 打开 MetaMask
   - 切换到 Sepolia 网络
   - 点击 "导入代币"
   - 粘贴合约地址: `0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21`
   - 代币符号会自动填充 (MINI)

2. **查看 NFT**
   - 在 MetaMask 的 "Collectibles" (收藏品) 标签查看
   - Mint 成功后会显示在这里

## 快速测试命令

```bash
# 创建测试脚本
cat > test-mint.sh << 'EOF'
#!/bin/bash
source .env

CONTRACT="0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21"
ADDRESS=$(cast wallet address --private-key "$PRIVATE_KEY")

echo "🎨 Minting NFT to $ADDRESS..."

cast send "$CONTRACT" \
  "mint(address)" \
  "$ADDRESS" \
  --rpc-url "$SEPOLIA_RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --json

echo ""
echo "✅ Mint 完成!"
echo "查看: https://sepolia.etherscan.io/address/$CONTRACT"
EOF

chmod +x test-mint.sh
./test-mint.sh
```

## 验证部署

运行以下命令验证合约是否正确部署：

```bash
# 检查合约名称
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "name()(string)" \
  --rpc-url "$SEPOLIA_RPC_URL"

# 检查合约符号
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "symbol()(string)" \
  --rpc-url "$SEPOLIA_RPC_URL"

# 检查 owner
cast call 0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21 \
  "owner()(address)" \
  --rpc-url "$SEPOLIA_RPC_URL"
```

## 注意事项

- ⚠️ 只有 owner 可以调用 mint 函数
- ⚠️ 每次调用 mint 会递增 nextTokenId
- ⚠️ _safeMint 会检查接收地址是否支持 ERC721
- ✅ 合约已在 Sepolia Etherscan 上验证，代码公开可见

## Etherscan 链接

- **合约地址**: https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21
- **交易记录**: https://sepolia.etherscan.io/tx/0x[交易哈希]
