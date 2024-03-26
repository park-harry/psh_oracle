-- 부서번호, 부서번호별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp 
group by deptno;

-- 사원 테이블의 전체 토탈 월급을 출력하시오. 
select sum(sal) 
from emp; 

-- rollup을 이용해서 부서번호, 부서번호별 총 월급을 출력하는데 맨 아래에 전체 총 월급이 
-- 출력되게 하시오.
select deptno, sum(sal) 
from emp 
group by rollup(deptno); 

-- 위의 결과를 rollup을 이용하지 않고 union all 로 구현하시오. 
select deptno, sum(sal) 
from emp 
group by deptno
union all
select to_number(null) ,sum(sal) 
from emp;

-- (SQLD,SQLP 공통) 아래의 SQL 결과를 UNION ALL로 구현하시오. 
select to_char(hiredate,'RRRR'), job, sum(sal) 
from emp 
group by grouping sets((to_char(hiredate,'RRRR')), (job),());

select to_char(hiredate,'RRRR'), to_char(null), sum(sal) 
from emp 
group by to_char(hiredate,'RRRR')
union all 
select to_char(null), job, sum(sal) 
from emp 
group by job 
union all 
select to_char(null), to_char(null), sum(sal) 
from emp;