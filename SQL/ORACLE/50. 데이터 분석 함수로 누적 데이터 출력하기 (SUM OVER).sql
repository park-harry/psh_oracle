-- 이름, 월급, 월급의 누적치를 출력하시오. 
select ename, sal, sum(sal) over (order by sal) 누적치
from emp;

-- 위의 결과를 다시 출력하는데 옵션을 full 로 다 써서 출력하시오. 
select ename, sal, 
sum(sal) over (order by sal asc 
rows between unbounded preceding and current row) 누적치
from emp;

-- 부서번호, 이름, 월급, 월급의 누적치가 출력되는데 부서번호 별로 각각 월급의 누적치가 
-- 출력되게 하시오. 
select deptno, ename, sal, 
sum(sal) over (partition by deptno order by sal asc 
rows between unbounded preceding and current row) 누적치 
from emp;

-- 아래의 SQL을 튜닝하시오. 
-- 튜닝 전 
select ename, sal ,
(select sum(sal) from emp  e2 
where e2.empno <= e1.empno) as 누적치 
from emp e1 
order by empno;

-- 튜닝 후 
select ename, sal, 
sum(sal) over (order by sal asc rows between unbounded preceding and current row) 누적치 
from emp;

-- 아래의 SQL을 튜닝하시오. 
select deptno, ename, sal, 
(select sum(sal) from emp e2 where e2.empno <= e1.empno
and e2.deptno = e1.deptno) 누적치 
from emp e1
order by deptno, empno;

select deptno, ename, sal, 
sum(sal) over (partition by deptno order by empno asc 
rows between unbounded preceding and current row) 누적치
from emp; 

-- emp 테이블을 부서번호를 ascending 하게 정렬한 결과를 가지고 emp2 라는 테이블을 생성한다.
create table emp2
as
select  * from   emp
order by deptno asc ;

-- emp2 테이블의 부서번호가 10번인 사원들의 입사일을 81/01/05 로 변경한다.
update emp2 
set hiredate = '81/01/05' 
where deptno=10;

update  emp2
set  hiredate = '81/02/17'
where  deptno = 20;

update  emp2
set  hiredate= '81/03/21'
where  deptno = 30;

commit;
select  * from  emp2;

-- range 윈도우 기준으로 이용해서 월급을 누적 시켜서 출력하시오. 
select ename, hiredate, sal, 
sum(sal) over(order by hiredate asc range between unbounded preceding and current row) 누적치 
from emp2;

-- 직업이 salesman인 사원들의 이름, 직업, 월급, 월급의 누적치를 출력하시오. 
select ename, job, sal, 
sum(sal) over(order by sal asc rows between unbounded preceding and current row) as 누적치 
from emp 
where job = 'SALESMAN';