# Sepolia RPC 提供商配置指南

## 推荐的 RPC 提供商

### 1. Alchemy（最推荐）⭐

**优点：**
- ✅ 免费，每月 250M 计算单元
- ✅ 稳定可靠，99.99% 正常运行时间
- ✅ 专为 Web3 开发优化
- ✅ 提供开发者工具和调试功能

**获取步骤：**
1. 访问 https://www.alchemy.com/
2. 点击 "Sign Up" 注册（免费）
3. 登录后点击 "Create App"
4. 填写信息：
   - Name: `My Sepolia App`
   - Chain: `Ethereum`
   - Network: `Sepolia`
5. 点击 "Create App"
6. 复制 "HTTPS" URL
7. 格式类似：`https://eth-sepolia.g.alchemy.com/v2/your_api_key`

**配置到 .env：**
```bash
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your_api_key
```

---

### 2. Infura（推荐）⭐

**优点：**
- ✅ 行业标准，广泛使用
- ✅ 免费，每天 100K 请求
- ✅ 稳定可靠

**获取步骤：**
1. 访问 https://infura.io/
2. 注册账号（免费）
3. 创建新项目
4. 选择 "Sepolia" 网络
5. 复制端点 URL

**配置到 .env：**
```bash
SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/your_project_id
```

---

### 3. 免费公共节点（无需注册）

#### PublicNode（稳定）✅
```bash
SEPOLIA_RPC_URL=https://eth-sepolia.publicnode.com
```

#### Ankr（稳定）
```bash
SEPOLIA_RPC_URL=https://rpc.ankr.com/eth_sepolia
```

#### QuickNode
```bash
SEPOLIA_RPC_URL=https://sepolia-rollup.quicknode.com/YOUR_API_KEY
```

#### Cloudflare（推荐用于开发）
```bash
SEPOLIA_RPC_URL=https://sepolia.etherscan.io
```

---

## 不推荐的公共节点

❌ **https://rpc.sepolia.org** - 经常超时，不稳定
❌ **https://sepolia.infura.io** - 需要API key

---

## 如何切换 RPC 提供商

### 方法1：编辑 .env 文件

```bash
# 打开 .env
vim .env

# 修改 SEPOLIA_RPC_URL
SEPOLIA_RPC_URL=https://eth-sepolia.publicnode.com
```

### 方法2：使用 sed 命令

```bash
# 切换到 Alchemy
sed -i '' 's|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_KEY|' .env

# 切换到 PublicNode
sed -i '' 's|SEPOLIA_RPC_URL=.*|SEPOLIA_RPC_URL=https://eth-sepolia.publicnode.com|' .env
```

---

## 测试 RPC 连接

### 测试脚本

```bash
# 测试当前 RPC 配置
cast block latest --rpc-url $SEPOLIA_RPC_URL

# 或使用 forge
forge block latest --rpc-url $SEPOLIA_RPC_URL
```

### 完整测试脚本

```bash
#!/bin/bash
source .env

echo "Testing RPC connection..."
echo "URL: $SEPOLIA_RPC_URL"
echo ""

cast block latest --rpc-url "$SEPOLIA_RPC_URL"

if [ $? -eq 0 ]; then
    echo "✅ RPC 连接成功！"
else
    echo "❌ RPC 连接失败"
    echo "请检查 RPC URL 或更换提供商"
fi
```

---

## RPC 性能对比

| 提供商 | 稳定性 | 速度 | 需要注册 | 免费额度 |
|--------|--------|------|----------|----------|
| Alchemy | ⭐⭐⭐⭐⭐ | 快 | ✅ | 250M/月 |
| Infura | ⭐⭐⭐⭐⭐ | 快 | ✅ | 100K/天 |
| PublicNode | ⭐⭐⭐⭐ | 中等 | ❌ | 无限制 |
| Ankr | ⭐⭐⭐⭐ | 快 | ❌ | 无限制 |
| rpc.sepolia.org | ⭐⭐ | 慢 | ❌ | 有限制 |

---

## 常见问题

### Q1: 为什么公共RPC不稳定？
**A:** 公共RPC由社区维护，经常过载。生产环境建议使用Alchemy或Infura。

### Q2: 如何知道RPC是否工作？
**A:** 运行测试命令：
```bash
cast block latest --rpc-url $SEPOLIA_RPC_URL
```

### Q3: 可以同时使用多个RPC吗？
**A:** Foundry每次只使用一个RPC，但可以在.env中配置多个，按需切换。

### Q4: RPC有费用吗？
**A:** Alchemy和Infura都有免费额度，个人项目完全够用。

### Q5: 部署时遇到429错误怎么办？
**A:** 429 = 请求频率过高。等待几秒或切换到更高额度的提供商。

---

## 推荐配置

### 开发环境：
```bash
SEPOLIA_RPC_URL=https://eth-sepolia.publicnode.com
```

### 生产环境：
```bash
# 使用 Alchemy
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your_key
```

---

## 当前项目配置

✅ **已配置：** `https://eth-sepolia.publicnode.com`
- 这是一个稳定且快速的公共节点
- 不需要注册
- 适合开发和小规模部署

如果遇到问题，可以随时切换到Alchemy或Infura。
