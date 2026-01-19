# MiniNFT - ERC721 Smart Contract

A simple ERC721 NFT smart contract built with Foundry.

## 🚀 Deployed Contracts

### Sepolia Testnet
- **Contract Address:** `0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21`
- **Network:** Sepolia
- **Chain ID:** 11155111
- **Explorer:** [View on Etherscan](https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21)
- **Contract Name:** MiniNFT
- **Symbol:** MINI
- **Status:** ✅ Verified

## 📦 Features

- ✅ ERC721 standard compliant
- ✅ Owner-restricted mint function
- ✅ Auto-incrementing token IDs
- ✅ OpenZeppelin v5.5.0
- ✅ Comprehensive test suite
- ✅ Automated deployment scripts

## 🛠️ Tech Stack

- **Solidity** ^0.8.20
- **Foundry** - Smart contract development toolkit
- **OpenZeppelin** v5.5.0 - Secure smart contract library
- **Sepolia Testnet** - Ethereum test network

## 📋 Prerequisites

- [Foundry](https://getfoundry.sh/) installed
- Node with Sepolia ETH (get from [faucet](https://sepoliafaucet.com/))

## 🚀 Installation

```bash
# Install dependencies
forge install

# Or install specific packages
forge install OpenZeppelin/openzeppelin-contracts
forge install foundry-rs/forge-std
```

## 🔧 Environment Setup

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Configure your environment variables:

```bash
# Sepolia RPC URL (get from Alchemy, Infura, or use public RPC)
SEPOLIA_RPC_URL=https://rpc.ankr.com/eth_sepolia/YOUR_KEY

# Your wallet private key (without 0x prefix)
PRIVATE_KEY=your_private_key_here

# Etherscan API Key (for contract verification)
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## 🧪 Testing

```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -vv

# Run tests with gas report
forge test --gas-report

# Run specific test
forge test --match-test testMint -vv
```

## 📜 Deployment

### Quick Deploy

```bash
# Make sure .env is configured
./deploy-sepolia.sh
```

### Manual Deploy

```bash
# Load environment variables
source .env

# Deploy to Sepolia with verification
forge script script/DeployMiniNFT.s.sol:DeployMiniNFT \
  --rpc-url $SEPOLIA_RPC_URL \
  --broadcast \
  --verify \
  -vv
```

## 🔍 Contract Verification

The contract is already verified on Etherscan. You can:

1. View the source code: [Contract Code](https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21#code)
2. Read contract: [Write Contract](https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21#writeContract)
3. Check transactions: [Transactions](https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21#events)

## 💻 Interacting with the Contract

### Using Cast CLI

```bash
# Mint an NFT (only owner)
source .env
CONTRACT="0x01Bc43B9438a08509DDC6a138c6d909B3CbECa21"
YOUR_ADDRESS=$(cast wallet address --private-key "$PRIVATE_KEY")

cast send "$CONTRACT" \
  "mint(address)" \
  "$YOUR_ADDRESS" \
  --rpc-url "$SEPOLIA_RPC_URL" \
  --private-key "$PRIVATE_KEY"
```

### Using Etherscan

1. Visit the [contract page](https://sepolia.etherscan.io/address/0x01bc43b9438a08509ddc6a138c6d909b3cbeca21)
2. Connect your MetaMask
3. Go to "Write Contract" tab
4. Connect wallet
5. Call the `mint` function with your address

## 📖 Documentation

- [Deployment Guide](docs/metamask-sepolia-setup.md) - Setup MetaMask for Sepolia
- [RPC Providers](docs/rpc-providers.md) - Available RPC providers
- [Etherscan API Key](docs/how-to-get-etherscan-api-key.md) - Get Etherscan API key
- [Contract Interaction](interact-with-contract.md) - Interact with deployed contract

## 🔐 Security

**⚠️ IMPORTANT:**
- Never commit your `.env` file!
- Never use mainnet private keys for testing!
- The `.env` file is in `.gitignore` for your protection

## 📁 Project Structure

```
web3-wallet-contracts/
├── src/
│   └── MiniNFT.sol          # ERC721 NFT contract
├── script/
│   └── DeployMiniNFT.s.sol  # Deployment script
├── test/
│   └── MiniNFT.t.sol        # Test suite
├── docs/                    # Documentation
├── foundry.toml             # Foundry config
├── .env.example             # Environment template
└── README.md
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/) for secure smart contract libraries
- [Foundry](https://getfoundry.sh/) for the amazing development toolkit

---

**Deployed by:** 0x0E683c5E3137de698f5B90a6470275A4054dD796
**Deployment Date:** January 18, 2025
