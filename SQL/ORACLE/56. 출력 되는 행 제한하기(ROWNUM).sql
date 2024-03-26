select row_number() over (order by sal desc) as 번호, 
ename, sal, job 
from emp 
where job = 'SALESMAN';

select rownum as 번호, ename, sal, job
from emp 
where job = 'SALESMAN';

-- 맨 위의 3줄만 보겠다.
select * 
from emp 
where rownum <=3;

-- 직업이 salesman인 사원들의 이름, 월급을 출력하는데 출력되는 결과에서 2번째 데이터만 출력하시오. 
select ename, sal 
from (select rownum as 번호, ename, sal
        from emp 
        where job = 'SALESMAN') 
where 번호 =2;

-- 우리반 테이블에서 2번 째 행의 학생의 이름과 나이를 출력하시오. 
select ename, age 
from (select rownum 번호, ename, age
        from emp18) 
where 번호 =2;