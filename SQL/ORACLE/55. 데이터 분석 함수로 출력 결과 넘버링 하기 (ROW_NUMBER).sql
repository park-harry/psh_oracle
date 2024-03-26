-- 직업이 SALESMAN인 사원들의 이름, 월급, 직업을 출력하는데 앞에 번호를 순서대로 부여해서 출력하시오. 
select ename, sal, job 
from emp 
where job = 'SALESMAN';

-- 위의 결과를 다시 출력하는데 월급이 높은 사원부터 출력하는데 번호가 1,2,3,4 순으로
-- 출력되게 하시오. 
select rownum, ename, sal, job 
from (select ename, sal, job 
        from emp 
        where job = 'SALESMAN'
        order by sal desc);

-- 위와 같이 from 절의 서브 쿼리를 이용하지 않고 row_number( ) 함수를 이용해서 위의 결과를 출력하시오. 
select row_number() over (order by sal desc) 번호, ename ,sal, job 
from emp 
where job = 'SALESMAN';

-- 통신사가 KT 인 학생들의 이름과 나이와 통신사를 출력하는데 나이가 높은 학생부터 출력하고 앞에 번호를 붙여서 출력하시오. 
select row_number() over (order by age desc) 번호, ename, age, telecom
from emp18
where telecom = 'kt';

-- 통신사가 kt 인 학생 중에서 나이가 2번째로 많은 학생을 출력하시오. 
select 번호, ename, age, telecom 
from (select row_number() over (order by age desc) 번호, ename, age, telecom
        from emp18
        where telecom = 'kt')
        where 번호=2;

-- 사원 테이블에서 월급이 5번째로 많이 받는 사원의 이름과 월급을 출력하시오. 
select 번호, ename, sal
from (select row_number() over (order by sal desc) 번호, ename, sal 
        from emp)
where 번호 = 5;
        
