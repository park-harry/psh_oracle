-- 부서번호, 부서번호 별 총 월급을 가로로 출력하는데 pivot 문 사용하기 
select * 
from (select deptno, sal from emp)
pivot(sum(sal) for deptno in (10,20,30));

-- pivot 문을 사용해서 직업별 총월급을 세로로 출력하시오. 
select * 
from (select job, sal from emp) 
pivot(sum(sal) for job in ('SALESMAN', 'ANALYST', 'CLERK', 'MANAGER', 'PRESIDENT'));

-- 입사한 년도별 총 월급을 pivot 문으로 출력하기 
select *
from (select to_char(hiredate,'rrrr')as hireyear, sal from emp) 
pivot(sum(sal) for hireyear in ('1980','1981','1982','1983'));

-- 우리 반 테이블에서 성별, 성별 별 평균 나이를 출력하시오. (세로로) 
// 1. sum + decode 사용 
select 
round(avg(decode(gender,'남',age))) as "남자 평균 나이",
round(avg(decode(gender,'여',age))) as "여자 평균 나이"
from emp18;
// 2. pivot문 사용 
select round("남자 평균 나이"),round("여자 평균 나이")
from (select gender, age from emp18) 
pivot(avg(age) for gender in ('남' as "남자 평균 나이",'여' as "여자 평균 나이"));

select * 
from (select to_char(hiredate,'RRRR') as hireyear, job, sal from emp) 
pivot(sum(sal) for job in ('ANALYST','CLERK','MANAGER','SALESMAN','PRESIDENT'));
