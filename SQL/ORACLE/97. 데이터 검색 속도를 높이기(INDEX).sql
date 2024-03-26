-- 인덱스를 ename 에 생성
create index emp_ename on emp(ename); 

-- ename 의 인덱스만 보는 쿼리문
select ename, rowid from emp where ename > ' '; 

-- 위의 SQL의 결과가 테이블에서 읽어온 데이터가 아니라 EMP_ENAME 인덱스에서 읽어온 데이터임을 
-- 확인하시오.
explain plan for 
select ename, rowid 
from emp
where ename > ' ';

select * from table(dbms_xplan.display);

-- emp 테이블에 sal 에 인덱스를 생성하시오.  인덱스 이름은 emp_sal 이라고 하시오.
create index emp_sal 
on emp(sal);

-- emp_sal  인덱스의 구조를 확인하시오.
select sal, rowid 
from emp 
where sal > 0;

-- emp 테이블에 hiredate 에 인덱스를 생성하시오.
create index emp_hiredate on emp(hiredate); 

-- emp 테이블에 hiredate 의 인덱스의 구조를 확인하시오
select hiredate, rowid 
from emp
where hiredate < to_date('9999/12/31');

-- emp 테이블에 걸려있는 index 리스트를 확인하기 위한 코드 
select * from user_indexes
where table_name = 'EMP';

-- rowid 는 로우의 주소인데 인덱스에도 있고 테이블에도 있습니다.
select rowid, empno, ename, sal, hiredate 
from emp;

select ename, sal 
from emp 
where ename = 'CLARK';

explain plan for 
select ename, sal 
from emp 
where ename = 'CLARK'; 

select * from table(dbms_xplan.display);

-- 월급이  1250 인 사원의 이름과 월급을 출력하는 쿼리문을 작성하는데 full table scan 이 
-- 되게 하시오 !
select /*+ full(emp) */ ename, sal 
from emp 
where sal = 1250;

-- 위의 SQL이 emp_sal 인덱스를 통해서 테이블을 엑세스 할 수 있도록 힌트를 주시오 
select /*+ index(emp emp_sal)*/ ename, sal 
from emp
where sal = 1250;

create index emp_job on emp(job); 

explain plan for 
select ename, sal, job 
from emp 
where job like 'SALES%';

select * from table(dbms_xplan.display);

-- c##scott 유져가 소유하고 있는 인덱스 리스트를 확인하시오 !
select index_name 
from user_indexes 
where table_name = 'EMP';

select /*+ index_asc(emp emp_sal) */ ename, sal
from emp 
where sal >=0;

-- 우리반 테이블에서 이름이 박성환 학생의 이름과 나이와 주소를 출력하고 그 쿼리문의 실행계획을 확인하시오 !
explain plan for 
select ename, age, address 
from emp18 
where ename = '박성환'; 

select * from table(dbms_xplan.display);

-- 우리반 테이블 이름의 index를 생성하고 실행계획을 다시 확인하시오. 
create index emp18_ename on emp18(ename); 

explain plan for 
select ename, age, address 
from emp18 
where ename = '박성환'; 

select * from table(dbms_xplan.display); 

-- 생성한 index가 unique index인지 non unique index인지 확인하기 
select index_name, uniqueness
from user_indexes 
where table_name = 'EMP18';

-- emp18 테이블에 ename에 걸린 index를 삭제하고 다시 unique index로 생성하시오. 
drop index emp18_ename; 

create unique index emp18_ename on emp18(ename); 

/*emp18 테이블 age 컬럼에 non unique index를 생성하고 이름이 박성환이고 나이가 30인 학생의 
이름, 나이를 출력하는 쿼리문의 인덱스는 둘 중 어떤 index를 옵티마이저가 선택하는지 확인하시오. */
create index emp18_age on emp18(age); 

explain plan for 
select ename, age
from emp18 
where ename = '박성환' and age = 30; 

explain plan for 
select /*+ index(emp18 emp18_age)*/ ename, age
from emp18 
where ename = '박성환' and age = 30; 

select * from table(dbms_xplan.display); 

--  emp 테이블의 job 컬럼에 인덱스를 생성하시오. 
create index emp_job on emp(job);

-- 직업이  CLERK 인 사원들의  직업과 월급을 출력하는 쿼리문의 실행계획을 확인하시오 !
explain plan for 
select job, sal 
from emp 
where job = 'CLERK'; 

-- emp 테이블에 job 과 sal 에 다음과 같이 결합 컬럼 인덱스를 생성하시오.
create index emp_job_sal 
on emp(job,sal);

--emp_job_sal index의 구조 살펴보기 
select job,sal, rowid 
from emp 
where job > ' ';

explain plan for 
select job, sal 
from emp 
where job = 'CLERK'; 

select * from table(dbms_xplan.display); 

explain plan for 
select /*+ index_desc(emp emp_job_sal)*/ename, job, sal 
from emp
where job = 'CLERK'; 

-- deptno 와  sal 을 결합 컬럼 인덱스로 생성하시오.(인덱스 이름은 emp_deptno_sal로 하시오)
create index emp_deptno_sal
on emp(deptno,sal);

--emp_deptno_sal 인덱스의 구조를 확인하시오
select deptno, sal, rowid 
from emp 
where deptno > 0;

explain plan for 
select /*+ index_desc (emp emp_deptno_sal)*/ename, deptno, sal 
from emp 
where deptno = 20; 

select * from table(dbms_xplan.display); 

-- 인덱스가 생성되어있는 테이블과 생성되어있지 않은 테이블에 대량의 데이터를 insert 할때 
-- 속도를 확인하시오.
-- 다음 2개의 테이블을 생성하시오. 
create   table  sales_no_index
as
select  * from  sh.sales where 1 = 2;

create  table  sales_with_index
as
select * from sh.sales where  1 = 2 ;

-- 위의 2개의 테이블 중에 sales_with_index 테이블에만 인덱스를 생성하시오
create index  sales_index_1
on sales_with_index(amount_sold, promo_id);

-- 아래와 같이 대량의 데이터를 2개 테이블에 각각 입력하고 속도를 비교하시오!
set  timing   on --> 먼저 실행 후 전체 실행 
insert   into  sales_no_index
select *
from sh.sales; --> 1.386

set timing on
insert   into   sales_with_index
select *
from sh.sales; --> 12.746

