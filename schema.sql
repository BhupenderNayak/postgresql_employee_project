CREATE TYPE gender_type AS ENUM ('male', 'female', 'not specified');

CREATE TABLE employee (
  emp_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  dept VARCHAR(50) NOT NULL,
  salary NUMERIC(12,2) NOT NULL CHECK (salary > 0),
  hire_date DATE NOT NULL,
  gender gender_type NOT NULL DEFAULT 'not specified',
  employee_code VARCHAR(20),
  full_name VARCHAR(201),
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE UNIQUE INDEX uq_employee_email_lower
ON employee (LOWER(email));

CREATE INDEX idx_employee_dept ON employee(dept);
CREATE INDEX idx_employee_salary ON employee(salary);
