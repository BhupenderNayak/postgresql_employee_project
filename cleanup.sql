UPDATE employee
SET email = LOWER(TRIM(email));

UPDATE employee
SET full_name = CONCAT_WS(' ', first_name, last_name)
WHERE full_name IS NULL;

UPDATE employee
SET employee_code = CONCAT(UPPER(LEFT(dept,1)), LPAD(emp_id::text,3,'0'))
WHERE employee_code IS NULL;
