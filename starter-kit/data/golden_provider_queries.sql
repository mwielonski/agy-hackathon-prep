-- Golden SQL Queries for Healthcare Provider BigQuery Data Agent
-- Project: <YOUR_GCP_PROJECT_ID> | Dataset: healthcare_provider_demo

-- Golden Query 1: Doctor Schedule & Patient Appointment Lookup
-- Intent: Retrieve all scheduled patient appointments for a specific physician or department.
SELECT 
  a.appointment_id,
  a.patient_id,
  p.doctor_name,
  d.dept_name,
  a.appointment_date,
  a.appointment_time,
  a.reason_for_visit,
  a.appointment_status
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.appointments` a
JOIN 
  `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.physicians` p
  ON a.doctor_id = p.doctor_id
JOIN 
  `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.departments` d
  ON p.dept_id = d.dept_id
WHERE 
  p.doctor_name = 'Dr. Robert Chen'
  AND a.appointment_status = 'SCHEDULED'
ORDER BY 
  a.appointment_date ASC, a.appointment_time ASC;

-- Golden Query 2: Physician Search by Department & Acceptance Status
-- Intent: Find physicians who are accepting new patients in a given department.
SELECT 
  p.doctor_id,
  p.doctor_name,
  d.dept_name,
  p.specialty,
  p.accepting_new_patients,
  p.average_rating
FROM 
  `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.physicians` p
JOIN 
  `<YOUR_GCP_PROJECT_ID>.healthcare_provider_demo.departments` d
  ON p.dept_id = d.dept_id
WHERE 
  d.dept_name = 'Cardiology'
  AND p.accepting_new_patients = TRUE;
