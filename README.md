# Antigravity (AGY) Hackathon Enablement & Starter Kit

Welcome to the **Antigravity (AGY) Hackathon Enablement Repository**! This repository provides a complete, accessible toolkit designed to help hackathon participants—from non-technical business users and managers to AI, Data, and AppDev SMEs—comfortably use Antigravity (AGY) to **build BigQuery Data Agents** and publish them directly into **Gemini Enterprise Apps**.

---

## 🧭 Choose Your Persona Path: Where Do I Start?

Find your background below to follow a tailored learning path designed for your role:

| Persona / Background | Your Primary Goal | Recommended Starting Point |
| :--- | :--- | :--- |
| 👔 **Business / Product / Management** | Understand AGY capabilities, write natural language prompts, and create executive summaries without writing code. | 👉 **[Day-Of Cheat Sheet & Business Prompts](docs/agy_cheat_sheet.md)** |
| 📊 **Data Analysts & Data Engineers** | Profile BigQuery data, inspect schemas in BigQuery Studio, and write Golden SQL queries. | 👉 **[BigQuery Data Profiling & Golden Queries](docs/healthcare_payer_demo_guide.md#step-2-data-profiling-in-bigquery-console-bigquery-studio-explorer)** |
| 🤖 **AI SMEs & Software Engineers** | Scaffold Python ADK agents, add custom BQ tools, deploy to Vertex AI Runtime, and publish to Gemini Enterprise App. | 👉 **[Healthcare Payer End-to-End Demo Guide](docs/healthcare_payer_demo_guide.md)** |
| 🛠️ **IT & Cloud Administrators** | Provision GCP infrastructure, enable APIs, configure IAM roles, and set up project permissions. | 👉 **[GCP Infrastructure Setup Guide](docs/healthcare_payer_demo_guide.md#step-1-provision-gcp-infrastructure--synthetic-data)** |

---

## ⚡ 5-Minute Quick Start: How to Use This Repo

### Option 1: Clone Locally (Recommended for Technical Roles)
1. **Clone this repository**:
   ```bash
   git clone https://github.com/mwielonski/agy-hackathon-prep.git
   cd agy-hackathon-prep
   ```
2. **Launch AGY**:
   - **AGY Desktop App (2.0)**: Open the app, click **Open Project**, and select the `agy-hackathon-prep` folder.
   - **VS Code Extension**: Open VS Code in this directory and start a chat session in the sidebar (`⌘+I` / `Ctrl+I`).
   - **AGY CLI**: Run `agy` in your terminal inside this directory.

3. **Build Your BQ Data Agent with AGY**:
   Open a chat with AGY and copy-paste this prompt:
   > *"AGY, help me build a BigQuery Data Agent using ADK that connects to our synthetic healthcare dataset in `starter-kit/data/synthetic_healthcare_payer_dataset.sql`!"*

---

### Option 2: Download as ZIP (Recommended for Non-Technical Roles)
1. Click the green **Code** button at the top of this GitHub page $\rightarrow$ **Download ZIP**.
2. Extract the ZIP file on your computer.
3. Open the extracted folder in AGY (Desktop App, VS Code, or CLI) and start chatting!

---

## 📂 Repository Contents & Navigation

```
agy-hackathon-prep/
├── README.md                           # Main portal & Persona navigation guide
├── docs/
│   ├── healthcare_payer_demo_guide.md  # End-to-End Demo: Healthcare BQ Agent to Gemini Enterprise
│   ├── agent_lifecycle_and_gemini_enterprise.md # BQ Data Agent Lifecycle Architecture
│   ├── agy_101_overview.md             # AGY 101: Harness vs LLM, Flavors (2.0/IDE/CLI) & Install
│   ├── agy_cheat_sheet.md               # 1-Page Day-Of Quick Reference & Business Prompts
│   ├── pre_hackathon_enablement_package.md # 4-Module Pre-Hackathon Learning Package
│   └── implementation_plan.md          # Program Strategy, Persona Specs & Timeline
└── starter-kit/                        # Pre-configured hackathon project templates
    ├── README.md                       # Starter Kit instructions
    ├── data/
    │   ├── sample_bq_queries.sql       # Enterprise BigQuery data query templates
    │   ├── golden_healthcare_queries.sql # Few-shot exemplar SQL queries
    │   └── synthetic_healthcare_payer_dataset.sql # Healthcare claims & members dataset
    └── agents/
        └── adk_agent_template/         # Google ADK Agent template
            └── healthcare_data_agent.py # Healthcare BQ Data Agent python tools
```

---

## 🛠️ Common Pitfalls & 5-Minute Fixes

| Issue / Error | Cause | 5-Minute Solution |
| :--- | :--- | :--- |
| **BigQuery 403 Access Denied** | Missing IAM roles for your user / service account. | Run `gcloud auth application-default login` and assign `roles/bigquery.dataViewer` or `roles/bigquery.admin`. |
| **Dataset Location Mismatch** | Query created in `us-east1` while dataset is in `US` multi-region. | Ensure `bq --location=us-east1` is specified when creating datasets and running queries. |
| **Gemini Enterprise App Not Found** | Missing Discovery Engine permissions or app not created yet. | Verify your GCP user has `roles/discoveryengine.editor` and that an app exists under Console $\rightarrow$ Gemini Enterprise $\rightarrow$ Apps. |
| **LLM SQL Hallucinations** | Agent missing categorical string values or schema constraints. | Ensure Golden Queries from `golden_healthcare_queries.sql` and BigQuery Data Profile insights are provided to AGY during agent prompt setup. |

---

## 📄 License

This repository is licensed under the [MIT License](LICENSE).
