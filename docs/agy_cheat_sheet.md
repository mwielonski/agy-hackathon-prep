# Antigravity (AGY) Hackathon Day-Of Cheat Sheet & Prompt Reference

> **Welcome to the Hackathon!** Antigravity (AGY) is your AI pair programmer and builder. Use natural language to explore BigQuery data, scaffold ADK agents, and build full-stack prototypes.

---

## 🚀 60-Second Quick Start

1. **Launch AGY**: Open terminal or AGY IDE in your project workspace.
2. **State Your Goal**: Type what you want to achieve in plain English.
3. **Review the Plan**: AGY will enter **Planning Mode** and create an `implementation_plan.md`. Review and click **Proceed** (or give feedback).
4. **Watch AGY Work**: AGY will execute tasks, query datasets, write code, run tests, and verify results automatically!

---

## ⚡ Key Slash Commands

| Command | Description & Best Use Case |
| :--- | :--- |
| `/grill-me` | **Refine Requirements**: AGY interviews you interactively to clarify your project design and architecture before writing code. |
| `/goal` | **Autonomous Execution**: Gives AGY high autonomy to complete complex multi-step build tasks without stopping. |
| `/schedule` | **Background Monitoring**: Sets background timers or recurring tasks while AGY works asynchronously. |
| `/learn` | **Save Preferences**: Teaches AGY custom project patterns, coding guidelines, or setup rules for your team. |

---

## 💡 Copy-Paste Power Prompts for the Hackathon

### 📊 1. Democratizing Enterprise Data (BigQuery & 3P Data)
> **Prompt**:
> *"AGY, inspect the BigQuery dataset `<PROJECT_ID>.<DATASET_NAME>`. Show me the table schemas, identify key customer/usage metrics, and write a SQL query and Python script to generate a summary report with visualizations."*

### 🤖 2. Building & Deploying Agents with Google ADK
> **Prompt**:
> *"AGY, use `google-agents-cli-scaffold` to create a new Python ADK agent project. Add a tool that queries our BigQuery dataset, configure state management, and deploy it to Agent Platform using `google-agents-cli-deploy`."*

### 💡 3. Business & Non-Technical Users (Concept to Prototype)
> **Prompt**:
> *"AGY, act as my Principal AI Architect. I want to build a solution for `<INSERT_USE_CASE>`. Let's run `/grill-me` to refine my design, then build a working interactive web interface prototype using React/Vite."*

### 🔧 4. Debugging & Code Optimization
> **Prompt**:
> *"AGY, run the test suite for this repository. If there are any failing tests or errors, analyze the stack trace, fix the underlying bug, and verify that all tests pass cleanly."*

---

## 🛠️ AGY Core Capabilities & Capabilities Cheat Sheet

- **Subagents (`invoke_subagent`)**: AGY spawns specialized subagents in parallel to research or build complex modules.
- **Background Tasks**: Long-running commands run in the background while you continue chatting with AGY.
- **Artifacts**: View clean markdown reports, diagrams, and implementation plans in the side panel.

---

## 🆘 Need Help?
- **AGY Help Desk**: Visit the on-site AGY Help Desk in Room A / Main Stage.
- **Slack/Teams Channel**: Post in `#hackathon-agy-support` for live mentor assistance.
