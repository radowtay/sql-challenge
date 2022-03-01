--1.List the following details of each employee: employee number, 
--last name, first name, sex, and salary.

SELECT Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.sex, 
	salaries.salary
FROM Employees
LEFT JOIN salaries ON Employees.emp_no = salaries.emp_no
GROUP BY Employees.emp_no, salaries.salary;



--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM Employees
WHERE hire_date >= '01/01/1986'
AND hire_date <'01/01/1987';


--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    Employees.last_name,
    Employees.first_name
FROM dept_manager
JOIN dept_emp ON dept_manager.emp_no = dept_emp.emp_no
JOIN Employees ON Employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
FROM Employees
JOIN dept_emp ON Employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no



--5. List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM Employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'




--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT dept_no FROM departments WHERE dept_name = 'Sales'
--d007


CREATE VIEW sales_view AS
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
FROM Employees
JOIN dept_emp ON Employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

SELECT * FROM sales_view WHERE dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT dept_no FROM departments WHERE dept_name = 'Development'
--d007, sales
--d005, development


CREATE VIEW sales_development_view AS
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	departments.dept_name,
	dept_emp.dept_no
FROM Employees
JOIN dept_emp ON Employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_name, dept_emp.dept_no, Employees.emp_no;

SELECT * FROM sales_development_view WHERE dept_name = 'Sales' OR dept_name = 'Development'



--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.



CREATE TABLE last_name_count AS
SELECT last_name, count(*)
FROM Employees
GROUP BY last_name
ORDER BY last_name;

SELECT * FROM last_name_count 
ORDER BY last_name DESC;