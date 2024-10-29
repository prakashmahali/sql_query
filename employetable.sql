CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10, 2)
);
INSERT INTO emp (id, name, manager_id, salary) VALUES
(1, 'Alice', NULL, 10000),     -- Alice has no manager (CEO or top-level)
(2, 'Bob', 1, 8000),           -- Bob is managed by Alice
(3, 'Charlie', 1, 12000),      -- Charlie is managed by Alice, has a higher salary
(4, 'David', 2, 6000),         -- David is managed by Bob
(5, 'Eve', 2, 5000),           -- Eve is managed by Bob
(6, 'Frank', 3, 13000);        -- Frank is managed by Charlie, has a higher salary

INSERT INTO emp (id, name, manager_id, salary) VALUES
(1, 'Alice', NULL, 90000),
(2, 'Bob', 1, 85000),
(3, 'Charlie', 1, 120000),
(4, 'David', 2, 75000),
(5, 'Eve', 2, 95000),
(6, 'Frank', 3, 70000),
(7, 'Grace', 3, 65000),
(8, 'Heidi', 4, 90000),
(9, 'Ivan', 5, 85000),
(10, 'Judy', 6, 65000);
SELECT id, name
FROM emp
WHERE salary = (
    SELECT DISTINCT salary
    FROM emp
    ORDER BY salary DESC
    LIMIT 1 OFFSET 4
);


SELECT e.id AS emp_id, e.name AS emp_name
FROM emp e
JOIN emp m ON e.manager_id = m.id
WHERE e.salary > m.salary;
