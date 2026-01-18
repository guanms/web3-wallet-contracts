# MetaMask 添加 Sepolia 测试网络指南

## 方法1：使用 Chainlist 自动添加（推荐）

### 步骤：
1. 访问 https://chainlist.org/
2. 在搜索框中输入 "Sepolia"
3. 找到 "Sepolia Testnet"
4. 点击右侧的 "Add to Metamask" 按钮
5. MetaMask会弹出确认窗口，点击 "批准"
6. ✅ 完成！

---

## 方法2：手动添加 Sepolia 网络

### 步骤 1：打开网络设置
1. 点击 MetaMask 扩展程序图标
2. 点击顶部的网络下拉菜单（显示 "Ethereum Mainnet"）
3. 点击底部的 "添加网络" 按钮

### 步骤 2：选择手动添加
1. 在新页面中点击 "手动添加网络"
2. 填入以下信息：

```
网络名称:         Sepolia Testnet
新增 RPC URL:     https://rpc.sepolia.org
链 ID:            11155111
货币符号:         ETH
区块浏览器 URL:   https://sepolia.etherscan.io
```

### 步骤 3：保存
1. 点击 "保存" 按钮
2. ✅ 完成！MetaMask会自动切换到 Sepolia 网络

---

## Sepolia 网络信息

| 参数 | 值 |
|------|-----|
| **网络名称** | Sepolia Testnet |
| **RPC URL** | https://rpc.sepolia.org |
| **备用 RPC URL** | https://eth-sepolia.publicnode.com |
| **链 ID** | 11155111 |
| **货币符号** | ETH |
| **区块浏览器** | https://sepolia.etherscan.io |

---

## 获取 Sepolia 测试 ETH

### 推荐水龙头网站：

1. **Sepolia Faucet** (最常用)
   - https://sepoliafaucet.com/
   - 需要登录 Twitter/Facebook

2. **Alchemy Sepolia Faucet**
   - https://sepoliafaucet.com/
   - 每天24小时可领取一次

3. **Google Cloud Web3 Faucet**
   - https://cloud.google.com/application/web3/faucet/ethereum/sepolia
   - 需要 Google 账号

4. **QuickNode Sepolia Faucet**
   - https://faucet.quicknode.com/ethereum/sepolia
   - 简单快捷

---

## 验证网络切换

### 检查点：
- ✅ MetaMask 左上角显示 "Sepolia Testnet"
- ✅ 账户余额为 0 ETH（测试网）
- ✅ 可以在 https://sepolia.etherscan.io 查看交易

### 测试交易：
1. 获取测试 ETH（从水龙头）
2. 发送少量 ETH 到另一个地址
3. 在 Sepolia Etherscan 查看交易

---

## 常见问题

### Q1: 找不到 "添加网络" 选项？
**A:** 确保使用的是最新版本的 MetaMask 扩展程序

### Q2: 添加网络后无法连接？
**A:** 尝试更换备用 RPC URL：
- https://eth-sepolia.publicnode.com
- https://rpc.ankr.com/eth_sepolia

### Q3: 如何切换回主网？
**A:** 点击网络下拉菜单，选择 "Ethereum Mainnet"

### Q4: 测试网 ETH 有价值吗？
**A:** 没有价值，测试网 ETH 仅用于测试，不能在主网使用

### Q5: 如何导出私钥用于部署？
**A:**
1. 点击账户名称旁的三个点
2. 选择 "账户详情"
3. 点击 "导出私钥"
4. 输入 MetaMask 密码
5. 复制私钥（不包含 0x 前缀）

⚠️ **安全提示**：
- 永远不要分享你的私钥
- 不要在 .env 文件中使用包含真实资金的主账户私钥
- 测试账户和主账户分开使用

---

## 下一步

配置完成后，你可以：

1. **获取测试 ETH**
   - 从水龙头领取免费测试 ETH

2. **部署合约**
   ```bash
   ./deploy-sepolia.sh
   ```

3. **验证合约**
   - 在 Sepolia Etherscan 查看部署的合约

4. **与合约交互**
   - 使用 MetaMask 与部署的合约交互
