-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal between 1000 and 3000;
-- 1000 과 3000이 포함된 수식, 아래의 수식과 동일하다. 
select ename, sal 
from emp 
where sal >= 1000 and sal <= 3000;

-- 입사일이 81/1/1 부터 81/12/31 사이에 입사한 사원들의 이름과 
-- 입사일을 출력하시오. 
select ename, hiredate 
  from emp 
  where hiredate between '81/1/1' and '81/12/31';

-- 우리반 테이블에서 1990년대에 태어난 학생들의 이름과 생일을 출력하시오.
select ename, birth 
from emp18 
where birth between '1990/1/1' and '1999/12/31';

-- 월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력하시오.
select ename, sal 
from emp 
where sal not between 1000 and 3000;  
 
explain plan for 
select ename, sal 
from emp 
where sal not between 1000 and 3000;

select * from table(dbms_xplan.display);

select ename, hiredate 
from emp 
where hiredate not between '1981/1/1'and '1981/12/31'; 

-- 1981년도에 입사한 사원들의 이름과 월급과 입사일을 출력하는데 입사일이 
-- 최근에 입사한 사원부터 출력하시오.
select ename, sal, hiredate 
from emp 
where hiredate between '1981/1/1'and '1981/12/31'
order by hiredate desc;