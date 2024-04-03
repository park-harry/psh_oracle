※ import 중 아래의 그림과 같은 오류가 뜨면 다음의 코드를 실행해 import 하면 된다. 

copy departments(dept_no, dept_name)
from 'C:\sampledb\departments.csv'
delimiter ','
csv header;

=> C 드라이브에 sampledb 폴더를 새로 만들어 파일을 복사한 후 실행한다. 
=> 괄호 안에 column 명을 순서대로 적는다. 

문제 1. dept_emp, dept_manager, employees, salaries, titles 테이블도 모두 import 하시오. 
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