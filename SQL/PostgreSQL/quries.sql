�� import �� �Ʒ��� �׸��� ���� ������ �߸� ������ �ڵ带 ������ import �ϸ� �ȴ�. 

copy departments(dept_no, dept_name)
from 'C:\sampledb\departments.csv'
delimiter ','
csv header;

=> C ����̺꿡 sampledb ������ ���� ����� ������ ������ �� �����Ѵ�. 
=> ��ȣ �ȿ� column ���� ������� ���´�. 

���� 1. dept_emp, dept_manager, employees, salaries, titles ���̺� ��� import �Ͻÿ�. 
copy employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
from 'C:\sampledb\employees.csv'
delimiter ','
csv header;

copy dept_emp(emp_no, dept_no, from_date, to_date)
from 'C:\sampledb\dept_emp.csv'
delimiter ','
csv header;

copy dept_manager(dept_no, emp_no, from_date, to_date)
from 'C:\sampledb\dept_manager.csv'
delimiter ','
csv header;

copy salaries(emp_no, salary, from_date, to_date)
from 'C:\sampledb\salaries.csv'
delimiter ','
csv header;

copy titles (emp_no, title, from_date, to_date)
from 'C:\sampledb\titles.csv'
delimiter ','
csv header;