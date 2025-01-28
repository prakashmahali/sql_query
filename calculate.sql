WITH CTE AS (
    SELECT 
        name,
        age,
        salary,
        hike,
        -- Calculate the hike percentage
        CASE 
            WHEN (hike / salary) * 100 > 50 THEN TRUE 
            ELSE FALSE 
        END AS is_good_hike
    FROM 
        your_table
)
SELECT 
    name,
    age,
    salary,
    hike,
    is_good_hike,
    -- Count the number of good hikes
    SUM(CASE WHEN is_good_hike THEN 1 ELSE 0 END) OVER () AS hike_count
FROM 
    CTE;
