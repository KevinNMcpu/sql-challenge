-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT "Employees".emp_no, last_name, first_name, sex, salary FROM "Employees"
JOIN "Salaries" on "Salaries".emp_no = "Employees".emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.

select * from "Employees" where  hire_date < '1987-01-01' and hire_date >= '1986-01-01'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select "Dept_Manager".dept_no, dept_name, "Employees".emp_no, last_name, first_name from "Dept_Manager"
INNER JOIN "Employees" on "Employees".emp_no = "Dept_Manager".emp_no
INNER JOIN "Departments" on "Departments".dept_no = "Dept_Manager".dept_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT "Employees".emp_no, last_name, first_name, dept_name from "Employees"
INNER JOIN "Dept_Manager" on "Dept_Manager".emp_no = "Employees".emp_no
INNER JOIN "Departments" on "Departments".dept_no = "Dept_Manager".dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT "Employees".emp_no, last_name, first_name, dept_name from "Employees"
FULL JOIN "Dept_Emp" on "Dept_Emp".emp = "Employees".emp_no
FULL JOIN "Departments" on "Departments".dept_no = "Dept_Emp".dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT "Employees".emp_no, last_name, first_name, dept_name from "Employees"
FULL JOIN "Dept_Emp" on "Dept_Emp".emp = "Employees".emp_no
FULL JOIN "Departments" on "Departments".dept_no = "Dept_Emp".dept_no
WHERE dept_name = 'Sales'
or dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) from "Employees"
GROUP BY last_name
ORDER BY COUNT(*) DESC;