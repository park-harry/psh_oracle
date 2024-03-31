index full scan vs. index fast full scan
- index full scan
  => 인덱스의 구조에 따라 스캔하며 정렬이 보장이 된다.
  => single block i/o
  => 병렬 스캔이 불가능하다.
- index fast full scan
  => 세그먼트 전체를 스캔하면 정렬이 보장되지 않는다.
  => multi block i/o
  => 병렬 스캔이 가능하다.
  
예제 1. 직업, 직업별 인원수를 출력하는 SQL을 작성하는데 index fast full scan을 하시오. 
@demo 
create index emp_job on emp(job); 

select /*+index_ffs(emp emp_job) */ job, count(*) 
from emp 
where job is not null 
group by job; 
@p

문제 1. 부서번호, 부서번호별 인원수를 출력하는데 관련된 인덱스 생성하고 index fast full scan이 
되게 하시오. 
create index emp_deptno on emp(deptno); 

select /*+ index_ffs(emp emp_deptno)*/ deptno, count(*) 
from emp 
where deptno is not null 
group by deptno; 
@p

문제 2. 직업과 직업별 토탈월급을 출력하는데 index fast full scan이 되겠금 관련된 인덱스를 걸고 
SQL을 작성하시오. 
create index emp_job_sal on emp(job, sal);

select /*+ index_ffs(emp emp_job_sal)*/ job, sum(sal) 
from emp 
where job is not null 
group by job; 
@p

=> /*+ index_ffs(emp emp_job_sal)*/ 힌트를 안 쓰면 index full scan을 하는 것이다. 

예제 2. 병렬로 index fast full scan을 하시오. 
select /*+ index_ffs(emp emp_job_sal) 
				parallel_index(emp, emp_job_sal,4) */ job, sum(sal) 
from emp 
where job is not null 
group by job; 

=> parallel_index(테이블명, 인덱스 이름, 병렬도) → xe 버전에서는 병렬작업이 안된다.
   => 병렬도는 클수록 빨라지는데 병렬도의 최대값은 (cpu_count x 2) 만큼 줄 수 있다.
       show parameter cpu_count
       
문제 3. 부서번호, 부서번호 별 인원수를 출력하는데 index fast full scan을 하고 병렬로 작업할 수 
있게 힌트를 주시오. 
create index emp_deptno on emp(deptno); 

select /*+ index_ffs(emp emp_deptno) parallel_index(emp, emp_deptno,16) */ 
			deptno, count(*) 
from emp 
where deptno is not null 
group by deptno; 
@p    