--CONSTRAINT COMPOSITE_KEY_NAME PRIMARY KEY (COL1, COL2, COL3)

DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;




CREATE TABLE titles (
	title_id VARCHAR(80) PRIMARY KEY,
	title VARCHAR(80)
);
	
CREATE TABLE departments(
	dept_no VARCHAR(80) PRIMARY KEY,
	dept_name VARCHAR(80),
    -- CONSTRAINT dept_data PRIMARY KEY (dept_no, dept_name)
);

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(80),
	birth_date DATE,
	first_name VARCHAR(80),
	last_name VARCHAR(80),
	sex VARCHAR(80),
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
    CONSTRAINT comp_salary PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR(80),
	-- id SERIAL INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    CONSTRAINT emp_dept PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(80),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT mng_dept PRIMARY KEY (dept_no, emp_no)
);

