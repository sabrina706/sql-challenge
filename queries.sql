-- Retrieve employee details including salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON emp.emp_no = sal.emp_no;

-- Find employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- Get department managers along with their details
SELECT mgr.dept_no, dept.dept_name, mgr.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS mgr
INNER JOIN employees AS emp ON mgr.emp_no = emp.emp_no
INNER JOIN departments AS dept ON mgr.dept_no = dept.dept_no;

-- Retrieve employees and their departments
SELECT emp_dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_emp AS emp_dept
INNER JOIN employees AS emp ON emp_dept.emp_no = emp.emp_no
INNER JOIN departments AS dept ON emp_dept.dept_no = dept.dept_no;

-- Find employees named Hercules with last names starting with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List employees in the Sales department
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM dept_emp AS emp_dept
INNER JOIN employees AS emp ON emp_dept.emp_no = emp.emp_no
INNER JOIN departments AS dept ON emp_dept.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

-- List employees in Sales or Development departments
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp AS emp_dept
INNER JOIN employees AS emp ON emp_dept.emp_no = emp.emp_no
INNER JOIN departments AS dept ON emp_dept.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

-- Count frequency of last names, sorted in descending order
SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
