DELETE FROM `your_dataset.your_table` AS t
USING (
    SELECT emp_id, name, modified_ts,
           ROW_NUMBER() OVER (PARTITION BY emp_id, name ORDER BY RAND()) AS rn
    FROM `your_dataset.your_table`
) AS d
WHERE t.emp_id = d.emp_id
  AND t.name = d.name
  AND t.modified_ts = d.modified_ts
  AND d.rn > 1;
