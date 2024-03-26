-- 사원 테이블에서 이름을 첫번째 철자만 출력하시오. 
select substr(ename,1,1) 
from emp;
-- substr (문자열 column, 잘라낼 철자의 자리 번호, 갯수) 

-- 사원 테이블에서 이름을 출력하고 이름의 두 번째 철자만 출력하시오. 
select ename, substr(ename, 2,1)
from emp;

-- 우리반 테이블에서 이름, 이름의 성만 출력하시오. 
select ename, substr(ename, 1,1)
from emp18;

-- 우리반 테이블에서 성이 김, 이, 박 인 학생들의 이름과 생일을 출력하시오.  
select ename, birth 
from emp18 
where substr(ename,1,1) in ('김', '이', '박');

-- 이름 출력하는데 맨 뒷 철자만 출력하시오. 
select substr(ename, -1,1)
from emp;

-- 우리반 테이블에서 주소를 출력하는데 뒷의 3글자만 출력하시오. 
select substr(address, -3,3)
from emp18;