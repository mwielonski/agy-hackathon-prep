"""
Healthcare Provider BigQuery Data Agent (ADK Implementation)
Queries synthetic hospital clinical data in BigQuery (departments, physicians, appointments).
"""

import os
from google.cloud import bigquery

PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT", "<YOUR_GCP_PROJECT_ID>")
DATASET_ID = "healthcare_provider_demo"

def lookup_physician_schedule(doctor_name: str = None, appointment_date: str = None) -> str:
    """Looks up physician appointment schedules and availability in BigQuery.
    
    Args:
        doctor_name: Optional doctor name (e.g. 'Dr. Robert Chen')
        appointment_date: Optional date string (e.g. '2024-09-10')
    """
    client = bigquery.Client(project=PROJECT_ID)
    
    where_clauses = ["a.appointment_status = 'SCHEDULED'"]
    if doctor_name:
        where_clauses.append(f"p.doctor_name LIKE '%{doctor_name}%'")
    if appointment_date:
        where_clauses.append(f"a.appointment_date = '{appointment_date}'")
        
    where_str = " WHERE " + " AND ".join(where_clauses)
    
    query = f"""
        SELECT 
            a.appointment_id,
            a.patient_id,
            p.doctor_name,
            d.dept_name,
            a.appointment_date,
            a.appointment_time,
            a.reason_for_visit,
            a.appointment_status
        FROM `{PROJECT_ID}.{DATASET_ID}.appointments` a
        JOIN `{PROJECT_ID}.{DATASET_ID}.physicians` p ON a.doctor_id = p.doctor_id
        JOIN `{PROJECT_ID}.{DATASET_ID}.departments` d ON p.dept_id = d.dept_id
        {where_str}
        ORDER BY a.appointment_date ASC, a.appointment_time ASC
    """
    
    query_job = client.query(query)
    results = [dict(row) for row in query_job]
    return str(results) if results else "No scheduled appointments found matching criteria."

def search_hospital_departments(department_name: str = None) -> str:
    """Searches clinical departments, head physicians, and building locations.
    
    Args:
        department_name: Optional department name (e.g. 'Cardiology')
    """
    client = bigquery.Client(project=PROJECT_ID)
    
    where_str = f" WHERE d.dept_name LIKE '%{department_name}%'" if department_name else ""
    
    query = f"""
        SELECT d.dept_id, d.dept_name, d.building_location, d.head_physician
        FROM `{PROJECT_ID}.{DATASET_ID}.departments` d
        {where_str}
    """
    
    query_job = client.query(query)
    results = [dict(row) for row in query_job]
    return str(results)
