select round(787.678,1)
from dual; 
-- dual 은 select 절의 함수의 결과를 보기 위한 가상의 테이블

-- 사원 테이블에서 이름과 월급, 월급의 십의 자리에서 반올림한 숫자를 출력하시오. 
select ename, sal, round(sal,-2) 
from emp;