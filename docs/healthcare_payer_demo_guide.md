# Complete Demo & Setup Guide: Healthcare Payer BigQuery Data Agent to Gemini Enterprise

This end-to-end tutorial provides a **fully executable Healthcare Payer Data Agent demo** for hackathon organizers and participants to test ahead of time.

It proves that the full path works smoothly:
1. **Provisioning GCP Infrastructure & Synthetic Data**.
2. **Data Profiling in BigQuery** to extract schema metadata, column statistics, and value distributions.
3. **Building a BQ Data Agent with AGY & ADK** incorporating **Golden Queries** for few-shot LLM guidance.
4. **Deploying to Vertex AI Agent Runtime / Cloud Run**.
5. **Publishing and exercising the Agent inside Gemini Enterprise App**.

---

## 🏥 Use Case Overview: Healthcare Payer Claims & Member Analytics

In healthcare payer organizations (health insurance), customer service reps, case managers, and claims analysts spend hours looking up member eligibility, claims payment/denial statuses, and provider network coverage across siloed systems.

**The Solution**: A **Healthcare Payer BigQuery Data Agent** built with AGY and ADK that converts natural language queries into safe, real-time SQL queries over BigQuery claims, member, and provider datasets—and streams responses directly into **Gemini Enterprise App**.

---

## 📋 Step-by-Step Setup & Verification Blueprint

```
+--------------------------------------------------------------------------------------------------------------------+
|                                    DEMO VERIFICATION WORKFLOW                                                      |
|                                                                                                                    |
| 1. GCP Infra & Data  -->  2. Data Profiling  -->  3. Build Agent with   --> 4. Deploy Runtime  --> 5. Publish GE App|
|  (gcloud BQ dataset &     (Extract Metadata &     Golden Queries             (agents-cli deploy    (agents-cli publish|
|   synthetic tables)        Column Statistics)     (AGY & ADK Agent)           to Vertex AI)         gemini-enterprise) |
+--------------------------------------------------------------------------------------------------------------------+
```

---

## Step 1: Provision GCP Infrastructure & Synthetic Data

Run these `gcloud` and `bq` commands in your Cloud Shell or terminal to create the GCP project resources and load synthetic healthcare tables (`members`, `claims`, `providers`).

### 1.1 Set Project Environment Variables
```bash
export PROJECT_ID="<YOUR_GCP_PROJECT_ID>"
export REGION="us-east1"
export DATASET_ID="healthcare_payer_demo"

gcloud config set project $PROJECT_ID
```

### 1.2 Enable Required GCP APIs
```bash
gcloud services enable \
  bigquery.googleapis.com \
  aiplatform.googleapis.com \
  discoveryengine.googleapis.com \
  run.googleapis.com \
  cloudbuild.googleapis.com
```

### 1.3 Create BigQuery Dataset & Synthetic Healthcare Tables
```bash
# Create BigQuery Dataset
bq --location=$REGION mk --dataset ${PROJECT_ID}:${DATASET_ID}

# Populate Synthetic Tables (Members, Claims, Providers)
bq query --use_legacy_sql=false "
CREATE OR REPLACE TABLE \`${PROJECT_ID}.${DATASET_ID}.members\` (
  member_id STRING OPTIONS(description='Unique member ID'), 
  first_name STRING, 
  last_name STRING, 
  plan_type STRING OPTIONS(description='HMO, PPO, EPO, POS'), 
  coverage_status STRING OPTIONS(description='ACTIVE, INACTIVE, SUSPENDED'), 
  effective_date DATE, 
  copay_amount NUMERIC
);

INSERT INTO \`${PROJECT_ID}.${DATASET_ID}.members\` VALUES
  ('MEM-1001', 'Alice', 'Smith', 'PPO', 'ACTIVE', DATE('2024-01-01'), 25.00),
  ('MEM-1002', 'Bob', 'Jones', 'HMO', 'ACTIVE', DATE('2023-06-15'), 15.00),
  ('MEM-1003', 'Charlie', 'Brown', 'PPO', 'INACTIVE', DATE('2022-03-01'), 30.00),
  ('MEM-1004', 'Diana', 'Prince', 'EPO', 'ACTIVE', DATE('2024-02-01'), 20.00),
  ('MEM-1005', 'Evan', 'Wright', 'HMO', 'ACTIVE', DATE('2023-11-01'), 15.00);

CREATE OR REPLACE TABLE \`${PROJECT_ID}.${DATASET_ID}.claims\` (
  claim_id STRING OPTIONS(description='Unique claim ID'), 
  member_id STRING, 
  service_date DATE, 
  diagnosis_code STRING OPTIONS(description='ICD-10 Code'), 
  procedure_code STRING OPTIONS(description='CPT Code'), 
  billed_amount NUMERIC, 
  paid_amount NUMERIC, 
  claim_status STRING OPTIONS(description='PAID, DENIED, PENDING')
);

INSERT INTO \`${PROJECT_ID}.${DATASET_ID}.claims\` VALUES
  ('CLM-9001', 'MEM-1001', DATE('2024-08-10'), 'E11.9', '99214', 350.00, 280.00, 'PAID'),
  ('CLM-9002', 'MEM-1002', DATE('2024-08-12'), 'I10', '99213', 200.00, 160.00, 'PAID'),
  ('CLM-9003', 'MEM-1001', DATE('2024-08-15'), 'M54.5', '97110', 450.00, 0.00, 'DENIED'),
  ('CLM-9004', 'MEM-1004', DATE('2024-08-20'), 'J01.90', '99214', 300.00, 240.00, 'PAID'),
  ('CLM-9005', 'MEM-1005', DATE('2024-08-22'), 'E11.9', '99215', 500.00, 0.00, 'PENDING');
"
```

---

## Step 2: Data Profiling in BigQuery (Metadata & Column Statistics)

Before building the agent, **Data Profiling** extracts schema descriptions, column data types, distinct value counts, and null ratios. This profiling metadata is provided to the agent's prompt context so the LLM understands valid column values (e.g., `coverage_status` values are `'ACTIVE'`, `'INACTIVE'`, `'SUSPENDED'`).

### 2.1 Run Profiling Queries in BigQuery
Run this profiling query to extract schema metadata and column statistics for the `claims` and `members` tables:

```sql
-- Profile 1: Inspect Column Schemas & Descriptions
SELECT 
  table_name, column_name, data_type, is_nullable
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.INFORMATION_SCHEMA.COLUMNS`;

-- Profile 2: Value Distribution & Cardinality Check for Claims
SELECT 
  claim_status, 
  COUNT(*) AS status_count, 
  AVG(billed_amount) AS avg_billed_amount
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims`
GROUP BY 1;
```

### 2.2 Feed Profiling Metadata to AGY
Ask AGY to inspect the profiled metadata:
> *"AGY, inspect the profiled metadata for `healthcare_payer_demo` dataset. Note that `claim_status` contains values ('PAID', 'DENIED', 'PENDING') and `plan_type` contains ('HMO', 'PPO', 'EPO'). Ensure all generated queries use these exact string literals."*

---

## Step 3: Build the Agent with Golden Queries (Few-Shot Guidance)

**Golden Queries** are validated baseline SQL queries that act as few-shot exemplars to guide and refine LLM SQL generation.

### 3.1 Review Golden Queries (`starter-kit/data/golden_healthcare_queries.sql`)
The repository includes pre-built Golden Queries for healthcare payer workflows:

```sql
-- Golden Query Exemplar: Denied Claims Analysis
SELECT 
  claim_id, member_id, service_date, diagnosis_code, procedure_code, billed_amount, claim_status
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims`
WHERE 
  claim_status = 'DENIED'
ORDER BY 
  service_date DESC;
```

### 3.2 Build Agent with AGY & ADK
1. **Scaffold ADK Agent Project**:
   ```bash
   agents-cli scaffold create --template default healthcare-payer-agent
   cd healthcare-payer-agent
   ```

2. **Inject Golden Queries into AGY Agent Prompt**:
   Instruct AGY to build the agent using the golden query exemplars:
   > *"AGY, build `healthcare-payer-agent` using `starter-kit/agents/adk_agent_template/healthcare_data_agent.py`. Inject the golden queries from `starter-kit/data/golden_healthcare_queries.sql` as few-shot prompt instructions so the LLM follows our verified SQL patterns."*

3. **Test Agent Locally**:
   ```bash
   agents-cli run
   ```
   *Prompt*: `"Show me all denied claims for member MEM-1001 and check if their coverage is active."`

---

## Step 4: Deploy Agent to Vertex AI Agent Runtime

1. **Grant IAM Permissions**:
   ```bash
   gcloud projects add-iam-policy-binding $PROJECT_ID \
     --member="user:$(gcloud config get-value account)" \
     --role="roles/bigquery.dataViewer"
   ```

2. **Deploy via AGY / CLI**:
   ```bash
   agents-cli deploy \
     --target agent_runtime \
     --project-id $PROJECT_ID \
     --region $REGION
   ```
   *Output*: Creates `deployment_metadata.json` containing `remote_agent_runtime_id`.

---

## Step 5: Publish to Gemini Enterprise App

1. **Interactive Publishing**:
   ```bash
   agents-cli publish gemini-enterprise --interactive
   ```
   - AGY auto-detects `deployment_metadata.json`.
   - Select your target **Gemini Enterprise App**.
   - Set Display Name: `"Healthcare Claims & Eligibility Agent"`.
   - Set Description: `"Answers natural language questions about healthcare claims, member eligibility, copays, and denial reasons in BigQuery."`

---

## Step 6: Exercising the Agent in Gemini Enterprise UI (Hackathon Verification)

Log into your **Gemini Enterprise** Web Application and run these test queries:

### 🧪 Test Prompt 1: Member Coverage Check
> **User Input**: *"Is member MEM-1001 active and what is their copay amount?"*
> **Agent Output**: *"Member Alice Smith (MEM-1001) has ACTIVE PPO coverage effective 2024-01-01 with a copay of $25.00."*

### 🧪 Test Prompt 2: Claims Denial Inquiry
> **User Input**: *"Show me all denied claims in our BigQuery database and total billed amounts."*
> **Agent Output**: *"Found 1 denied claim: CLM-9003 for member MEM-1001 on 2024-08-15 for procedure 97110. Billed amount: $450.00, Paid: $0.00."*

---

## 🛑 Troubleshooting & Verification Checklist

| Issue | Verification / Solution |
| :--- | :--- |
| BigQuery Access Error | Run `gcloud auth application-default login` and ensure `roles/bigquery.dataViewer` is granted. |
| LLM SQL Syntax Errors | Ensure Golden Queries from `golden_healthcare_queries.sql` are loaded into the agent system prompt. |
| Agent Runtime Deployment Failure | Verify Vertex AI API is enabled (`aiplatform.googleapis.com`) and region is `us-east1`. |
| Gemini Enterprise App Not Found | Ensure Discovery Engine Editor role is assigned on the GCP project containing the Gemini Enterprise App. |
