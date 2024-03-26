-- 이름, 이름의 철자의 갯수를 출력하시오. 
select ename, length(ename)
from emp18; 

-- 우리반 테이블에서 이름, 이메일, 이메일의 철자의 갯수를 출력하는데 이메일의 철자의 갯수가
-- 높은 것부터 출력하시오. 
select ename, email, length(email) 
from emp18 
order by length(email) desc;

-- 위의 결과를 다시 출력하는데 이메일의 철자의 길이가 20개 이상인 학생들만 출력하시오. 
select ename, email, length(email) 
from emp18 
where length(email) >= 20
order by length(email) desc;