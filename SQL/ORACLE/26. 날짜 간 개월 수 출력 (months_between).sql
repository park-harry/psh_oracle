-- 오늘 날짜 - 입사일을 소수점 이후는 버리고 출력하시오. 
select trunc(sysdate - hiredate)
from emp;

-- 우리 반 테이블에서 이름을 출력하고 태어난 날짜부터 오늘까지 총 몇 주 살았는지 출력하시오.
select ename, trunc((sysdate-birth)/7)
from emp18; 

-- 우리 반 테이블에서 이름을 출력하고 태어난 날짜부터 오늘까지 총 몇 달 살았는지 출력하시오.
select ename, trunc(months_between(sysdate,birth))
from emp18;

-- 그동안 살아온 달이 300달 이상인 학생들의 이름과 살아온 개월 수를 출력하시오. 
select ename, trunc(months_between(sysdate,birth))
from emp18
where trunc(months_between(sysdate,birth)) >=300;

select ename, trunc((sysdate - birth)/365),
trunc(months_between(sysdate,birth)/12)
from emp18;

-- 데이터 상으로는 둘의 차이가 없지만 윤년이 적용될 수도 있기 때문에 
-- months_between이 더 정확한 표현이다. 

-- 우리 반 테이블에서 1993년과 1998년에 태어난 학생들의 이름과 생일과 나이를 출력하는데 
-- 나이가 높은 학생부터 출력하고 column 명을 한글로 이름, 생일, 나이로 출력하시오.
-- 어느 나라에 가서도 조회될 수 있도록 SQL을 작성하시오. 
select ename as 이름, birth as 생일, age as 나이 
from emp18
where birth between to_date('1993/1/1','rr/mm/dd') and to_date('1998/12/31','rr/mm/dd')+1
order by age desc;