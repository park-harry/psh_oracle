-- Jones의 월급보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal > (select sal 
            from emp 
            where ename = 'JONES');

-- scott과 같은 월급을 받는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal = (select sal 
            from emp 
            where ename = 'SCOTT');

-- 위의 결과에서 다시 출력하는데 SCOTT 은 제외하고 출력하시오.
select ename, sal 
from emp 
where sal = (select sal 
            from emp 
            where ename = 'SCOTT')
and ename <> 'SCOTT';

-- ALLEN 보다 늦게 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate 
from emp 
where hiredate > (select hiredate from emp 
                    where ename = 'ALLEN');

-- price 테이블에서 a_price의 최대값을 출력하시오. 
select max(a_price)
from price; 

-- 서울시 물가 데이터 중에 가장 가격(a_price)이 비싼 생필품(a_name)과 그 가격을 출력하시오. 
desc price;

select a_price, a_name
from price
where a_price = (select max(a_price) from price);

-- 직업이 SALESMAN인 사원들중에 최대월급을 받는 사원의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal = (select max(sal) from emp where job = 'SALESMAN');

-- 위의 결과를 서브쿼리를 이용하지 말고 order by ... fetch row 를 이용해서 출력하시오. 
select ename, sal 
from emp 
where job = 'SALESMAN'
order by sal desc fetch first 1 row only;

-- dba는 sql을 볼 때 성능을 생각해서 봐야하므로 위의 2개의 sql 중 어느 sql이 더 성능이 좋은지 
-- 확인해야 한다. 
select /*+ gather_plan_statistics */ ename, sal 
from emp 
where sal = 
(select max(sal) 
from emp
where job = 'SALESMAN'); --> 12개 

select * from table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST'));

select /*+ gather_plan_statistics */ ename, sal 
from emp 
where job = 'SALESMAN'
order by sal desc fetch first 1 rows only; --> buffer 6 

-- DALLAS에 있는 부서번호에서 근무하는 사원들의 이름과 월급을 출력하시오. (서브쿼리)
select ename, sal 
from emp 
where deptno = (select deptno from dept where loc = 'DALLAS');

-- 위의 문제를 join으로 수행하시오. 
select e.ename, e.sal 
from emp e, dept d 
where e.deptno = d.deptno and d.loc ='DALLAS';

-- 우리반 테이블에서 통신사가 kt인 학생 중에 나이가 가장 많은 학생의 이름,나이, 통신사를 출력하시오. 
select ename, age, telecom 
from emp18 
where age = (select max(age) from emp18 where telecom = 'kt')
and telecom = 'kt';

-- 통신사가 kt인 학생의 최대 나이보다 더 나이가 많은 학생들의 이름과 나이를 출력하는데 나이가 높은 학생부터 출력하시오. 
select ename, age 
from emp18 
where age > (select max(age) from emp18 where telecom = 'kt') 
order by age desc; 

-- Allen과 같은 부서번호에서 근무하는 사원들의 이름, 월급을 출력하는데 Allen은 제외하고 출력하시오.
select ename, sal 
from emp 
where deptno = (select deptno from emp where ename = 'ALLEN') 
and ename <> 'ALLEN';
