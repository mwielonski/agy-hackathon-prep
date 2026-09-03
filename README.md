# Antigravity (AGY) Hackathon Enablement & Starter Kit

Welcome to the **Antigravity (AGY) Hackathon Enablement Repository**! This repository provides a complete toolkit designed to help hackathon participants—from non-technical business users to AI, Data, and AppDev SMEs—comfortably use Antigravity (AGY) to **build BigQuery Data Agents** and publish them directly into **Gemini Enterprise Apps**.

---

## 🎯 Hackathon Focus: BigQuery Data Agents to Gemini Enterprise

The core mission for this hackathon is to **democratize enterprise data**:
1. Use **AGY** to build AI Data Agents that connect to **BigQuery** (and 3P data stores).
2. Wrap the agent with **Google Agent Development Kit (ADK)** and deploy to Vertex AI Agent Runtime or Cloud Run.
3. Publish your BigQuery Data Agent into **Gemini Enterprise App** so business users can chat with their data in plain English!

---

## 🏥 Complete End-to-End Healthcare Payer Demo Guide
👉 **[Read the Healthcare Payer Demo & Verification Guide](docs/healthcare_payer_demo_guide.md)**
- **Synthetic Data Included**: `starter-kit/data/synthetic_healthcare_payer_dataset.sql` (Members, Claims, Providers).
- **Executable Agent Code**: `starter-kit/agents/adk_agent_template/healthcare_data_agent.py`.
- **Complete GCP Setup**: `gcloud` and `bq` infrastructure commands.
- **End-to-End Verification**: Step-by-step instructions to build, deploy, publish, and test in **Gemini Enterprise App** before hackathon day!

---

## ⚡ 5-Minute Quick Start: How to Use This Repo

### Option 1: Clone Locally (Recommended)
1. **Clone this repository**:
   ```bash
   git clone https://github.com/mwielonski/agy-hackathon-prep.git
   cd agy-hackathon-prep
   ```
2. **Launch AGY**:
   - **Using AGY Desktop App (2.0)**: Open the app, click **Open Project**, and select the `agy-hackathon-prep` folder.
   - **Using VS Code Extension**: Open VS Code in this directory and start a chat session in the sidebar or press `⌘+I` / `Ctrl+I`.
   - **Using AGY CLI**: Run `agy` in your terminal inside this directory.

3. **Build Your First BQ Data Agent with AGY**:
   Open a chat with AGY and copy-paste this prompt:
   > *"AGY, help me build a BigQuery Data Agent using ADK that connects to our synthetic healthcare dataset in `starter-kit/data/synthetic_healthcare_payer_dataset.sql`!"*

---

### Option 2: Download as ZIP (No Git Required)
1. Click the green **Code** button at the top of this GitHub page $\rightarrow$ **Download ZIP**.
2. Extract the ZIP file on your computer.
3. Open the extracted folder in AGY (Desktop App, VS Code, or CLI) and start chatting!

---

## 📂 Repository Contents & Navigation

```
agy-hackathon-prep/
├── README.md                           # Main portal & quick-start guide
├── docs/
│   ├── healthcare_payer_demo_guide.md  # End-to-End Demo: Healthcare BQ Agent to Gemini Enterprise
│   ├── agent_lifecycle_and_gemini_enterprise.md # BQ Data Agent Lifecycle Architecture
│   ├── agy_101_overview.md             # AGY 101: Harness vs LLM, Flavors (2.0/IDE/CLI) & Install
│   ├── agy_cheat_sheet.md               # 1-Page Day-Of Quick Reference & Prompt Guide
│   ├── pre_hackathon_enablement_package.md # 4-Module Pre-Hackathon Learning Package
│   └── implementation_plan.md          # Program Strategy, Persona Specs & Timeline
└── starter-kit/                        # Pre-configured hackathon project templates
    ├── README.md                       # Starter Kit instructions
    ├── data/
    │   ├── sample_bq_queries.sql       # Enterprise BigQuery data query templates
    │   └── synthetic_healthcare_payer_dataset.sql # Healthcare claims & members dataset
    └── agents/
        └── adk_agent_template/         # Google ADK Agent template
            └── healthcare_data_agent.py # Healthcare BQ Data Agent python tools
```

---

## 📄 License

This repository is licensed under the [MIT License](LICENSE).
