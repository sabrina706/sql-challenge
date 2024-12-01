-- Table for department details
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

-- Table for employee-department assignments
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

-- Table for department managers
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no)
);

-- Table for employee details
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Table for employee salaries
CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL
);

-- Table for job titles
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

-- Foreign key constraints for dept_emp
ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_dept FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

-- Foreign key constraints for dept_manager
ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_dept FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

-- Foreign key constraints for employees
ALTER TABLE employees 
ADD CONSTRAINT fk_employee_title FOREIGN KEY (emp_title_id) REFERENCES titles (title_id);

-- Foreign key constraints for salaries
ALTER TABLE salaries 
ADD CONSTRAINT fk_salary_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
