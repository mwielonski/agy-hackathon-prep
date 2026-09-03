# Pre-Hackathon Enablement Package & Starter Kit Guide

Welcome to the **Antigravity (AGY) Enablement Toolkit**. This guide contains pre-hackathon learning modules, hands-on codelabs, and instructions for setting up the **Hackathon Starter Kit**.

---

## 📚 Module 1: AGY Core Concepts & Fundamentals (15 Min)

### What is Antigravity?
Antigravity (AGY) is Google’s AI-first development platform designed to pair-program with you, execute shell commands, manage background tasks, research codebases, and write production-grade applications.

### Key Concepts to Know:
1. **Chat & Natural Language**: Talk to AGY like a senior staff engineer on your team.
2. **Planning Mode**: AGY first proposes an `implementation_plan.md` before making code changes. You stay in full control.
3. **Artifacts**: Rich markdown documents, diagrams, and reports generated in your workspace.
4. **Subagents**: AGY can spawn dedicated background agents to research or handle subtasks concurrently.

---

## 📊 Module 2: Democratizing Data with BigQuery & 3P Connectors (20 Min)

Many hackathon projects require unlocking insights from enterprise data in BigQuery and third-party stores.

### Codelab: Exploring BigQuery with AGY
1. **Schema Discovery**:
   - Ask AGY: *"List the datasets available in project `<PROJECT_ID>` and summarize the schema for table `analytics.customer_events`."*
2. **Natural Language Querying**:
   - Ask AGY: *"Find the top 5 product categories with highest growth month-over-month. Use `bigquery-sql` rules to make the query performant."*
3. **Visualization & Data Apps**:
   - Ask AGY: *"Build a simple Streamlit / React dashboard that runs this BigQuery query and displays an interactive chart."*

---

## 🤖 Module 3: Building & Deploying Agents with ADK (30 Min)

Learn how to build, test, and deploy custom AI agents using the **Agent Development Kit (ADK)** and AGY's built-in ADK skills.

### Codelab: Building Your First ADK Agent
1. **Scaffold Project**:
   ```bash
   # AGY can run this for you!
   agents-cli scaffold create --template default my-data-agent
   ```
2. **Add Tools & State**:
   - Tell AGY: *"Add a custom python tool to `my-data-agent` that queries BigQuery using Application Default Credentials."*
3. **Local Testing & Evaluation**:
   - Tell AGY: *"Use `google-agents-cli-eval` skill to run evaluation cases against my ADK agent."*
4. **Deploy to Agent Platform**:
   - Tell AGY: *"Deploy `my-data-agent` using `google-agents-cli-deploy` to Cloud Run / Agent Platform."*

---

## 🚀 Hackathon Starter Kit Repository Structure

To kickstart your hackathon project on Day 1, clone or download the starter kit structure below:

```
agy-hackathon-starter-kit/
├── .gemini/
│   └── rules/                  # Custom rules for AGY project context
├── data/
│   └── sample_bq_queries.sql   # Example BigQuery queries
├── agents/
│   └── adk_agent_template/     # Pre-scaffolded ADK agent template
├── ui/
│   └── dashboard_template/     # Pre-configured web dashboard (React/Vite)
├── GETTING_STARTED.md           # Quick setup instructions
└── README.md                   # Hackathon project template
```

---

## 🎥 Video Snippet & Workshop Links
- 📽️ **Video 1 (5 min)**: *AGY 101: Chat, Planning Mode & Verification*
- 📽️ **Video 2 (7 min)**: *BigQuery & Data Exploration with AGY*
- 📽️ **Video 3 (8 min)**: *Building & Deploying ADK Agents with AGY*
- 📺 **Full 45-Min Webinar Recording**: *Live Q&A and Hackathon Demo Session*
