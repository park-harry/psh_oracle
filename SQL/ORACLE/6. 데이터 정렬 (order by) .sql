-- 이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원순으로 출력하시오. 
select ename, sal 
from emp 
order by sal asc; 

-- 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오. 
select ename, sal 
from emp 
order by sal desc; 

-- 이름과 입사일을 출력하는데 최근에 입사한 사원부터 출력되게 하시오. 
select ename, hiredate 
from emp 
order by hiredate desc;

-- 우리반 테이블(emp18)에서 이름과 생일을 출력하는데 가나다라 순서로 정렬해서 이름을 출력하시오.
select ename, birth 
from emp18
order by ename asc;

-- 우리반 테이블(emp18)에서 이름과 생일을 출력하는데 생일을 ascending 하게 출력하시오. 
select ename, birth 
from emp18
order by birth asc;

-- 사원 테이블에서 이름과 부서번호와 월급을 출력하는데 부서번호를 ascending 하게 출력된 것을
-- 기준으로 월급을 descending 하게 출력하시오. 
select ename, deptno, sal 
from emp 
order by deptno asc, sal desc;

-- 이름, 직업, 입사일을 출력하는데 직업을 ABCD 순서대로 정렬해서 출력하고 직업을 ABCD 순서대로 
-- 정렬해서 출력한것을 기준으로 두고 입사일을 먼저 입사한 사원부터 출력되게 하시오. 
select ename, job, hiredate 
from emp 
order by job, hiredate asc;

-- 이름, 직업, 월급 + 300 *2 를 출력하는데 월급+300*2 의 값이 높은 사원부터 출력하시오. 
select ename, job, sal +300*2 bonus
from emp 
order by bonus desc;

-- 우리반 테이블에서 이름과 주소를 출력하는데 주소를 ascending 하게 출력하고,
-- 컬럼명을 한글로 이름, 주소로 출력되게 하시오. 
select ename as 이름 , address as 주소 
from emp18
order by address asc;


