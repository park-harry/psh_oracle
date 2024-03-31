예제 1. 직업, 직업별 인원수를 출력하시오. 
@demo 
create index emp_job on emp(job); 

select job, count(*) 
from emp 
group by job; 
@p

-> 아래와 같이 table full scan 하는 실행 계획이 출력 되었다. 그런데 index full scan으로 나오게
   하고 싶다면 job에 not null 이 걸려 있으면 된다. 
   
alter table emp 
modify job not null; 

select job, count(*) 
from emp 
group by job; 
@p

=> 버퍼의 개수가 6개에서 2개로 줄었다. 
=> index full scan이나 index fast full scan이 되려면 해당 컬럼이 null 이 없음을 보장해줘야 한다.
	 그런데 not null 제약을 걸 수 없다고 한다면 다음과 같이 SQL을 작성한다. 

select job, count(*) 
from emp 
where job is not null 
group by job; 
@p

select constraint_name
 from user_constraints
 where table_name='EMP';

--SYS_C008746
--SYS_C008747

alter table emp
drop constraint SYS_C008746;

alter table emp
drop constraint SYS_C008747;


문제 1. 부서번호에 인덱스를 걸고 부서번호, 부서번호 별 인원수를 출력하는데 index full scan이 될 
수 있도록 튜닝해서 출력하시오. 
create index emp_deptno on emp(deptno); 

select count(*) 
from emp 
where deptno is not null 
group by deptno; 

=> index full scan은 정렬된 결과가 보장이 된다. 

문제 2. 직업, 직업별 토탈월급을 출력하는데 table full scan이 아닌 index full scan이 될 수 있게
인덱스도 걸고 SQL도 작성하시오. 
create index emp_job_sal on emp(job,sal); 

select job, sum(sal) 
from emp 
where job is not null 
group by job; 

=> table full scan보다 더 빠르게 결과를 볼 수 있다. 

문제 3. 부서번호, 부서번호별 평균월급을 출력하는데 index full scan이 되겠금 인덱스를 생성하고 
SQL을 작성하시오. 
create index emp_deptno_sal on emp(deptno,sal); 

select deptno, round(avg(sal)) 
from emp 
where deptno is not null 
group by deptno; 