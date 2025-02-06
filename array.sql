SELECT 
    TIMESTAMP_TRUNC(calling_date, HOUR) AS calling_hour,
    cell_num, 
    SUM(call_count) AS total_call_count, 
    ARRAY_AGG(DISTINCT phone_company) AS phone_companies, 
    ARRAY_AGG(DISTINCT model) AS models
FROM your_table
GROUP BY calling_hour, cell_num;
