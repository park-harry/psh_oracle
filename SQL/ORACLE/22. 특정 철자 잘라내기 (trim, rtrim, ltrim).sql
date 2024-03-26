-- 우리 반 테이블에서 인천 논현동에서 거주하는 학생의 이름과 주소를 출력하시오. 
select ename, address 
from emp18 
where trim(address) = '인천 논현동';

-- 우리 반 테이블에서 이메일을 출력하는데 이메일 끝에 .com 을 잘라내서 출력하시오. 
select email, rtrim(email,'.com')
from emp18;

-- 위의 결과를 다시 출력하는데 .net도 잘라내시오. 
select email,rtrim(rtrim(email, '.com'),'.net')
from emp18;
-- kimjunhwan11@nate.com -> kimjunhwan11@na 로 나온다 
-- .net 중에 어느 하나의 철자가 있으면 다 잘라낸다. 