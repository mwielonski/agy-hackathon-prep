# AGY Skills & Specifications 101: Extending Agent Capabilities

This guide provides a clear, 101-level overview of **Antigravity (AGY) Skills and Specifications**, explaining what they are, how they differ, and how they work together to guide AI behavior—tailored for every hackathon persona (Business, Data Analysts, AI Developers, IT Admins).

---

## 📺 Video Learning Resources (Recommended Watching)

To deepen your understanding before hackathon day, explore these short, targeted video resources covering Antigravity, AGY Skills, Google Agent Development Kit (ADK), and Specifications:

| Video Title | Topic & Duration | Key Takeaways & Persona Relevance | Link |
| :--- | :--- | :--- | :--- |
| **Introducing Agent Development Kit (ADK)** *(Google for Developers)* | **ADK Core Architecture & Agent Design** (~8 mins) | **All Personas / AI Developers**: Overview of the open-source ADK framework, local debugging UI, tool definitions, and multi-agent coordination. | [Watch Video](https://www.youtube.com/watch?v=AUZIYQH9yiIJ2jEUfV7wiu34Y9PXmVPBCu4hgjV9RA-ZwdLGCu_dmuYRy_YeaaFO8AU2CNZEYmWuDHI9gdCFbfl9W18BPQ94LX3a7dcrd0T2OVbzSUzmdJkP-LZV7Ttmr7YcXAy-YSHTGJY=) |
| **Build an AI Agent with Gemini & ADK** *(Google for Developers)* | **Agent Hands-on & Tool Calling** (~10 mins) | **Data Analysts & AI Developers**: Walkthrough on initializing ADK projects, tool definitions, Gemini model configuration, and inspecting LLM reasoning chains. | [Watch Video](https://www.youtube.com/watch?v=AUZIYQG9RF5UUQZ0SOM2yeYu3VAhP2z3Q4xpZEjUF1UuCa8HGK0sCSv0dnKyla70quHBEn3lhiO2L__mY9--JZi8niKOyOWzcaO-IkntORKz5RbH2700jLYzVuuUptjdS1AjhPpoJeH18Uk=) |
| **Deploy Your First Agent to Vertex AI Agent Engine** | **Cloud Deployment & Runtime Specs** (~12 mins) | **IT Admins & Cloud Engineers**: Environment configuration, managing session state, and deploying ADK agents to Vertex AI Agent Engine and Cloud Run. | [Watch Video](https://www.youtube.com/watch?v=AUZIYQHuub6i-fC6sX_Iq4rTDkUFhsWtNq9YC8tKJ41nQBBo_gcBGoB6j7QVI7vrGZlTXzMojKSWQpiT0wB3ojt4tNJTHLeHUjRfQh3zd5Ea6wupyuvkFL0HKIpHwmrBbbVo5QeGPmxYeyc=) |
| **Agent Evaluation with ADK & Vertex AI** *(Google Cloud Tech)* | **Agent Quality & Specification Verification** (~15 mins) | **Business Leaders & AI Architects**: How to define evaluation specs, test agent quality against business ground truth, and run Vertex AI GenAI evaluations. | [Watch Video](https://www.youtube.com/watch?v=AUZIYQGpDDZMC0z3n-zpeaA9QGuRK5YyuGTX58ca-kbxX-wqok6OWtuD43R_3TANq5YyKJnLuPfR4YZn3HAjicG2TTKb_u0HRu_aYWLCaTaS5hHAKLZIEzo7pp6imt1ntfoZ1oLkfrt2TG0=) |

---

## 🔍 Skills vs. Specifications: What's the Difference?

To build effective AI agents, it is critical to understand the distinction between a **Skill** and a **Specification**, and how they complement each other:

```
+---------------------------------------------------------------------------------------------------------+
|                                    SKILLS vs. SPECIFICATIONS                                            |
|                                                                                                         |
|  📘 SPECIFICATION ("The Blueprint / Rules")  |  ⚡ SKILL ("The Execution Package / Action")              |
|  - Written contract, rules, or schemas      |  - The active container/folder loaded into AGY          |
|  - Defines WHAT should be built or followed |  - Defines HOW AGY executes tools and multi-step tasks  |
|  - E.g., OpenAPI spec, SQL schema, Rules    |  - E.g., The SKILL.md file + executable Python scripts  |
+---------------------------------------------------------------------------------------------------------+
```

| Concept | What It Is | Analogy | Example in Hackathon |
| :--- | :--- | :--- | :--- |
| **Specification (Spec)** | The **written blueprint, rules, or data contract** defining *what* the system or data must conform to. | **Architectural Blueprints & Building Code** | A BigQuery SQL schema definition, an API spec (`openapi.json`), or a business metric rule file. |
| **Skill** | The **active capability package** that AGY loads into context to execute actions following the Spec. | **The Licensed Electrician / Contractor** | A folder containing `SKILL.md` + Python scripts that AGY uses to query BigQuery and format results. |

---

## 🤝 How Skills and Specifications Work Together

A **Skill** incorporates **Specifications** so AGY can execute tasks accurately:

```
                  +----------------------------------------------+
                  |            AGY SKILL PACKAGE                 |
                  |                                              |
                  |   1. SKILL.md (Instructions & Workflows)     |
                  |   2. SPECIFICATIONS (Schemas, API Specs)     |
                  |   3. EXECUTABLE TOOLS (Python/Shell Scripts)  |
                  +----------------------------------------------+
                                         |
                                         v
                  +----------------------------------------------+
                  |         ANTIGRAVITY AGENT EXECUTION          |
                  |  Reads Spec -> Validates Rules -> Runs Tool  |
                  +----------------------------------------------+
```

1. **The Spec provides the rules**: "Claims table must contain `claim_status` values (`'PAID'`, `'DENIED'`, `'PENDING'`)."
2. **The Skill provides the action**: AGY loads `SKILL.md`, reads the Spec, generates valid SQL, and executes the BigQuery query tool.

---

## 🧭 Plain-English Explanation for Every Persona

### 1. 👔 For Business Leaders, Product Managers & Executives
- **Specification**: Your business requirements, compliance policies (HIPAA rules), and PRD (Product Requirements Document).
- **Skill**: The automated workflow package that enforces your PRD and ensures AGY produces compliant, business-ready outputs.

### 2. 📊 For Data Analysts, SMEs & Business Intelligence
- **Specification**: Data dictionary, BigQuery schema definitions (`COLUMNS`), and business logic formulas.
- **Skill**: The `SKILL.md` container that provides Golden SQL queries and instructs AGY on how to join tables and profile data.

### 3. 🤖 For AI Developers, Data Scientists & Engineers
- **Specification**: OpenAPI specifications (`swagger.json`), ADK agent tool function signatures, and JSON schemas.
- **Skill**: The `.agents/skills/<name>/` folder containing `SKILL.md` instructions, prompt exemplars, and custom Python tool code.

### 4. 🛠️ For IT Administrators, DevOps & Cloud Architects
- **Specification**: Security policies, IAM role definitions, and Terraform / `gcloud` resource configurations.
- **Skill**: Automated guardrail skills (like `accidental-data-loss-prevention`) that intercept commands to prevent data deletion or non-compliant cloud deployments.

---

## 📁 Anatomy of a Skill Package with Specifications

An AGY Skill is stored as a directory in your project workspace, wrapping instructions and specifications together:

```
my-project/
└── .agents/
    └── skills/
        └── healthcare-payer-analytics/
            ├── SKILL.md              <-- (REQUIRED) The main skill instruction specification
            ├── specs/                 <-- (SPECIFICATIONS) Database schemas, API specs, business contracts
            │   ├── claims_schema.json
            │   └── openapi_spec.yaml
            └── scripts/               <-- (EXECUTABLE TOOLS) Python helper scripts executed by AGY
                └── bq_query_runner.py
```

### 📄 The `SKILL.md` File: The Skill's Instruction Specification

Every `SKILL.md` uses YAML frontmatter metadata at the top, followed by Markdown specification instructions:

```markdown
---
name: healthcare-payer-analytics
description: >-
  Provides guidelines, SQL schemas, and Golden Queries for querying BigQuery healthcare claims and member eligibility.
---

# Healthcare Payer Analytics Skill

## Specification Rules
1. Refer to `specs/claims_schema.json` for exact BigQuery data types.
2. Always join `claims.member_id` with `members.member_id`.
3. Filter for `coverage_status = 'ACTIVE'` unless historical coverage is explicitly requested.

## Golden SQL Exemplar
```sql
SELECT member_id, claim_id, billed_amount, claim_status
FROM `my_project.healthcare_payer_demo.claims`
WHERE claim_status = 'DENIED';
```
```

---

## 🧠 How AGY Uses Skills & Specifications: Progressive Disclosure

To keep AI memory efficient:
1. **Discovery**: AGY scans your workspace for skills and reads lightweight metadata (`name` and `description`).
2. **On-Demand Loading**: When you ask a question (*"Find all denied claims"*), AGY loads the full `SKILL.md` and associated **Specification files** into context.
3. **Execution**: AGY validates your request against the **Specification** and executes the **Skill's** tools.

---

## 🛠️ How to Create and Share Skills & Specifications

1. **Create Directory**: Create `.agents/skills/<skill-name>/` inside your project repository.
2. **Add Specifications**: Place your JSON schemas, API specs, or Markdown rules inside the skill directory.
3. **Write `SKILL.md`**: Define the name, description, and execution rules.
4. **Commit to Git**: Push to GitHub! Every team member automatically receives the updated Skills & Specifications when cloning the repository!
