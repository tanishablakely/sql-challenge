-- 1. List employee's employee #, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '1986%';

-- 3. List the manager of each department w/ dept#, dept name, mgr employee #, last name, first name, and start and end employment dates.
SELECT department_manager.dept_no, dept_name, department_manager.emp_no, last_name, first_name, from_date, to_date
FROM department_manager
JOIN employees ON department_manager.emp_no = employees.emp_no
JOIN departments ON department_manager.dept_no = departments.dept_no;

-- 4. List the department of each employee w/ employee #, last name, first name, and department name.
SELECT department_employees.emp_no, last_name, first_name, dept_name
FROM department_employees
JOIN employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, incl. employee #, last name, first name, and department name.
SELECT department_employees.emp_no, last_name, first_name, dept_name
FROM department_employees
JOIN employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development depart, incl. employee #, last name, first name, and department name.
SELECT department_employees.emp_no, last_name, first_name, dept_name
FROM department_employees
JOIN employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
HAVING 
    COUNT(last_name) > 1
ORDER BY count DESC;
