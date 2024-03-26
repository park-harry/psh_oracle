select ename || sal from emp;

select ename ||'의 월급은 ' || sal || '입니다 ' as 월급정보 
from emp;

select ename || '의 직업은 ' || job || '입니다' as 직업정보 
from emp;

-- emp18 테이블에서 학생의 이름과 주소를 출력하시오. 
select ename || ' 학생은 ' || address || '에 삽니다.' as 학생주소
from emp18;