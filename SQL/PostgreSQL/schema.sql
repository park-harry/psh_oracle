1. ���� ERD diagram�� �����Ͽ� departments ���̺��� �����Ͻÿ�. 
create table departments
(dept_no varchar(4) not null, 
dept_name varchar(40) not null, 
primary key(dept_no), 
unique(dept_name)); 

2. ���� ERD diagram�� �����Ͽ� employees ���̺��� �����Ͻÿ�. 
create table employees
(emp_no INT NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no));

3. ���� ERD diagram�� �����Ͽ� dept_manager ���̺��� �����Ͻÿ�. 
CREATE TABLE dept_manager 
(dept_no VARCHAR(4) NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no));

4. ���� ERD diagram�� �����Ͽ� salaries ���̺��� �����Ͻÿ�. 
CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no));

5. ���� ERD diagram�� �����Ͽ� dept_emp ���̺��� �����Ͻÿ�. 
create table dept_emp
(emp_no int not null,
dept_no varchar(4) not null,
from_date date not null, 
to_date date not null,
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no)); 

6. ���� ERD diagram�� �����Ͽ� titles ���̺��� �����Ͻÿ�. 
create table titles 
(emp_no int not null,
title varchar(40) not null,
from_date date not null, 
to_date date not null,
foreign key(emp_no) references employees(emp_no));