-- 이름과 월급을 출력하는데 월급을 출력할 때 숫자 0을 *로 출력하시오.
select ename, replace(sal,0,'*') 
from emp;

-- 이름과 월급을 출력하는데 월급을 출력할 때 숫자 0~3 까지는 *로 출력하시오. 
select ename, regexp_replace(sal,'[0-3]','*') 
from emp;

-- 우리 반 테이블에서 이름을 출력하는데, 다음과 같이 출력되게 하시오. 
-- ex) 유연♡ (substr 사용)  
select replace(ename, substr(ename,-1,1),'♡')
from emp18;

-- (개인정보 보호법 관련 데이터 암호화)
-- 우리 반 테이블에서 이름과 생일과 오늘 날짜를 출력하시오. 
select ename, birth, sysdate 
from emp18;

-- 이름과 나이를 출력하시오. 
select ename,trunc((sysdate-birth)/365) as age
from emp18;

-- 우리 반 테이블의 데이터를 아래와 같이 출력하시오 
-- ex) 최재건 20대, 전수진 30대 
select ename, substr(age,1,1)||'0대'
from emp18


