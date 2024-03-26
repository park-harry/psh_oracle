-- 사원이름, 관리자의 이름을 출력하시오. 
select 사원.ename 사원이름, 관리자.ename 관리자이름
from emp 사원, emp 관리자 
where 사원.mgr = 관리자.empno;

-- 사원이름, 사원 월급, 관리자 이름, 관리자의 월급을 출력하는데 관리자보다 더 많은 월급을 받는 사원들만 출력하시오. 
select 사원.ename 사원이름, 사원.sal 사원월급, 관리자.ename 관리자이름, 관리자.sal 관리자월급
from emp 사원, emp 관리자 
where 사원.mgr = 관리자.empno 
and 관리자.sal < 사원.sal;

-- 사원이름, 사원 입사일, 관리자 이름, 관리자의 입사일을 출력하는데 관리자보다 먼저 사원들만 출력하시오. 
select 사원.ename 사원이름, 사원.hiredate 사원입사일, 관리자.ename 관리자이름, 관리자.hiredate 관리자입사일
from emp 사원, emp 관리자 
where 사원.mgr = 관리자.empno
and 사원.hiredate < 관리자.hiredate; 

-- employees 테이블을 조회 
select * from hr.employees;

-- department 테이블을 조회
select * from hr.departments;

-- SQL을 작성할 때 hr.을 붙이지 않도록 synonym을 생성하시오. 
create public synonym employees for hr.employees;
create public synonym departments for hr.departments;

-- 문제: employees 테이블과 department 테이블을 조인해서 last_name 과 email, depatment_name을 출력하시오. 
desc employees;
desc departments;

select e.last_name, e.email, d.department_name 
from employees e, departments d 
where e.department_id = d.department_id;

-- employees 테이블을 self join 해서 사원이름 (last_name)과 관리자 이름(last_name)을 관리자 번호가 100번인 
--사람만 출력하시오. 
select e.last_name as 사원이름, m.last_name as 관리자이름 
from employees e, employees m 
where e.last_name = m.last_name and m.employee_id = 100;
