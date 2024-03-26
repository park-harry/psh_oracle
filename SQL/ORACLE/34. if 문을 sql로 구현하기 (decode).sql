-- 이름, 부서번호, 보너스를 출력하시오. 보너스는 부서번호가 10번이면 5000을 출력하고 
-- 부서번호가 20번이면 3000을 출력하고 나머지 부서번호는 0을 출력하시오.
select ename, deptno, decode(deptno, 10, 5000, 20, 3000,0) as bonus 
from emp;

-- 이름, 직업, 보너스를 출력하는데 보너스가 직업이 SALESMAN 이면 5600, 그렇지 않으면 0을 출력하시오. 
select ename, job, decode(job, 'SALESMAN', 5600,0) as bonus 
from emp;

-- 이름, 직업, 보너스를 출력하는데 보너스가 직업이 SALESMAN 이면 5600, 직업이 analyst면 
-- 4500, 직업이 clerk이면 2300, 나머지 직업은 100을 출력하는데 보너스가 높은 순으로 출력하시오. 
select ename, decode(job,  'SALESMAN', 5600, 'ANALYST',4500,'CLERK',2300,100) as bonus 
from emp 
order by bonus desc;

-- 이름, 월급, 입사일, 입사한 년도를 4자리로 출력하고 보너스를 출력하는데 보너스가 
-- 입사한 년도가 1980이면 9000, 1981이면 7000, 나머지 년도면 500을 출력하시오. 
select ename, sal, to_char(hiredate,'RRRR') as hireyear, 
    decode(to_char(hiredate,'RRRR'),'1980',9000,'1981',7000,500) as bonus
from emp;

-- 이름, 직업, 월급을 출력하는데 월급이 높은 사원부터 출력하시오. 
select ename, job, sal 
from emp 
order by sal desc; 

-- 이름과 월급과 보너스를 출력하는데 보너스가 직업이 president면 null, 나머지 사원들은 자기 월급이 
-- 보너스로 출력되게 하시오. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp;

-- 위의 결과를 다시 출력하는데 보너스가 높은 사원부터 출력하시오. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp
order by bonus desc; --> desc만 사용하면 null 값이 맨 위로 올라간다. 

-- 위의 결과를 다시 출력하는데  null 값을 밑으로 빼시오. 
select ename, sal, decode(job, 'PRESIDENT', NULL,sal) as bonus 
from emp
order by bonus desc nulls last; 
/* nulls last를 써도 950과 800이 상위권에 위치해 있다. 이는 decode의 버그다. 
decode(job, 'PRESIDENT', NULL,sal) -> decode는 세 번째 인자 값의 데이터 유형에 의해서 네 번쨰 인자 값의 데이터 유형이 결정된다. 
null 은 문자형이므로 sal이 문자형으로 출력 되었다. 문자형으로 출력될 경우, 숫자 9가 ASCII code가 가장 높기 때문에 950과 800이 상위권에 위치하게 된다. */

-- 위의 결과를 다시 출력하는데 950과 800을 원래 위치로 보내시오. 
-- 방법 1. null 대신 숫자 0을 쓰기 (nulls last가 필요 없다.) 
select ename, sal, decode(job, 'PRESIDENT',0,sal) as bonus 
from emp
order by bonus desc; 

-- 방법 2. null 값을 쓰고 bonus를 숫자형으로 변환 
select ename, sal, decode(job, 'PRESIDENT',null,sal) as bonus 
from emp
order by to_number(bonus) desc nulls last; 

