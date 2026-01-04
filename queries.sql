
SELECT * FROM employee WHERE first_name ILIKE 'A%';

SELECT dept, COUNT(*) FROM employee GROUP BY dept;


SELECT dept, first_name, salary
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) rn
  FROM employee
) t
WHERE rn = 1;
