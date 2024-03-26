-- 이름, 월급, 월급에 대한 순위를 출력하시오. (복습문제) 
select ename, sal, dense_rank() over (order by sal desc) 순위
from emp;

-- 위의 결과에서 순위가 3등과 5등만 출력하시오. 
select * 
from (select ename, sal, dense_rank() over (order by sal desc) 순위
      from emp) 
where 순위 in (3,5);

-- 직업, 이름, 월급, 순위를 출력하는데 순위가 직업별로 각각 월급이 높은 순서대로 순위를 부여하시오. (복습문제)  
select job, ename, sal, dense_rank() over (partition by job order by sal desc) 순위
from emp;

-- 위의 결과를 다시 출력한느데 각 직업별로 순위가 1등인 사원들만 출력하시오. 
select * 
from (select job, ename, sal, dense_rank() over (partition by job order by sal desc) 순위
from emp)
where 순위 = 1;

-- 부서 번호, 부서 번호별 평균 월급을 출력하시오. (복습문제) 
select deptno  , round(avg(sal)) 
from emp 
group by deptno;

-- 부서 번호, 이름, 월급, 자기가 속한 부서번호의 평균 월급을 출력하시오. (복습문제) 
select deptno, ename, sal, round(avg(sal) over(partition by deptno)) as "부서별 평균 월급"
from emp;

-- 위의 결과를 다시 출력하는데 자기의 월급이 자기가 속한 부서번호의 평균 월급보다 더 큰 사원들만 출력하시오. 
select * 
from (select deptno, ename, sal, round(avg(sal) over(partition by deptno)) as "부서별 평균 월급"
    from emp)
where sal > "부서별 평균 월급";

select * 
from (select ename, sal, hiredate, 
			dense_rank() over (order by sal desc) as 순위
      from emp) 
where 순위 =2;