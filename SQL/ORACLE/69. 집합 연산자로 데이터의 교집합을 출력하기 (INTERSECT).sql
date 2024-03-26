-- 교집합 구해보기 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno
intersect 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno;

-- market_2017에서 상호명에 카페베네가 포함된 상호명의 상가업소번호, 상호명을 출력하시오. 
select 상가업소번호, 상호명
from market_2017
where 상호명 like '%카페베네%';

-- market_2017과 market_2022의 교집합을 수해서 2017년도에도 존재했는데 2022년도에도 있는 
-- 카페베네의 상호명, 상가업소번호를 출력하시오. 
select 상가업소번호, 상호명
from market_2017
where 상호명 like '%카페베네%'
intersect 
select 상가업소번호, 상호명
from market_2022
where 상호명 like '%카페베네%';