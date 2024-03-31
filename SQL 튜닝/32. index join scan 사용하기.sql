���� 1. �Ʒ��� ȯ���� ����ÿ�. 
@demo 
create index emp_deptno on emp(deptno); 
create index emp_job on emp(job); 

- Ʃ�� ��: 
select deptno, job 
from emp 
where deptno = 30 and job = 'SALESMAN'; 

=> ���� 4�� 

- Ʃ�� ��: 
select /*+ index_join (emp emp_deptno emp_job) */deptno, job 
from emp 
where deptno = 30 and job = 'SALESMAN'; 
=> ���� 3��


���� 1. �Ʒ��� ȯ���� ����� SQL�� Ʃ���Ͻÿ�. 
drop  table  mcustsum purge;

create table mcustsum
as
select rownum custno
     , '2008' || lpad(ceil(rownum/100000), 2, '0') salemm
     , decode(mod(rownum, 12), 1, 'A', 'B') salegb
     , round(dbms_random.value(1000,100000), -2) saleamt
from   dual
connect by level <= 1200000 ;

create  index  m_indx1  on   mcustsum(custno);
create  index  m_indx2  on   mcustsum(salemm);
create  index  m_indx3  on   mcustsum(salegb);

- Ʃ�� ��: 
select salegb, salemm
from mcustsum t 
where salegb = 'A' 
and salemm = '200801';

- Ʃ�� ��: 
select /*+ index_join(t m_indx2 m_indx3)*/salegb, salemm
from mcustsum t 
where salegb = 'A' 
and salemm = '200801';