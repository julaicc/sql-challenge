CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

--SELECT * FROM titles WHERE title_id = 's0001'; --> checando import correcto del .csv


CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------


--employee number, last name, first name, sex, and salary of each employee 

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--manager x dept. w/ their dept. num., dept. name, employee num., last name & first name

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


--dept.num. x employee w/ employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


--first name, last name & sex of each employee whose first name is Hercules and last name begins with "B".

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--each employee in the Sales department, including their employee number, last name, and first name 

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'; -- d007 es num. de sales

--each employee in Sales (d007) & Development (d005), w/ employee num, last name, first name & dept. name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or departments.dept_no = 'd007';


--frequency counts(descending order) of all the employee last names (that is, how many employees share each last name)

SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;