# AGY Skills & Specifications 101: Extending Agent Capabilities

This guide provides a clear, 101-level overview of **Antigravity (AGY) Skills & Specifications**, explained in plain language tailored for every hackathon persona—from **Business Leaders and Product Managers** to **Data Analysts, AI Developers, and IT System Admins**.

---

## 🎯 What is an AGY Skill? (In Simple Terms)

An **AGY Skill** is an **on-demand playbook or capability package** that teaches Antigravity how to perform specialized workflows, follow domain-specific guidelines, or interact with external systems.

Think of an AGY Skill as a **"Standard Operating Procedure (SOP)"** that you hand to a highly capable human assistant:
- **Without a Skill**: AGY relies on its general knowledge.
- **With a Skill**: AGY follows your exact team standards, runs pre-approved scripts, uses your specific database schemas, and executes multi-step workflows without making assumptions.

---

## 🧭 Plain-English Explanation for Every Persona

```
+---------------------------------------------------------------------------------------------------------+
|                                  AGY SKILLS THROUGH EVERY LENS                                          |
|                                                                                                         |
|  👔 Business / Management  --> "Standard Operating Procedures (SOPs) & Business Guardrails"             |
|  📊 Data Analysts & SMEs   --> "Data Catalog Recipes & Standard SQL Transformation Templates"           |
|  🤖 AI & Software Engineers--> "Reusable Agent Tooling, Runbooks & Multi-Step Workflows"                |
|  🛠️ IT & Cloud Admins     --> "Checked-in Security Policies, Deployment Scripts & Infrastructure Specs"|
+---------------------------------------------------------------------------------------------------------+
```

### 1. 👔 For Business Leaders, Product Managers & Executives
> *"Skills are your company's **business guardrails and automated workflows**."*
- **What it does for you**: Ensures AGY follows your company's brand voice, compliance rules, terminology, and approval processes.
- **Real-world example**: A `healthcare-compliance` skill that forces AGY to sanitize output and ensure HIPAA compliance whenever generating member summaries.

### 2. 📊 For Data Analysts, SMEs & Business Intelligence
> *"Skills are **data catalog recipes and SQL guidelines**."*
- **What it does for you**: Teaches AGY your data warehouse structure, table joins, business logic formulas (e.g., how "Gross Revenue" or "Active Member" is calculated), and Golden SQL queries.
- **Real-world example**: A `bigquery-data-profiling` skill that tells AGY to always check categorical value distributions in BigQuery before writing SQL.

### 3. 🤖 For AI Developers, Data Scientists & Engineers
> *"Skills are **modular prompt playbooks, ADK toolkits, and runbooks**."*
- **What it does for you**: Provides AGY with executable Python scripts, API integration specs, and Google Agent Development Kit (ADK) agent scaffolding rules.
- **Real-world example**: A `google-agents-cli-publish` skill that gives AGY the exact CLI flags and metadata formats to deploy and publish agents to Gemini Enterprise.

### 4. 🛠️ For IT Administrators, DevOps & Cloud Architects
> *"Skills are **version-controlled infrastructure automation and IAM specs**."*
- **What it does for you**: Ensures infrastructure-as-code scripts (`gcloud`, Terraform, Docker) follow security policies, use correct regional locations, and enforce least-privilege IAM access.
- **Real-world example**: An `accidental-data-loss-prevention` skill that forces AGY to pause and ask for human confirmation before executing any destructive `DROP TABLE` or `gcloud rm` command.

---

## 📁 Anatomy of an AGY Skill (The Specification)

An AGY Skill is stored as a simple folder in your workspace containing a mandatory **`SKILL.md`** specification file:

```
my-project/
└── .agents/
    └── skills/
        └── my-custom-skill/
            ├── SKILL.md              <-- (REQUIRED) The main skill instruction specification
            ├── scripts/               <-- (OPTIONAL) Helper Python/Shell scripts AGY can execute
            ├── templates/             <-- (OPTIONAL) Jinja/SQL templates
            └── references/            <-- (OPTIONAL) Detailed API or schema documentation
```

### 📄 The `SKILL.md` Specification Format

Every `SKILL.md` uses standard Markdown with YAML frontmatter at the top:

```markdown
---
name: healthcare-payer-claims
description: >-
  Provides guidelines, SQL schemas, and Golden Queries for querying BigQuery healthcare claims and member eligibility.
---

# Healthcare Payer Claims Skill

## When to Use This Skill
Activate this skill whenever the user asks questions regarding member eligibility, copay amounts, or claims payment/denial statuses.

## Standard Business Rules
1. Always join `claims.member_id` with `members.member_id`.
2. Filter for `coverage_status = 'ACTIVE'` unless historical coverage is explicitly requested.

## Golden SQL Exemplar
```sql
SELECT member_id, claim_id, billed_amount, claim_status
FROM `my_project.healthcare_payer_demo.claims`
WHERE claim_status = 'DENIED';
```
```

---

## 🧠 How AGY Uses Skills: Progressive Disclosure

To avoid cluttering the AI's memory (context window) with thousands of lines of instructions:

1. **Lightweight Discovery**: When AGY starts, it only reads the **`name`** and **`description`** of available skills (a few words).
2. **On-Demand Activation**: When you ask a question (e.g., *"Find all denied claims"*), AGY recognizes that `healthcare-payer-claims` matches your goal and dynamically loads the full `SKILL.md` instructions into memory.
3. **Execution**: AGY follows the skill's instructions step-by-step.

---

## 🛠️ How to Create and Share a Skill in 3 Steps

1. **Create Directory**: Create `.agents/skills/<skill-name>/` inside your project repo.
2. **Write `SKILL.md`**: Add a brief name, description, and markdown instructions.
3. **Commit to Git**: Push the folder to GitHub! Any teammate or hackathon participant who clones the repo will automatically inherit the skill in AGY!
