-- 사원 테이블에서 직업을 출력하시오 
select job from emp; 

-- 사원 테이블에서 중복된 직업을 제거하고 출력하시오 
select distinct job from emp; 

-- 사원 테이블에서 부서번호를 출력하는데 중복을 제거해서 출력하시오. 
select distinct deptno 
from emp;

-- 우리반 테이블 (emp18)에서 통신사를 출력하는데 중복을 제거해서 출력하시오. 
select distinct telecom
from emp18; 

-- 사원 테이블에서 중복이 제거된 부서번호와 직업을 출력하시오. 
select distinct deptno, job 
from emp;

-- 우리반 테이블에서 전공을 출력하는데 중복을 제거해서 출력하시오. 
select distinct major
from emp18;

-- 우리반 테이블을 가지고 아래와 같이 출력하시오. 
-- ex) 최재건 학생의 성별은 남자 이고 통신사는 KT 이며, 경기도 여주시에서 살고 있습니다. 
-- 컬럼명 → information 으로 출력
select ename || ' 학생의 성별은 ' || gender || '자이고, 통신사는 '|| telecom || '이며, ' 
|| address || '에서 살고 있습니다' 
from emp18; 

-- 사원 테이블에서 관리자 번호 (mgr)을 출력하는데 중복을 제거해서 출력하시오. 
select distinct mgr
from emp; 