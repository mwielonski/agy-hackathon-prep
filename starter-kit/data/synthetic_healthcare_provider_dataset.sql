-- Synthetic Healthcare Provider Dataset for Hackathon Verification
-- Project: <YOUR_GCP_PROJECT_ID> | Dataset: healthcare_provider_demo

CREATE SCHEMA IF NOT EXISTS `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo`
OPTIONS(
  location="us-east1",
  description="Synthetic Healthcare Provider dataset for AGY Hackathon verification"
);

-- 1. Clinical Departments Table
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.departments` (
  dept_id STRING OPTIONS(description="Unique department ID"),
  dept_name STRING,
  building_location STRING,
  head_physician STRING
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.departments` VALUES
  ('DEP-101', 'Cardiology', 'Heart & Vascular Center - 3rd Floor', 'Dr. Robert Chen'),
  ('DEP-102', 'Pediatrics', 'Childrens Wing - 2nd Floor', 'Dr. Emily Watson'),
  ('DEP-103', 'Oncology', 'Cancer Care Pavilion - 4th Floor', 'Dr. Marcus Vance'),
  ('DEP-104', 'Emergency Medicine', 'Main Emergency Building - 1st Floor', 'Dr. Lisa Cuddy');

-- 2. Physician Profiles & Schedules Table
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.physicians` (
  doctor_id STRING OPTIONS(description="Unique doctor ID"),
  doctor_name STRING,
  dept_id STRING,
  specialty STRING,
  accepting_new_patients BOOL,
  average_rating NUMERIC
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.physicians` VALUES
  ('DOC-301', 'Dr. Robert Chen', 'DEP-101', 'Interventional Cardiology', TRUE, 4.9),
  ('DOC-302', 'Dr. Emily Watson', 'DEP-102', 'General Pediatrics', TRUE, 4.8),
  ('DOC-303', 'Dr. Marcus Vance', 'DEP-103', 'Medical Oncology', FALSE, 4.7),
  ('DOC-304', 'Dr. Gregory House', 'DEP-104', 'Diagnostic Medicine', TRUE, 4.9);

-- 3. Patient Appointments & Clinical Encounters Table
CREATE OR REPLACE TABLE `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.appointments` (
  appointment_id STRING OPTIONS(description="Unique appointment ID"),
  patient_id STRING,
  doctor_id STRING,
  appointment_date DATE,
  appointment_time STRING,
  reason_for_visit STRING,
  appointment_status STRING OPTIONS(description="SCHEDULED, COMPLETED, CANCELLED, NO_SHOW")
);

INSERT INTO `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.appointments` VALUES
  ('APT-8001', 'PAT-101', 'DOC-301', DATE('2024-09-10'), '09:00 AM', 'Annual Cardiac Follow-up', 'SCHEDULED'),
  ('APT-8002', 'PAT-102', 'DOC-302', DATE('2024-09-10'), '10:30 AM', 'Pediatric Well-Child Exam', 'SCHEDULED'),
  ('APT-8003', 'PAT-103', 'DOC-301', DATE('2024-09-11'), '02:00 PM', 'Echocardiogram Review', 'SCHEDULED'),
  ('APT-8004', 'PAT-104', 'DOC-304', DATE('2024-09-08'), '01:15 PM', 'Unexplained Rash & Fever Evaluation', 'COMPLETED'),
  ('APT-8005', 'PAT-105', 'DOC-303', DATE('2024-09-12'), '11:00 AM', 'Oncology Consult', 'CANCELLED');
