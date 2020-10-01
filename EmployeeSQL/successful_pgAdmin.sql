--OK try three here.  
--Let's create tables, upload data, then make the key ties. 

-- Major Tables
CREATE TABLE "Departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR(30)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(3)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Junction Tables
CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);


--Now uploading the csv's here.
--Now forgien key ties:

SELECT * FROM "Departments"
SELECT * FROM "Dept_Emp"
SELECT * FROM "Dept_Manager"
SELECT * FROM "Employees"
SELECT * FROM "Salaries"
SELECT * FROM "Titles"


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

-- OK! Everything ran correctly this time, yayy.


