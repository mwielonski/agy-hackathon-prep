"""
Healthcare Payer BigQuery Data Agent (ADK Implementation)
Queries synthetic healthcare payer data in BigQuery (members, claims, providers).
"""

import os
from google.cloud import bigquery
from google.genai import types

PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT", "<YOUR_GCP_PROJECT_ID>")
DATASET_ID = "healthcare_payer_demo"

def query_healthcare_claims(member_id: str = None, claim_status: str = None) -> str:
    """Queries healthcare claims by member_id or claim_status in BigQuery.
    
    Args:
        member_id: Optional member ID (e.g. 'MEM-1001')
        claim_status: Optional claim status ('PAID', 'DENIED', 'PENDING')
    """
    client = bigquery.Client(project=PROJECT_ID)
    
    where_clauses = []
    if member_id:
        where_clauses.append(f"member_id = '{member_id}'")
    if claim_status:
        where_clauses.append(f"claim_status = '{claim_status.upper()}'")
        
    where_str = " WHERE " + " AND ".join(where_clauses) if where_clauses else ""
    
    query = f"""
        SELECT claim_id, member_id, service_date, diagnosis_code, procedure_code, billed_amount, paid_amount, claim_status
        FROM `{PROJECT_ID}.{DATASET_ID}.claims`
        {where_str}
        ORDER BY service_date DESC
        LIMIT 20
    """
    
    query_job = client.query(query)
    results = [dict(row) for row in query_job]
    return str(results)

def check_member_eligibility(member_id: str) -> str:
    """Checks member coverage status, plan type, and copay amount in BigQuery.
    
    Args:
        member_id: Member ID (e.g. 'MEM-1001')
    """
    client = bigquery.Client(project=PROJECT_ID)
    query = f"""
        SELECT member_id, first_name, last_name, plan_type, coverage_status, effective_date, copay_amount
        FROM `{PROJECT_ID}.{DATASET_ID}.members`
        WHERE member_id = '{member_id}'
    """
    query_job = client.query(query)
    results = [dict(row) for row in query_job]
    return str(results) if results else f"Member {member_id} not found."
