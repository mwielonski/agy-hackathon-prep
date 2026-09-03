-- Golden SQL Queries for Healthcare Payer BigQuery Data Agent
-- These baseline validated queries serve as few-shot exemplars to guide and refine LLM SQL generation.
-- Project: <YOUR_GCP_PROJECT_ID> | Dataset: healthcare_payer_demo

-- Golden Query 1: Active Member Eligibility & Coverage Check
-- Intent: Retrieve current coverage status, plan type, and copay for a specific member ID.
SELECT 
  member_id,
  CONCAT(first_name, ' ', last_name) AS full_name,
  plan_type,
  coverage_status,
  effective_date,
  copay_amount
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.members`
WHERE 
  member_id = 'MEM-1001'
  AND coverage_status = 'ACTIVE';

-- Golden Query 2: Member Claim History with Paid vs. Billed Aggregations
-- Intent: Summarize total claims billed, total paid, and claim status breakdown for a member.
SELECT 
  c.member_id,
  CONCAT(m.first_name, ' ', m.last_name) AS member_name,
  COUNT(c.claim_id) AS total_claims,
  SUM(c.billed_amount) AS total_billed,
  SUM(c.paid_amount) AS total_paid,
  COUNTIF(c.claim_status = 'DENIED') AS denied_claims_count
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims` c
JOIN 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.members` m
  ON c.member_id = m.member_id
WHERE 
  c.member_id = 'MEM-1001'
GROUP BY 
  1, 2;

-- Golden Query 3: Denied Claims Analysis by Diagnosis & Procedure
-- Intent: Identify all denied claims along with ICD-10 diagnosis and CPT procedure codes.
SELECT 
  claim_id,
  member_id,
  service_date,
  diagnosis_code,
  procedure_code,
  billed_amount,
  claim_status
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims`
WHERE 
  claim_status = 'DENIED'
ORDER BY 
  service_date DESC;

-- Golden Query 4: Provider Network Directory Lookup by Specialty & Location
-- Intent: Find in-network healthcare providers by medical specialty and city.
SELECT 
  provider_id,
  provider_name,
  specialty,
  network_status,
  city,
  state
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.providers`
WHERE 
  specialty = 'Internal Medicine'
  AND network_status = 'IN_NETWORK'
  AND state = 'TN';
