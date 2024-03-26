-- 우리반 테이블에서 성씨가 김씨인 학생들의 이름, 나이, 주소를 출력하는데 for update 절을 써서 lock 을 걸면서 select 하시오.
select ename, age, address 
from emp18 
where ename like '김%'
for update;