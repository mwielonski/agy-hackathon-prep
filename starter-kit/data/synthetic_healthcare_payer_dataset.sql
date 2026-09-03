-- Synthetic Healthcare Payer Dataset for Hackathon Verification
-- Project: <YOUR_GCP_PROJECT_ID> | Dataset: healthcare_payer_demo

CREATE SCHEMA IF NOT EXISTS `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo`
OPTIONS(
  location="us-east1",
  description="Synthetic Healthcare Payer dataset for AGY Hackathon verification"
);

-- 1. Member Eligibility Table
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.members` (
  member_id STRING OPTIONS(description="Unique member ID"),
  first_name STRING,
  last_name STRING,
  plan_type STRING OPTIONS(description="HMO, PPO, EPO, POS"),
  coverage_status STRING OPTIONS(description="ACTIVE, INACTIVE, SUSPENDED"),
  effective_date DATE,
  copay_amount NUMERIC
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.members` VALUES
  ('MEM-1001', 'Alice', 'Smith', 'PPO', 'ACTIVE', DATE('2024-01-01'), 25.00),
  ('MEM-1002', 'Bob', 'Jones', 'HMO', 'ACTIVE', DATE('2023-06-15'), 15.00),
  ('MEM-1003', 'Charlie', 'Brown', 'PPO', 'INACTIVE', DATE('2022-03-01'), 30.00),
  ('MEM-1004', 'Diana', 'Prince', 'EPO', 'ACTIVE', DATE('2024-02-01'), 20.00),
  ('MEM-1005', 'Evan', 'Wright', 'HMO', 'ACTIVE', DATE('2023-11-01'), 15.00);

-- 2. Healthcare Claims Table
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims` (
  claim_id STRING OPTIONS(description="Unique claim ID"),
  member_id STRING,
  service_date DATE,
  diagnosis_code STRING OPTIONS(description="ICD-10 Code"),
  procedure_code STRING OPTIONS(description="CPT Code"),
  billed_amount NUMERIC,
  paid_amount NUMERIC,
  claim_status STRING OPTIONS(description="PAID, DENIED, PENDING")
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.claims` VALUES
  ('CLM-9001', 'MEM-1001', DATE('2024-08-10'), 'E11.9', '99214', 350.00, 280.00, 'PAID'),
  ('CLM-9002', 'MEM-1002', DATE('2024-08-12'), 'I10', '99213', 200.00, 160.00, 'PAID'),
  ('CLM-9003', 'MEM-1001', DATE('2024-08-15'), 'M54.5', '97110', 450.00, 0.00, 'DENIED'),
  ('CLM-9004', 'MEM-1004', DATE('2024-08-20'), 'J01.90', '99214', 300.00, 240.00, 'PAID'),
  ('CLM-9005', 'MEM-1005', DATE('2024-08-22'), 'E11.9', '99215', 500.00, 0.00, 'PENDING');

-- 3. Provider Network Directory
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.providers` (
  provider_id STRING,
  provider_name STRING,
  specialty STRING,
  network_status STRING OPTIONS(description="IN_NETWORK, OUT_OF_NETWORK"),
  city STRING,
  state STRING
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_payer_demo.providers` VALUES
  ('PRV-501', 'Dr. Sarah Connor', 'Endocrinology', 'IN_NETWORK', 'Nashville', 'TN'),
  ('PRV-502', 'Dr. Gregory House', 'Internal Medicine', 'IN_NETWORK', 'Memphis', 'TN'),
  ('PRV-503', 'Dr. Leonard McCoy', 'Orthopedics', 'OUT_OF_NETWORK', 'Knoxville', 'TN');
