- index skip scan�� �����Ϸ��� ���� �÷� �ε����� � SQL���� ����� �� �ִ����� ���� 
	�����ؾ� �Ѵ�.
- ���� �÷� �ε����� ���� �÷� �ε����� ù ��° �÷��� where ���� �־������ �� sql�� �� ���� �÷�
	�ε����� ����� �� �ִ�.

���� 1. �Ʒ��� SQL�� emp_deptno_job �ε����� ����ϴ°�? 
@demo 
create index emp_deptno_job on emp(deptno, job); 

select /*+ no_index_ss(emp emp_deptno_job)*/ ename, deptno, job 
from emp 
where job = 'SALESMAN';
@p 

=> ���� �÷� �ε����� ù ��° �÷��� deptno �� where ���� ������ index range scan�� �� �� ���� 
	 index full scan�̳� table full scan�� �ϰ� �ȴ�. �׷��� index skip scan�� Ȱ���ؾ� �Ѵ�.
=> index skip scan�� index�� full�� �� ��ĵ �ϴ°� �ƴ϶� �߰��߰� skip �ϸ鼭 index�� ��ĵ�ϴ�
	 ���̴�. skip �ϴ� ���� ������ �������� ������ ��������.
=> index skip scan ȿ���� ������ ���� �÷� �ε����� �����÷��� �������� ������ ��� ���� �ʾƾ�
	 ���� ������ ���δ�.
     
���� 1. ��� ���̺��� �μ���ȣ�� ������ ��� �ִ��� ����Ͻÿ�. 
select count(distinct deptno) 
from emp;

- Ʃ�� ȯ�� ���� 
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

���� 2. �Ʒ��� SQL�� ������ ������ Ȯ���Ͻÿ�. 
select count(*) 
from mcustsum t 
where salegb = 'A';
@p 

=> ���� ���� 3367�� 

���� 3. �Ʒ��� SQL�� index skip scan���� �����Ͻÿ�. 
select /*+ index_ss (t m_salemm_salegb ) */ count(*) 
from mcustsum t 
where salegb = 'A'; 
@p
=> ���� 302 �� 
