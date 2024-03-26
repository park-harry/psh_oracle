-- 사원 테이블의 전체 건수가 어떻게 되는가? 
select count(*) 
from emp;

-- 그룹 함수는 null 값을 무시하기 때문에 아래 함수의 값은 4가 나온다. 
select count(comm) 
from emp;

-- 직업이 salesman 인 사원들의 인원수를 출력하시오. 
select count(*) 
from emp 
where job = 'SALESMAN';

-- 직업, 직업별 인원수를 출력하시오. 
select job, count(*) 
from emp 
group by job;

-- 위의 결과를 출력하는데 직업 별 인원 수가 2명 이상인 것만 출력하시오.
select job, count(*) 
from emp 
group by job
having count(*) >=2;

-- 위의 결과를 다시 출력하는데 직업별 인원수가 높은 것부터 출력하시오. 
select job, count(*) 
from emp 
group by job
having count(*) >=2
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 직업이 salesman은 제외하고 출력하시오. 
select job, count(*) 
from emp 
where job <> 'SALESMAN'
group by job
having count(*) >=2
order by count(*) desc;

-- (OCP 시험 문제) 
-- emp 테이블에 직업의 종류가 몇개가 있는지 출력하시오. 
select count(distinct job) 
from emp;

-- market_2022 테이블을 조회하는데 상호명에 스타벅스가 포함되어 있는 데이터에서 시군구명,
-- 시군구명 별 건수를 출력하시오.
select 시군구명, count(*) 
from market_2022
where 상호명 like '%스타벅스%' 
group by 시군구명;

-- market_2022 테이블에서 상권업종중분류명 이 '커피점/카페'인 상호명, 상호명별 건수를 
-- 출력하는데 상호명별 건수가 높은 것부터 출력하시오. 
select 상호명, count(*) 
from market_2022
where 상권업종중분류명 = '커피점/카페'
group by 상호명
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 상호명이 카페는 제외하고 출력하시오. 
select 상호명, count(*) 
from market_2022
where 상권업종중분류명 = '커피점/카페' and 상호명 <> '카페'
group by 상호명
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 정렬된 기준으로 맨위에 10개만 출력하시오. 
select 상호명, count(*) 
from market_2022
where 상권업종중분류명 = '커피점/카페' and 상호명 <> '카페'
group by 상호명
order by count(*) desc fetch first 10 rows only;

-- 위의 sql 수정 (스타벅스, 이디야커피의 상호명이 앞뒤로 여러개가 붙어있기 때문에 스타벅서, 이디야커피로 통일) 
select case when 상호명 ='%스타벅스%' then '스타벅스' 
            when 상호명 ='%이디야커피%' then '이디야커피'
            else 상호명 end as 상호명 , count(*) 
from market_2022
where 상권업종중분류명 = '커피점/카페' and 상호명 <> '카페'
group by case when 상호명 ='%스타벅스%' then '스타벅스' 
            when 상호명 ='%이디야커피%' then '이디야커피'
            else 상호명 end
order by count(*) desc fetch first 10 rows only;

-- market_2022 테이블에서 상호명에 스타벅스를 포함하고 있는 모든 행과 열을 출력하시오.  
select * 
from market_2022 
where 상호명 like '%스타벅스%';

-- market_2022 에서 시군구명 컬럼의 데이터를 출력하는데 중복을 제거해서 출력하시오. 
select distinct 시군구명 
from market_2022;

-- 강남구에 있는 스타벅스 매장의 모든 컬럼과 데이터를 출력하시오. 
select * 
from market_2022 
where 상호명 like '%스타벅스%' and 시군구명 = '강남구';

-- 코로나 이전인 market_2017와 코로나 이후인 market_2022 을 각각 쿼리해서 서울시 강남구에 있는
-- 스타벅스 매장이 몇 개가 없어졌는지 출력하시오. 
select count(*) 
from market_2022 
where 상호명 like '%스타벅스%' and 시군구명 = '강남구'; -- 74

select count(*) 
from market_2017 
where 상호명 like '%스타벅스%' and 시군구명 = '강남구';  -- 79 (5개가 없어졌다.) 

-- 우리 반 테이블에서 성씨를 출력하고 성씨 별 인원수를 출력하시오. 
select case when length(ename)=4 then substr(ename, 1,2)
        else substr(ename,1,1) end as 성, count(*) 
from emp18 
group by  case when length(ename)=4 then substr(ename, 1,2)
        else substr(ename,1,1) end;
        
-- (세로 출력) 직업, 직업별 총 월급을 출력하는데 직업이 salesman 은 제외하고 출력하고 
-- 직업별 총 월급이 5000 이상인 것만 출력하고 직업별 총 월급이 높은 것부터 출력하시오. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
HAVING SUM(SAL) >= 5000
order by sum(sal) desc;

-- 직업, 직업별 최대 월급, 직업별 최소 월급, 직업별 총 월급을 출력하시오. 
select job, max(sal), min(sal), sum(sal) 
from emp 
group by job;

-- 우리반 테이블에서 나이를 출력하고 나이별 인원수를 출력하는데 나이별 인원수가 높은 것부터 
-- 출력하시오. 
select age, count(*) 
from emp18 
group by age
order by count(*) desc;

