# 如何获取 Etherscan API Key

## 什么是 Etherscan API Key？

Etherscan API Key 用于：
- ✅ 在区块链浏览器上验证智能合约
- ✅ 查询合约源代码
- ✅ 通过API访问区块链数据
- ✅ Foundry部署时自动验证合约

---

## 获取步骤（5分钟完成）

### 步骤 1：访问 Etherscan

1. 打开浏览器，访问 https://etherscan.io/
2. 点击右上角的 **"注册"** 按钮（如果没有账号）

### 步骤 2：注册账号

1. 填写注册信息：
   - 用户名（Username）
   - 邮箱地址（Email Address）
   - 密码（Password）
2. 点击 **"创建账号"** 按钮

### 步骤 3：验证邮箱

1. 检查你的邮箱
2. 找到来自 Etherscan 的验证邮件
3. 点击邮件中的验证链接
4. ✅ 邮箱验证完成

### 步骤 4：登录账号

1. 返回 https://etherscan.io/
2. 点击右上角的 **"登录"** 按钮
3. 输入你的账号密码
4. 登录成功

### 步骤 5：进入 API Key 页面

1. 登录后，点击右上角的 **用户名** 或头像
2. 在下拉菜单中选择 **"API Keys"** 或 "API密钥"

### 步骤 6：创建 API Key

1. 在 API Keys 页面，点击 **"添加"** 按钮
2. 填写表单：
   - **App Name**: 随意填写，例如 "MyFoundryProject"
   - **Email**: 已自动填充你的邮箱
   - **Website**: 可选，留空或填你的网站
3. 点击 **"Submit"** 或 **"提交"** 按钮

### 步骤 7：复制 API Key

1. 提交后，你会看到一个 **API Key**
2. 格式类似：`YourApiKeyToken` + 一串字符
3. 点击复制按钮，复制完整的 API Key

---

## API Key 示例

```
YourApiKeyToken ABCD1234EFGH5678IJKL9012MNOP3456
```

⚠️ **注意**：复制时包含 "YourApiKeyToken " 前缀和后面的空格

---

## 将 API Key 添加到项目

### 方法1：编辑 .env 文件

```bash
# 打开 .env 文件
vim .env

# 添加或修改以下行
ETHERSCAN_API_KEY=YourApiKeyToken ABCD1234EFGH5678IJKL9012MNOP3456
```

### 方法2：使用命令行

```bash
# 直接修改 .env 文件
echo "ETHERSCAN_API_KEY=你的API_Key" >> .env

# 示例
echo "ETHERSCAN_API_KEY=YourApiKeyToken ABCD1234EFGH5678IJKL9012MNOP3456" >> .env
```

---

## 验证 API Key 配置

### 测试配置是否正确

```bash
# 运行配置检查脚本
./check-config.sh

# 或手动验证
source .env
echo $ETHERSCAN_API_KEY
```

---

## Etherscan API Key 限制

### 免费账户限制：
- ✅ **每5秒** 最多 5 次调用
- ✅ **每天** 最多 100,000 次调用
- ✅ 足够个人项目使用

### 如果需要更高额度：
- 升级到付费计划（个人项目通常不需要）

---

## Sepolia 测试网专用 API Key

### 重要说明：

**Sepolia 测试网使用主网 Etherscan 的 API Key！**

- ✅ 不需要单独注册 Sepolia API Key
- ✅ 主网 Etherscan API Key 同时支持 Sepolia
- ✅ 在 .env 中只需配置一个 ETHERSCAN_API_KEY

### 测试网 API Key 使用：

```toml
# foundry.toml 配置
[etherscan]
sepolia = { key = "${ETHERSCAN_API_KEY}" }
```

---

## 常见问题

### Q1: API Key 是免费的吗？
**A:** 是的，免费账户的 API Key 完全免费，足够个人项目使用。

### Q2: API Key 会过期吗？
**A:** 不会过期，永久有效。

### Q3: 可以在多个项目使用同一个 API Key 吗？
**A:** 可以，一个 API Key 可以用于多个项目。

### Q4: 如何保护 API Key 安全？
**A:**
- ✅ 添加到 .gitignore（已配置）
- ✅ 不要提交到 Git 仓库
- ✅ 不要公开分享

### Q5: 忘记了 API Key 怎么办？
**A:** 重新登录 Etherscan → API Keys 页面 → 查看或创建新的

### Q6: API Key 包含空格吗？
**A:** 是的，完整格式是：`YourApiKeyToken ` + 实际的key（注意Token后面有空格）

### Q7: Foundry 验证合约失败怎么办？
**A:**
1. 检查 API Key 是否正确
2. 确认网络配置正确（sepolia）
3. 等待几分钟后重试（可能有延迟）

---

## 快速操作流程总结

```
1. 访问 https://etherscan.io/
2. 注册账号 → 验证邮箱
3. 登录 → 用户名 → API Keys
4. 添加 → 填写 App Name → 提交
5. 复制 API Key
6. 添加到 .env 文件
```

---

## 下一步

配置完成后：

1. **验证配置**
   ```bash
   ./check-config.sh
   ```

2. **部署合约**
   ```bash
   ./deploy-sepolia.sh
   ```

3. **在 Etherscan 查看验证的合约**
   - 部署成功后会自动验证
   - 可以在 Sepolia Etherscan 查看合约源代码

---

## 有用的链接

- **Etherscan 主网**: https://etherscan.io/
- **Sepolia Etherscan**: https://sepolia.etherscan.io/
- **Etherscan API 文档**: https://docs.etherscan.io/
- **Etherscan API 注册**: https://etherscan.io/myapikey
