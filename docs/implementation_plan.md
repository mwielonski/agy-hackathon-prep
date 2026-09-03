# Antigravity (AGY) Hackathon Enablement Program Strategy & Action Plan

## Overview & Objective

To ensure every hackathon participant—ranging from non-technical business users to AI/Data/AppDev SMEs—feels empowered, confident, and eager to leverage **Antigravity (AGY)**, we have designed a two-tiered Enablement Strategy:

1. **Pre-Hackathon Enablement Package**: Comprehensive, self-paced & interactive training kit delivered 1–2 weeks prior to the event.
2. **Day-Of Enablement Aid**: High-impact, friction-free activation resources including a 10-minute Starter Kit and a 1-page Cheat Sheet & Prompt Reference Card.

---

## Program Structure & Persona Tailoring

The hackathon participants will represent a spectrum of skills and primary focus areas:
- **Primary Hackathon Focus**:
  - Democratizing access to enterprise data stored in BigQuery & 3P data stores.
  - Building AI agents using Google ADK (Agent Development Kit).
  - Deploying agents to Google Agent Platform.
- **Participant Personas**:
  - **Technical SMEs**: Data Engineers, AI Engineers, App Developers.
  - **Non-Technical / Business Users**: Product Managers, Business Analysts, Domain Experts.

---

## Angle 1: Pre-Hackathon Enablement Package

The Pre-Hackathon Package is hosted on an internal portal / git repository and structured into 4 self-paced modules, combining written quick-starts, video walkthrough snippets (3–5 min each), and hands-on codelabs.

### Module 1: AGY Essentials for Everyone (15 mins)
*Target: All Personas (Technical & Non-Technical)*
- **Core Concepts**: What is Antigravity (AGY)? Natural language pair programming, background task execution, subagents, and automated verification.
- **Interface & Workflow**: How to interact via Chat UI, Slash Commands (`/goal`, `/grill-me`, `/schedule`, `/learn`), and Planning Mode.
- **Prompt Engineering for AGY**: Giving clear context, specifying requirements, and letting AGY plan before executing.

### Module 2: Enterprise Data Access & BigQuery Agent Patterns (20 mins)
*Target: Business Analysts & Data SMEs*
- **Querying BigQuery safely**: Using BigQuery MCP / BigQuery SQL skills to discover datasets, inspect schemas, and build semantic queries without writing manual SQL.
- **3P Data Connectors**: How AGY leverages tools and federated queries to query external data stores.
- **Codelab**: "Ask questions about enterprise sales data in plain English and let AGY generate visualizations and reports."

### Module 3: Building & Deploying Agents with Google ADK (30 mins)
*Target: Technical SMEs & Developers*
- **ADK Integration**: Using built-in ADK skills (`google-agents-cli-code`, `google-agents-cli-scaffold`, `google-agents-cli-deploy`).
- **Scaffolding to Production**:
  1. `agents-cli scaffold create` - Creating an ADK agent from scratch with AGY.
  2. Adding custom tools and BigQuery retriever callbacks.
  3. Deploying to Cloud Run / Agent Platform using `agents-cli deploy`.

### Module 4: Live 45-Minute Workshop (Recorded)
- **Agenda**: 15 min AGY demo -> 20 min live agent creation & BigQuery querying -> 10 min Q&A.
- Recorded and indexed with timestamps for on-demand watching before the hackathon.

---

## Angle 2: Day-Of Enablement Aid

For participants who missed the pre-event training or need immediate reference during execution, Angle 2 provides zero-friction tools on day 1.

### Aid A: 10-Minute "Hackathon Starter Kit" Project Repo
A pre-configured repository (`agy-hackathon-starter-kit`) containing:
- **`README.md` / `GETTING_STARTED.md`**: Step-by-step instructions to launch AGY in 60 seconds.
- **Pre-packaged Skills & Rules**: Pre-configured BigQuery integration and ADK templates.
- **Ready-to-Run Sample Prompts**:
  1. *Data Agent Sample*: *"AGY, connect to the sample BigQuery dataset, explore the customer churn table, and generate a summary report."*
  2. *ADK Agent Sample*: *"AGY, scaffold a new ADK agent using `google-agents-cli-scaffold` that wraps a BigQuery lookup tool."*
  3. *Non-Technical Business Sample*: *"AGY, help me define the architecture and user story for my hackathon project idea."*

### Aid B: 1-Page Printable / PDF Cheat Sheet & Prompt Reference Card
A sleek, 1-page visual reference sheet distributed physically on tables and digitally as a pinned link in the hackathon Slack/Teams channel.

---

## Rollout Timeline & Execution Plan

| Timeline | Phase | Deliverable / Action Item |
| :--- | :--- | :--- |
| **T-14 Days** | Content Creation | Build `agy-hackathon-starter-kit` repo & draft 4 Pre-Hackathon modules. |
| **T-10 Days** | Video & Guide Polish | Record short video snippets & format 1-Page Cheat Sheet PDF. |
| **T-7 Days** | Package Launch | Publish Enablement Package & Host Live 45-min Webinar. |
| **T-3 Days** | Reminder & Teaser | Send Quick-Start email teaser with Starter Kit link to all registrants. |
| **Day-Of** | On-site / Virtual Activation | Distribute Cheat Sheet, pin Starter Kit link, staff AGY Help Desk. |
