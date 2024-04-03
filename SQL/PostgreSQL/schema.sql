1. 위의 ERD diagram을 참고하여 departments 테이블을 생성하시오. 
create table departments
(dept_no varchar(4) not null, 
dept_name varchar(40) not null, 
primary key(dept_no), 
unique(dept_name)); 

2. 위의 ERD diagram을 참고하여 employees 테이블을 생성하시오. 
create table employees
(emp_no INT NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no));

3. 위의 ERD diagram을 참고하여 dept_manager 테이블을 생성하시오. 
CREATE TABLE dept_manager 
(dept_no VARCHAR(4) NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no));

4. 위의 ERD diagram을 참고하여 salaries 테이블을 생성하시오. 
CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no));

5. 위의 ERD diagram을 참고하여 dept_emp 테이블을 생성하시오. 
create table dept_emp
(emp_no int not null,
dept_no varchar(4) not null,
from_date date not null, 
to_date date not null,
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no)); 

6. 위의 ERD diagram을 참고하여 titles 테이블을 생성하시오. 
create table titles 
(emp_no int not null,
title varchar(40) not null,
from_date date not null, 
to_date date not null,
foreign key(emp_no) references employees(emp_no));