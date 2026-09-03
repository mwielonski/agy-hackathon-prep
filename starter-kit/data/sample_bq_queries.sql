-- Sample BigQuery Queries for Hackathon Enablement
-- Replace <PROJECT_ID>, <DATASET_NAME>, and <TABLE_NAME> with your actual resource names.

-- 1. Schema Discovery Query
SELECT 
  table_name, 
  column_name, 
  data_type 
FROM 
  `<PROJECT_ID>.<DATASET_NAME>.INFORMATION_SCHEMA.COLUMNS`;

-- 2. Aggregation & Metrics Template
SELECT
  DATE(timestamp_col) AS event_date,
  category,
  COUNT(DISTINCT user_id) AS active_users,
  SUM(amount) AS total_revenue
FROM
  `<PROJECT_ID>.<DATASET_NAME>.<TABLE_NAME>`
WHERE
  timestamp_col >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY)
GROUP BY
  1, 2
ORDER BY
  event_date DESC, total_revenue DESC;
