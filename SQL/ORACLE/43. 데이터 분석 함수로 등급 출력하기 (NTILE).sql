-- 이름과 월급과 월급에 대한 등급을 출력하시오. (월급에 대한 등급을 4등급으로 나눠서 등급 부여) 
select ename, sal, ntile(4) over (order by sal desc) 등급
from emp;

-- 위의 결과를 다시 출력하는데 월급을 5등급으로 나눠서 출력하시오. 
select ename, sal, ntile(5) over (order by sal desc) 등급
from emp;

-- 우리반에서 통신사가 kt인 학생들의 이름과 나이가 등급을 출력하는데 등급을 3등급으로 나눠서 출력하시오. (등급은 나이에 대한 등급) 
select ename, age, ntile(3) over (order by age desc) 등급
from emp18 
where telecom = 'kt';

-- 우리반에서 통신사가 kt, sk 인 학생들의 이름과 나이와 나이에 대한 등급을 출력하는데 등급을 5등급으로 나눠서 출력하시오. 
-- (나이에 대한 등급) 
select ename, age, ntile(5) over (order by age desc) 등급
from emp18 
where telecom in('kt','sk');
