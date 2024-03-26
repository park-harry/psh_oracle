-- 오늘 날짜를 출력하고 그 옆에 오늘의 요일을 출력하시오. 
select sysdate, to_char(sysdate,'day')
from dual;

-- 우리 반 테이블에서 이름, 생일, 태어난 요일을 출력하시오. 
select ename, birth, to_char(birth,'day')
from emp18;

-- 금요일에 태어난 학생들의 이름과 생일과 요일을 출력하시오. 
select ename, birth, to_char(birth,'day')
from emp18
where to_char(birth,'day') = '금요일';

select ename, birth, to_char(birth,'day'), -- 금요일
to_char(birth,'dy'),  -- 금
to_char(birth,'d')   -- 6 (일요일이 1인 기준에서 금요일은 6) 
from emp18;

-- (7년차 개발자의 질문) 
-- 이름, 생일, 태어난 요일 출력하는데 월화수목금토일 순으로 정렬해서 출력하시오. 
select ename, birth, to_char(birth,'dy')
from emp18
order by to_char(birth-1,'d');

-- 이름, 입사일, 입사한 년도, 입사한 달, 입사한 일, 입사한 요일을 출력하시오. 
select ename, hiredate, to_char(hiredate,'YYYY'),
to_char(hiredate,'mm'),to_char(hiredate,'dd'),
to_char(hiredate,'day')
from emp;

-- 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오. 
-- like 와 between .. and 사용 금지, to_char 이용 
select ename, hiredate 
from emp
where to_char(hiredate,'RRRR') = 1981;

-- 이름, 월급을 출력하는데 월급을 출력할 때 천 단위를 표시하시오. 
-- 금융권에서는 반드시 붙여야 한다. 
select ename, to_char(sal,'$999,999')
from emp;
select ename, to_char(sal,'L999,999')
from emp;
-- 숫자 9는 이 자리에 0~9까지 어느 숫자가 와도 상관 없다는 뜻이다. 
-- 알파벳 L 은 로컬 화폐 단위다. 

-- 이름, 월급 * 1020340 를 출력하시오. (금융권 쪽 SQL 방식으로) 
select ename, to_char(sal * 1020304,'L9,999,999,999')
from emp;