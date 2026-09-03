# End-to-End Agent Lifecycle: From Scaffolding to Gemini Enterprise App

This guide walks you through the complete lifecycle of creating an AI agent with **Antigravity (AGY)** and the **Google Agent Development Kit (ADK)**, deploying it to Google Cloud, and publishing it directly into a **Gemini Enterprise App**.

---

## 🔄 The 4-Stage Agent Lifecycle

```
+-------------------+     +--------------------+     +---------------------+     +--------------------------+
|  1. BUILD & TEST  | --> |  2. EVALUATE LOCAL | --> |  3. DEPLOY CLOUD    | --> |  4. PUBLISH TO GEMINI    |
| (Scaffold + AGY)  |     | (ADK Eval / Unit)  |     | (Cloud Run / Runtime|     |     ENTERPRISE APP       |
+-------------------+     +--------------------+     +---------------------+     +--------------------------+
```

---

## Stage 1: Build Your Agent with AGY

1. **Scaffold a New Agent**:
   Launch AGY in your terminal or IDE and run:
   ```bash
   agents-cli scaffold create --template default my-enterprise-agent
   cd my-enterprise-agent
   ```
   Or instruct AGY in natural language:
   > *"AGY, use `google-agents-cli-scaffold` to create a new ADK agent called `my-enterprise-agent`."*

2. **Add Custom BigQuery & Data Tools**:
   Instruct AGY to add tools to query BigQuery or third-party APIs:
   > *"AGY, add a tool to `my-enterprise-agent` that connects to BigQuery dataset `sales_data` using Application Default Credentials."*

---

## Stage 2: Test & Evaluate Locally

Before deploying to the cloud, verify that your agent responds accurately and executes tools as expected.

1. **Local Agent Execution**:
   ```bash
   agents-cli run
   ```
2. **Run Automated Evaluations (LLM-as-a-Judge)**:
   Use AGY's evaluation skill:
   > *"AGY, run `google-agents-cli-eval` against `my-enterprise-agent` with sample queries about customer metrics."*

---

## Stage 3: Deploy to Google Cloud

Once your agent is tested, deploy it to **Agent Runtime** (Vertex AI Reasoning Engine) or **Cloud Run**:

1. **Authenticate to Google Cloud**:
   ```bash
   gcloud auth login
   gcloud auth application-default login
   gcloud config set project <YOUR_GCP_PROJECT_ID>
   ```

2. **Deploy via AGY**:
   Instruct AGY or run `agents-cli deploy`:
   ```bash
   agents-cli deploy --target agent_runtime --project-id <YOUR_GCP_PROJECT_ID> --region us-east1
   ```
   *This automatically creates `deployment_metadata.json` containing your deployed `remote_agent_runtime_id`.*

---

## Stage 4: Publish to Gemini Enterprise App

After deployment, register your agent into your organization's **Gemini Enterprise App** so business users and employees can interact with it natively in Gemini!

### Prerequisites
- Your agent is deployed (Stage 3).
- A Gemini Enterprise App exists in Google Cloud Console $\rightarrow$ **Gemini Enterprise** $\rightarrow$ **Apps**.

### Option A: Interactive Publish (Recommended)
Launch AGY or run in terminal:
```bash
agents-cli publish gemini-enterprise --interactive
```
AGY will auto-detect your `deployment_metadata.json`, list available Gemini Enterprise apps, and guide you through selecting the app.

### Option B: Programmatic / CI/CD Publish
```bash
agents-cli publish gemini-enterprise \
  --gemini-enterprise-app-id "projects/<PROJECT_NUMBER>/locations/global/collections/default_collection/engines/<APP_ID>" \
  --display-name "Enterprise Data & Sales Agent" \
  --description "Answers natural language questions about BigQuery sales data and customer retention metrics." \
  --registration-type adk
```

### Option C: Cloud Run (A2A Registration)
If your agent is deployed on Cloud Run, publish using the Agent-to-Agent (A2A) protocol card URL:
```bash
agents-cli publish gemini-enterprise \
  --agent-card-url "https://my-service-abc123.us-east1.run.app/a2a/app/.well-known/agent-card.json" \
  --gemini-enterprise-app-id "projects/<PROJECT_NUMBER>/locations/global/collections/default_collection/engines/<APP_ID>"
```

---

## 🎯 Verification: Testing in Gemini Enterprise UI

1. Open your corporate **Gemini Enterprise** web portal.
2. In the app selector, choose your Gemini Enterprise App.
3. Type `@Enterprise Data & Sales Agent` or ask a question directly!
4. Gemini Enterprise will invoke your ADK agent via native `:streamQuery` or A2A protocol and stream real-time responses!
