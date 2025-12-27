# Decentralized Staking (SpeedRunEthereum Challenge)

This project is a decentralized staking smart contract built as part of the **SpeedRunEthereum – Decentralized Staking Challenge**.  
Users can stake ETH toward a threshold before a deadline. If the threshold is met, funds are sent to an external contract; otherwise, users can withdraw their stake.

---

## 🧱 Tech Stack

- Solidity (0.8.20)
- Hardhat
- Scaffold-ETH 2
- Next.js
- Ethers.js
- Sepolia Testnet
- Vercel (frontend deployment)

---

## 📦 Prerequisites

Make sure you have the following installed:

- **Node.js** (v18+ recommended)
- **Yarn**
- **Git**

---

## Getting Started (Local Development)

### 1️⃣ Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```
### 2️⃣ Install dependencies
```bash
yarn install
```
### 3️⃣ Start a local blockchain
```bash
yarn chain
```
This runs a local Hardhat node.
### 4️⃣ Deploy contracts locally
In a new terminal:
```bash
yarn deploy
```
### 5️⃣ Start the frontend
```bash
yarn start
```
Open your browser at:

http://localhost:3000/staker-ui

🧪 Running Tests
```bash
yarn test
```

🌐 Deploying to Sepolia Testnet

1️⃣ Configure environment variables
Create a file at:
```bash
packages/hardhat/.env
```
Add:
```bash
ALCHEMY_API_KEY=your_alchemy_api_key
ETHERSCAN_API_KEY=your_etherscan_api_key
DEPLOYER_PRIVATE_KEY_ENCRYPTED=your_encrypted_private_key
```

⚠️ Never commit .env files to GitHub.

2️⃣ Deploy to Sepolia
```bash
yarn deploy --network sepolia
```
3️⃣ Verify contracts (Checkpoint 6)
```bash
yarn verify --network sepolia
```
After verification, your contract will be visible on Sepolia Etherscan.

🖥 Frontend Deployment (Optional)

The frontend can be deployed using Vercel:
```bash
yarn vercel
```
Follow the CLI prompts to deploy.

📄 Smart Contracts

`Staker.sol` – Main staking contract\
`ExampleExternalContract.sol` – Receives funds when staking succeeds

⏱ Contract Logic Summary\
Users stake ETH before a deadline\
If total stake ≥ 1 ETH:\
Funds are sent to ExampleExternalContract\
If threshold is not met:\
Users can withdraw their funds\
Supports direct ETH transfers via receive()

---

🙌 Acknowledgements
--
Built with Scaffold-ETH 2\
Challenge by SpeedRunEthereum