-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/0nif4n
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(16)   NOT NULL,
    "last_name" VARCHAR(16)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" MONEY   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(18)   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(18)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "emp" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp" FOREIGN KEY("emp")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

COPY "Employees" (emp_no, emp_title, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\employees.csv'
DELIMITER ','
CSV HEADER;

COPY "Salaries" (emp_no, salary)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY "Titles" (title_id, title)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\titles.csv'
DELIMITER ','
CSV HEADER;

COPY "Departments" (dept_no, dept_name)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\departments.csv'
DELIMITER ','
CSV HEADER;

COPY "Dept_Manager" (dept_no, emp_no)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY "Dept_Emp" (emp, dept_no)
FROM 'C:\Users\kevin\Desktop\Boot Camp\sql-challenge\sql-challenge\EmployeeSQL\dept_emp.csv'
DELIMITER ','
CSV HEADER;