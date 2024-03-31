���� 1. �Ʒ��� ȯ���� ����ÿ�! 
@demo 
create index emp_job on emp(job); 
create index emp_deptno on emp(deptno); 

- Ʃ�� ��: index merge scan 
select /*+ and_equal (emp emp_job emp_deptno)*/ empno, ename, job, deptno 
from emp 
where deptno = 30 and job = 'SALESMAN'; 
@p 

=> buffer 8�� 

- Ʃ�� ��: index bitmap merge scan 
select /*+ index_combine(emp)*/ empno, ename, job, deptno 
from emp 
where deptno = 30 and job = 'SALESMAN'; 
@p 
=> buffer 4�� 

���� 1. �Ʒ��� ȯ���� ����� �Ʒ��� SQL�� Ʃ���Ͻÿ�. 
drop  table mcustsum  purge;

create table mcustsum
as
select rownum custno
     , '2008' || lpad(ceil(rownum/100000), 2, '0') salemm
     , decode(mod(rownum, 12), 1, 'A', 'B') salegb
     , round(dbms_random.value(1000,100000), -2) saleamt
from   dual
connect by level <= 1200000 ;

create index m_indx1 on mcustsum(custno);
create index m_indx2 on mcustsum(salemm);
create index m_indx3 on mcustsum(salegb);

- Ʃ�� ��:
select /*+ and_equal(t m_indx2 m_indx3) */ count(*) 
from mcustsum t 
where salegb = 'A' 
and salemm = '200801';

- Ʃ�� ��: 
select /*+ index_combine (t) */ count(*) 
from mcustsum t 
where salegb = 'A' 
and salemm = '200801';