-- 다음의 view를 생성하시오. 
create or replace view emp_view 
as 
select empno, ename, job, mgr, hiredate, deptno 
from emp;

select * from emp_view;

-- emp_view 의 데이터에서 KING의 직업을 salesman으로 변경하시오. 
update emp_view 
set job = 'SALESMAN' where ename ='KING';

-- emp 테이블에서 직업이 analyst, salesman, clerk인 사원들의 모든 컬럼을 보이게 하는 view를 emp_view2로 생성하시오. 
create or replace view emp_view2 
as 
select * from emp where job in ('ANALYST','SALESMAN','CLERK');

-- emp_view2의 데이터를 변경하는데 ford의 월급을 0으로 변경하시오. 
update emp_view2
set sal = 0 where ename = 'FORD';

-- 사원이름, 부서위치, 월급, 부서번호를 출력하는 view 를 생성하시오 (emp_dept_view) 
create or replace view emp_dept_view 
as 
select e.ename, d.loc, e.sal, e.deptno
from emp e, dept d where e.deptno = d.deptno;
