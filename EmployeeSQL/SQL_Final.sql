-- This file will contain the query calls for the "Data Analysis" section:

--1)List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
JOIN "Salaries"
ON "Salaries".emp_no = "Employees".emp_no

--2)List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '1985-12-31'
AND hire_date <= '1987-01-01';

--3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Manager".dept_no, "Departments".dept_name, "Dept_Emp".emp_no, "Dept_Manager".emp_no, "Employees".last_name, "Employees".first_name
FROM "Employees"
JOIN "Dept_Manager"
ON "Dept_Manager".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Manager".dept_no
JOIN "Dept_Emp"
ON "Dept_Emp".dept_no = "Departments".dept_no

--4) List the department of each employee with the following information: employee number, last name, first name, and department name.
--### We will also need the dept_no to grab the dept_name, if that's cool w/ you...
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Dept_Emp".dept_no, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Dept_Emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no

--5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--6)List all employees in the Sales department, including their employee number, last name, first name, and department name
-- Sales == d007,  will also need "Dept_Emp".dept_no
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Dept_Emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no
WHERE dept_name = 'Sales'

--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--This the same as the last one... 
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Dept_Emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no
WHERE dept_name = 'Development' 
OR dept_name = 'Sales'

--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT "Employees".last_name, COUNT("Employees".last_name) AS "Last Name"
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY "Last Name" DESC;


