--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 	e.emp_no, 
		e.last_name, 
		e.first_name, 
		e.sex, 
		s.salary
FROM Employees e
LEFT JOIN Salaries s
ON e.emp_no = s.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT * FROM Employees

SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT 	dm.dept_no, 
		d.dept_name, 
		dm.emp_no, 
	   	e.last_name, 
		e.first_name
FROM Department_Managers dm
LEFT JOIN Department d
ON (dm.dept_no = d.dept_no)
LEFT JOIN Employees e
ON (dm.emp_no = e.emp_no);

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employees e
    INNER JOIN Department_Employees de
        ON (e.emp_no = de.emp_no)
    INNER JOIN Department AS d
        ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."
SELECT first_name, last_name, birth_date, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT 	e.emp_no, 
		e.last_name, 
		e.first_name,
	   	d.dept_name
FROM Employees e
LEFT JOIN Department_Employees de
ON e.emp_no = de.emp_no
INNER JOIN Department d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employees e
    INNER JOIN Department_Employees de
        ON (e.emp_no = de.emp_no)
    INNER JOIN Departments d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.

SELECT last_name, COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;