-- 직업이 SALESMAN인 사원들의 이름과 월급과 직업을 출력하는 view를 생성하시오. (VIEW 이름은 sales _view) 
create or replace view sales_view 
as 
select ename, sal, job 
from emp 
where job = 'SALESMAN';

-- (복합 view) 이름, 월급, 부서위치를 출력하는 view 를 emp_dept 로 생성하시오
create or replace view emp_dept 
as 
select e.ename, e.sal, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

-- emp_dept 에서 KING의 부서위치를  필라델피아로 변경하세요.
update emp_dept 
set loc = 'PHILADELPHIA'
where ename = 'KING';
-- >  King 과 같은 부서위치를 가진 사원들의 부서위치도 바뀐다.

-- emp_dept 뷰에서 KING 의 월급을 9000 으로 변경하시오. (21c version)
update emp_dept
set sal = 9000 
where ename = 'KING';

--(19c version) primary key 제약을 걸어줘야 변경이 가능하다.
alter table dept 
add constraint dept_deptno_pk primary key(deptno); 

update emp_dept
set sal = 9000 
where ename = 'KING';

--직업, 직업별 토탈월급을 출력하시오 !
select job,sum(sal) 
from emp 
group by job; 

--위의 결과를 출력하는 view 를  job_sum 이라는 이름으로 생성하시오!
create or replace view job_sum 
as 
select job,sum(sal) as sumsal
from emp 
group by job; 

-- job_sum 뷰에서  직업이  CLERK 의  sumsal 을 7000 으로 변경하시오
update job_sum 
set sumsal=7000
where job = 'CLERK';

-- 위의 job_sum 뷰를  delete 로 지우시오 !
delete from job_sum;


-- 백화점 카드 포인트 적립 기준 테이블에  2%, 5%  적립율이 입력되어있는데 이 테이블에 절대 DML 
-- 못하게 막아라 !

lock table emp in exclusive mode; 
--> 이렇게 하면 안된다. with read only 로 view를 만들어주면 된다. 
create or replace view emp77 
as 
select * from emp 
with read only; 
-- emp77의 월급을 모두 9000으로 변경하시오. 
update emp77 
set sal = 9000; 

-- emp77 뷰의 데이터를 모두 delete 로 지우시오. 
delete from emp77; 

-- emp77 뷰의 데이터를 다시 dml 작업을 할 수 있도록 변경하시오. 
create or replace view emp77 
as 
select * from emp; 

-- 부서번호가 10번, 20번인 사원들의 모든 컬럼을 가져오는 view 를 생성하시오!(이름은 emp547) 
create or replace view emp547 
as 
select * from emp 
where deptno in (10,20); 

-- emp547 뷰를 수정하는데 KING 의 월급을 8400으로 수정하시오
update emp547
set sal = 8400
where ename = 'KING';

-- emp547 뷰를 수정하는데 KING 의 부서번호를 30번으로 수정하시오
update emp547
set deptno = 30
where ename = 'KING';

-- emp547 뷰를 다시 만드는데 deptno 만큼은 갱신되지 못하겠금 뷰를 생성하시오 !
-- (뷰생성시 where 절 조건에 위배되겠금 뷰를 갱신하지 못하게 하시오!)
create or replace view emp547
as 
select * from emp 
where deptno in (10,20)
with check option; 
-- 이제 where 조건절에 위배 되면 update가 안된다. 
update emp547
set deptno = 30
where ename = 'FORD';
-- update 안됨. 

-- 월급이  4000 이하인 사원들의  모든 컬럼을 담는 VIEW 를 emp551 로 생성하는데
-- emp551에서 월급을 4000 보다 크게 갱신하지 못하도록 view 를 생성하시오 !
create or replace view emp551 
as 
select * 
from emp 
where sal <= 4000
with check option;

-- emp 테이블이 없다면 아래의 view가 만들어지겠는가?
drop table emp; 

create view emp77
as 
select empno, ename, sal 
from emp; 

-- 테이블이 없어도 view를 생성할 수 있게 하는 옵션이 있는 바로 force다. 
create force view emp77
as 
select empno, ename, sal 
from emp;

-- view를 만들수는 있지만 데이터가 보이지는 않는다. 

select * from emp77; 

-- 부서번호, 부서번호별 평균월급을 출력하는 view를 생성하시오. 부서번호별 평균 월급의 소수점 
-- 이하는 출력 안되게 반올림하고 천단위 표시를 꼭 해서 출력되게 하시오. (emp_avg) 
create or replace view emp_avg 
as 
select deptno, to_char(round(avg(sal)),'999,999') as avgsal
from emp 
group by deptno; 

select * from emp_avg;