-- 사원 테이블에서 평균 월급을 출력하시오. 
select round(avg(sal)) 
from emp;

--직업, 직업별 평균 월급을 출력하시오. 
select job, round(avg(sal)) as avgsal
from emp
group by job;

-- 위의 결과를 다시 출력하는데 직업별 평균 월급이 높은 것부터 출력하시오. 
select job, round(avg(sal)) as avgsal
from emp
group by job
order by avgsal desc;

-- 위의 결과를 다시 출력하는데 직업이 salesman을 제외하고 출력하시오. 
select job, round(avg(sal)) as avgsal
from emp
where job <> 'SALESMAN'
group by job
order by avgsal desc;

-- 부서번호, 부서번호 별 평균월급을 출력하는데 부서번호가 20인 부서는 제외하고 
-- 부서번호 별 평균월급이 높은 것부터 출력하시오. 
select deptno, round(avg(sal)) as avgsal 
from emp 
where deptno <> 20 
group by deptno
order by avgsal desc;

-- 주소를 출력하고 그 옆에 주소의 한 어절이 출력되게 하시오. 
select address, regexp_substr(address,'[^ ]+',1,1)
from emp18;
--> regexp_substr(address,'[^ ]+',1,1) : 공백이 아닌 (^) 여러 개 (+) 있는 것들을 첫 글자부터 읽어서 잘라내라는 뜻 

-- 위의 regexp_substr을 이용해서 주소와 주소 별 평균 나이를 출력하시오. 
select regexp_substr(address,'[^ ]+',1,1) as 주소, round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);

-- 위의 sql에 decode를 이용해서 주소와 주소별 평균 나이를 구하시오. 
select decode(regexp_substr(address,'[^ ]+',1,1),'서울특별시','서울시', '서울','서울시',regexp_substr(address,'[^ ]+',1,1)) as 주소, round(avg(age))
from emp18
group by decode(regexp_substr(address,'[^ ]+',1,1),'서울특별시','서울시', '서울','서울시',regexp_substr(address,'[^ ]+',1,1));

-- 이름과 커미션 출력 
select ename, comm 
from emp;

-- 커미션 평균값 출력 
select avg(comm) 
from emp;
--> group 함수는 null 값을 무시한다. 그러므로 위의 함수에서 커미션을 다 더해서 커미션이 null이 아닌 4명인 값으로 나눈다. 
--> 평균 값을 출력할 때 null 처리를 어떻게 해야 할지 생각하면서 sql을 작성해야 한다. 