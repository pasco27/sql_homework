-- Create the Major Tables from my ERD

CREATE TABLE Departments(
	dept_no SERIAL PRIMARY KEY,
	dept_name VARCHAR(30)
	);
SELECT *
FROM Departments


CREATE TABLE Titles(
	title_id SERIAL PRIMARY KEY,
	title  VARCHAR(30)
	);
SELECT *
FROM Titles


CREATE TABLE Employees(
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR(30), --FK >- Titles.title_id
	birth_date date,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(3),
	hire_date date
	);

SELECT *
FROM Employees

ALTER TABLE Employees
	ADD FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
	;




-- Create the Junction Tables from my ERD
CREATE TABLE Dept_Emp(
	emp_no int,
	dept_no VARCHAR(30) --FK >- Departments.dept_no
	);
SELECT *
FROM Dept_Emp
---- something about alter table here
--FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)


CREATE TABLE Dept_Manager(
	dept_no VARCHAR(30), --FK >- Departments.dept_no
	emp_no int --FK >- Employees.emp_no
	);
SELECT *
FROM Dept_Manager

---- something about alter table here
--FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
--FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)



CREATE TABLE Salaries(
	emp_no int, --FK >- Employees.emp_no
	salary int
	);
SELECT *
FROM Salaries

---- something about alter table here
--FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)


ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");
