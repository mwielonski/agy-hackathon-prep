# End-to-End BQ Data Agent Lifecycle: Building BigQuery Data Agents & Publishing to Gemini Enterprise App

This guide walks you through the primary hackathon goal: **Building a BigQuery Data Agent with Antigravity (AGY)** that democratizes access to enterprise BigQuery data, wrapping it with the **Google Agent Development Kit (ADK)**, deploying it, and publishing it directly into a **Gemini Enterprise App**.

---

## 🎯 Hackathon Primary Goal & Architecture

Participants will build **BigQuery Data Agents** that allow enterprise users to ask natural language questions about complex datasets in BigQuery (and 3P data stores). The agent converts questions into optimized BigQuery SQL, executes semantic searches/aggregations, formats data insights, and streams responses directly into the **Gemini Enterprise App**.

```
+-------------------------------------------------------------------------------------------------------+
|                                    END-TO-END DATA AGENT ARCHITECTURE                                 |
|                                                                                                       |
|  [ Enterprise User ]                                                                                  |
|          |                                                                                            |
|          v                                                                                            |
|  [ Gemini Enterprise App ]  <-- Invokes Native StreamQuery / A2A                                         |
|          |                                                                                            |
|          v                                                                                            |
|  [ Deployed BQ Data Agent (ADK on Agent Runtime / Cloud Run) ]                                        |
|          |                                                                                            |
|          +--> 1. Schema & Vector Search (INFORMATION_SCHEMA / AI.SEARCH / Vector Index)               |
|          +--> 2. Semantic SQL & AI Functions (AI.GENERATE / AI.AGG / AI.FORECAST)                      |
|          +--> 3. Query Execution & Verification against BigQuery                                      |
|          |                                                                                            |
|          v                                                                                            |
|  [ BigQuery & Enterprise Data Lakehouse (3P Connectors) ]                                            |
+-------------------------------------------------------------------------------------------------------+
```

---

## 🔄 The 4-Stage BigQuery Data Agent Lifecycle

---

### Stage 1: Build Your BigQuery Data Agent with AGY & ADK

1. **Scaffold the Data Agent Project**:
   Ask AGY in plain English:
   > *"AGY, use `google-agents-cli-scaffold` to create a new ADK Python agent named `bq-sales-data-agent`."*

2. **Equip the Agent with BigQuery Data Tools**:
   Instruct AGY to add tools for schema introspection, SQL generation, and semantic querying against your BigQuery dataset:
   > *"AGY, add BigQuery retriever tools to `bq-sales-data-agent` that inspect dataset `<PROJECT_ID>.<DATASET_NAME>`, run safe SQL queries using Application Default Credentials, and summarize results."*

3. **Integrate BQ AI Functions (Optional Advanced Pattern)**:
   Enhance your agent with BigQuery built-in GenAI functions (`AI.GENERATE`, `AI.SEARCH`, `AI.AGG`, `AI.FORECAST`):
   > *"AGY, update the agent's SQL generator tool to use `AI.SEARCH` for vector lookup over unstructured customer notes in BigQuery."*

---

### Stage 2: Test & Verify Queries Locally

Validate that your agent accurately generates BigQuery SQL and handles missing tables or permission errors gracefully.

1. **Test Data Queries Locally**:
   ```bash
   agents-cli run
   ```
   *Prompt test*: `"What were our top 3 revenue-generating product categories in Q3, and what is the forecasted growth for next month?"`

2. **Automated Evaluation against BigQuery Schemas**:
   > *"AGY, run `google-agents-cli-eval` against `bq-sales-data-agent` to evaluate query correctness and latency on BigQuery test cases."*

---

### Stage 3: Deploy the BigQuery Data Agent to Google Cloud

Deploy the agent to **Vertex AI Agent Runtime** (Reasoning Engine) or **Cloud Run** so it can safely execute BigQuery queries on behalf of enterprise users.

1. **Set Cloud Credentials & Project**:
   ```bash
   gcloud auth login
   gcloud auth application-default login
   gcloud config set project <YOUR_GCP_PROJECT_ID>
   ```

2. **Deploy to Agent Runtime via AGY**:
   ```bash
   agents-cli deploy --target agent_runtime --project-id <YOUR_GCP_PROJECT_ID> --region us-east1
   ```
   *This automatically generates `deployment_metadata.json` containing the deployed agent runtime ID.*

---

### Stage 4: Publish to Gemini Enterprise App

Register your deployed BigQuery Data Agent into your company's **Gemini Enterprise App** so business users and analysts can chat with their BigQuery data in real-time!

#### Prerequisites
- Your BigQuery Data Agent is deployed (Stage 3).
- Your BigQuery service account / user credentials have read access to target BigQuery tables.
- A Gemini Enterprise App exists in Google Cloud Console $\rightarrow$ **Gemini Enterprise** $\rightarrow$ **Apps**.

#### Option A: Interactive Publish (Recommended)
Run inside AGY or your terminal:
```bash
agents-cli publish gemini-enterprise --interactive
```
AGY auto-detects `deployment_metadata.json`, lists your Gemini Enterprise Apps, and completes the registration.

#### Option B: Programmatic / CI/CD Command
```bash
agents-cli publish gemini-enterprise \
  --gemini-enterprise-app-id "projects/<PROJECT_NUMBER>/locations/global/collections/default_collection/engines/<APP_ID>" \
  --display-name "BigQuery Enterprise Sales Agent" \
  --description "Answers natural language questions about enterprise BigQuery sales data, customer retention, and forecasts." \
  --registration-type adk
```

---

## 🎯 End-User Experience in Gemini Enterprise UI

Once published, non-technical business users and executives can interact with BigQuery data directly inside Gemini Enterprise:

1. User opens **Gemini Enterprise** in their browser.
2. In the chat prompt, the user selects or tags `@BigQuery Enterprise Sales Agent`.
3. User asks: *"Show me customer churn trends by region in BigQuery for the last quarter."*
4. The BigQuery Data Agent runs the query behind the scenes and streams back clean markdown tables, summaries, and key drivers!
