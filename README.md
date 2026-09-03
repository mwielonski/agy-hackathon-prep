# Antigravity (AGY) Hackathon Enablement & Starter Kit

Welcome to the **Antigravity (AGY) Hackathon Enablement Repository**! This repository provides a complete toolkit designed to help hackathon participants—from non-technical business users to AI, Data, and AppDev SMEs—comfortably use Antigravity (AGY) to build, test, and deploy their hackathon projects.

---

## ⚡ 5-Minute Quick Start: How to Use This Repo

You don't need a complex setup to get started! Follow these simple steps:

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

3. **Start Building with AGY**:
   Open a chat with AGY and copy-paste this prompt:
   > *"AGY, inspect the `starter-kit/` folder in this repo and help me build a hackathon prototype that queries BigQuery!"*

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
│   ├── agy_101_overview.md             # AGY 101: Harness vs LLM, Flavors (2.0/IDE/CLI) & Install
│   ├── agent_lifecycle_and_gemini_enterprise.md # End-to-End: Scaffold -> Deploy -> Publish to Gemini Enterprise
│   ├── agy_cheat_sheet.md               # 1-Page Day-Of Quick Reference & Prompt Guide
│   ├── pre_hackathon_enablement_package.md # 4-Module Pre-Hackathon Learning Package
│   └── implementation_plan.md          # Program Strategy, Persona Specs & Timeline
└── starter-kit/                        # Pre-configured hackathon project templates
    ├── README.md                       # Starter Kit instructions
    ├── data/
    │   └── sample_bq_queries.sql       # Enterprise data query templates
    └── agents/
        └── adk_agent_template/         # Google ADK Agent template
```

---

## 🚀 Key Documentation Guides

### 1. AGY 101 Overview & Installation Guide
👉 **[Read AGY 101: Overview, Harness vs. LLM & Setup](docs/agy_101_overview.md)**
- What is AGY? Agentic pair programmer vs. raw frontier model (LLM).
- The 3 AGY Flavors: Antigravity 2.0 Desktop App, VS Code Extension, and CLI (`agy`).
- Step-by-step installation instructions.

### 2. End-to-End Agent Lifecycle: Building to Gemini Enterprise App
👉 **[Read Agent Lifecycle & Gemini Enterprise Publishing Guide](docs/agent_lifecycle_and_gemini_enterprise.md)**
- **Stage 1 (Build)**: Scaffolding ADK agents and adding BigQuery tools with AGY.
- **Stage 2 (Test)**: Running local evaluations (`google-agents-cli-eval`).
- **Stage 3 (Deploy)**: Deploying to Cloud Run or Agent Runtime (`google-agents-cli-deploy`).
- **Stage 4 (Publish)**: Registering your agent directly into a **Gemini Enterprise App** (`agents-cli publish gemini-enterprise`).

### 3. Day-Of Cheat Sheet & Prompt Reference
👉 **[Read the 1-Page Day-Of Cheat Sheet](docs/agy_cheat_sheet.md)**
- 60-Second Quick Start and slash commands (`/grill-me`, `/goal`, `/schedule`, `/learn`).
- Copy-paste power prompts for BigQuery, ADK agents, and UI prototyping.

### 4. Pre-Hackathon Enablement Package
👉 **[Go to Pre-Hackathon Learning Modules](docs/pre_hackathon_enablement_package.md)**
- Self-paced learning modules & codelabs for technical and business users.

---

## 📄 License

This repository is licensed under the [MIT License](LICENSE).
