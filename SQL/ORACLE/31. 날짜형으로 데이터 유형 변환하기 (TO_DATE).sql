-- 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate 
from emp
where hiredate ='1981/11/17';
-- 위의 SQL 을 서양권에 가서 수행하면 에러가 난다. 위의 날짜 형식은 동양권 날짜 형식이기 때문.
-- 서양권: 일/월/년도 
-- 동양권: 년도/월/일

-- 서양권 환경으로 날짜 형식 변경해보기 
alter session set nls_date_format ='dd/mm/rr';

-- 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate 
from emp 
where hiredate = '17/11/81'; -- 서양권 방식 
-- 확실한 방법 
select ename, hiredate 
from emp 
where hiredate = to_date('1981/11/17','YYYY/mm/dd');

-- (SQL 튜닝) 튜닝은 데이터 검색 속도를 빠르게 해주는 기능 
-- 아래의 sql을 튜닝하시오. (튜닝 전)  
select ename, hiredate 
from emp 
where to_char(hiredate,'rrrr')='1981';
-- (튜닝 후) 
select ename, hiredate 
from emp 
where hiredate between to_date('1981/1/1','YYYY/mm/dd') 
				    and to_date('1981/12/31','YYYY/mm/dd')+1;
-- 1981/01/01 0시0분0초 ~ 1981/12/31 0시0분0초 + 하루 

alter session set nls_date_format = 'yy/mm/dd';

select ename, hiredate 
from emp
where hiredate = '81/11/17';
-- yy로 설정해놔서 2081년으로 검색하기 때문에 결과값이 나오지 않는다. 
-- 년도를 4자리로 하거나 to_date('1981/11/17,'RR/MM/DD') 형식으로 하면 확실하다.

select ename as 이름 , birth as 생일 , trunc(months_between(sysdate,birth)/12) as 나이 
from emp18
where birth between to_date('1993/1/1','rr/mm/dd')and to_date('1998/12/31','rr/mm/dd')+1
order by 나이 desc; 