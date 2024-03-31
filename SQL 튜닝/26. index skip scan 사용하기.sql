- index skip scan을 이해하려면 결합 컬럼 인덱스가 어떤 SQL에서 사용할 수 있는지를 먼저 
	이해해야 한다.
- 결합 컬럼 인덱스는 결합 컬럼 인덱스의 첫 번째 컬럼이 where 절에 있어야지만 그 sql이 그 결합 컬럼
	인덱스를 사용할 수 있다.

예제 1. 아래의 SQL은 emp_deptno_job 인덱스를 사용하는가? 
@demo 
create index emp_deptno_job on emp(deptno, job); 

select /*+ no_index_ss(emp emp_deptno_job)*/ ename, deptno, job 
from emp 
where job = 'SALESMAN';
@p 

=> 결합 컬럽 인덱스의 첫 번째 컬럼인 deptno 가 where 절에 없으면 index range scan을 할 수 없고 
	 index full scan이나 table full scan을 하게 된다. 그래서 index skip scan을 활용해야 한다.
=> index skip scan은 index를 full로 다 스캔 하는게 아니라 중간중간 skip 하면서 index를 스캔하는
	 것이다. skip 하는 양이 많으면 많을수록 성능이 좋아진다.
=> index skip scan 효과를 보려면 결함 컬럼 인덱스의 선두컬럼의 데이터의 종류가 몇가지 되지 않아야
	 좋은 성능을 보인다.
     
문제 1. 사원 테이블이 부서번호의 종류가 몇개가 있는지 출력하시오. 
select count(distinct deptno) 
from emp;

- 튜닝 환경 구성 
drop  table mcustsum  purge;

create table mcustsum
as
select rownum custno
     , '2008' || lpad(ceil(rownum/100000), 2, '0') salemm
     , decode(mod(rownum, 12), 1, 'A', 'B') salegb
     , round(dbms_random.value(1000,100000), -2) saleamt
from   dual
connect by level <= 1200000 ;

create  index  m_salemm_salegb  on  mcustsum(salemm,salegb);

예제 2. 아래의 SQL의 버퍼의 개수를 확인하시오. 
select count(*) 
from mcustsum t 
where salegb = 'A';
@p 

=> 버퍼 개수 3367개 

예제 3. 아래의 SQL을 index skip scan으로 유도하시오. 
select /*+ index_ss (t m_salemm_salegb ) */ count(*) 
from mcustsum t 
where salegb = 'A'; 
@p
=> 버퍼 302 개 
