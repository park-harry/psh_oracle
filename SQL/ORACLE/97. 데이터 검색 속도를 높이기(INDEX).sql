-- �ε����� ename �� ����
create index emp_ename on emp(ename); 

-- ename �� �ε����� ���� ������
select ename, rowid from emp where ename > ' '; 

-- ���� SQL�� ����� ���̺��� �о�� �����Ͱ� �ƴ϶� EMP_ENAME �ε������� �о�� ���������� 
-- Ȯ���Ͻÿ�.
explain plan for 
select ename, rowid 
from emp
where ename > ' ';

select * from table(dbms_xplan.display);

-- emp ���̺� sal �� �ε����� �����Ͻÿ�.  �ε��� �̸��� emp_sal �̶�� �Ͻÿ�.
create index emp_sal 
on emp(sal);

-- emp_sal  �ε����� ������ Ȯ���Ͻÿ�.
select sal, rowid 
from emp 
where sal > 0;

-- emp ���̺� hiredate �� �ε����� �����Ͻÿ�.
create index emp_hiredate on emp(hiredate); 

-- emp ���̺� hiredate �� �ε����� ������ Ȯ���Ͻÿ�
select hiredate, rowid 
from emp
where hiredate < to_date('9999/12/31');

-- emp ���̺� �ɷ��ִ� index ����Ʈ�� Ȯ���ϱ� ���� �ڵ� 
select * from user_indexes
where table_name = 'EMP';

-- rowid �� �ο��� �ּ��ε� �ε������� �ְ� ���̺��� �ֽ��ϴ�.
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

-- ������  1250 �� ����� �̸��� ������ ����ϴ� �������� �ۼ��ϴµ� full table scan �� 
-- �ǰ� �Ͻÿ� !
select /*+ full(emp) */ ename, sal 
from emp 
where sal = 1250;

-- ���� SQL�� emp_sal �ε����� ���ؼ� ���̺��� ������ �� �� �ֵ��� ��Ʈ�� �ֽÿ� 
select /*+ index(emp emp_sal)*/ ename, sal 
from emp
where sal = 1250;

create index emp_job on emp(job); 

explain plan for 
select ename, sal, job 
from emp 
where job like 'SALES%';

select * from table(dbms_xplan.display);

-- c##scott ������ �����ϰ� �ִ� �ε��� ����Ʈ�� Ȯ���Ͻÿ� !
select index_name 
from user_indexes 
where table_name = 'EMP';

select /*+ index_asc(emp emp_sal) */ ename, sal
from emp 
where sal >=0;

-- �츮�� ���̺��� �̸��� �ڼ�ȯ �л��� �̸��� ���̿� �ּҸ� ����ϰ� �� �������� �����ȹ�� Ȯ���Ͻÿ� !
explain plan for 
select ename, age, address 
from emp18 
where ename = '�ڼ�ȯ'; 

select * from table(dbms_xplan.display);

-- �츮�� ���̺� �̸��� index�� �����ϰ� �����ȹ�� �ٽ� Ȯ���Ͻÿ�. 
create index emp18_ename on emp18(ename); 

explain plan for 
select ename, age, address 
from emp18 
where ename = '�ڼ�ȯ'; 

select * from table(dbms_xplan.display); 

-- ������ index�� unique index���� non unique index���� Ȯ���ϱ� 
select index_name, uniqueness
from user_indexes 
where table_name = 'EMP18';

-- emp18 ���̺� ename�� �ɸ� index�� �����ϰ� �ٽ� unique index�� �����Ͻÿ�. 
drop index emp18_ename; 

create unique index emp18_ename on emp18(ename); 

/*emp18 ���̺� age �÷��� non unique index�� �����ϰ� �̸��� �ڼ�ȯ�̰� ���̰� 30�� �л��� 
�̸�, ���̸� ����ϴ� �������� �ε����� �� �� � index�� ��Ƽ�������� �����ϴ��� Ȯ���Ͻÿ�. */
create index emp18_age on emp18(age); 

explain plan for 
select ename, age
from emp18 
where ename = '�ڼ�ȯ' and age = 30; 

explain plan for 
select /*+ index(emp18 emp18_age)*/ ename, age
from emp18 
where ename = '�ڼ�ȯ' and age = 30; 

select * from table(dbms_xplan.display); 

--  emp ���̺��� job �÷��� �ε����� �����Ͻÿ�. 
create index emp_job on emp(job);

-- ������  CLERK �� �������  ������ ������ ����ϴ� �������� �����ȹ�� Ȯ���Ͻÿ� !
explain plan for 
select job, sal 
from emp 
where job = 'CLERK'; 

-- emp ���̺� job �� sal �� ������ ���� ���� �÷� �ε����� �����Ͻÿ�.
create index emp_job_sal 
on emp(job,sal);

--emp_job_sal index�� ���� ���캸�� 
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

-- deptno ��  sal �� ���� �÷� �ε����� �����Ͻÿ�.(�ε��� �̸��� emp_deptno_sal�� �Ͻÿ�)
create index emp_deptno_sal
on emp(deptno,sal);

--emp_deptno_sal �ε����� ������ Ȯ���Ͻÿ�
select deptno, sal, rowid 
from emp 
where deptno > 0;

explain plan for 
select /*+ index_desc (emp emp_deptno_sal)*/ename, deptno, sal 
from emp 
where deptno = 20; 

select * from table(dbms_xplan.display); 

-- �ε����� �����Ǿ��ִ� ���̺�� �����Ǿ����� ���� ���̺� �뷮�� �����͸� insert �Ҷ� 
-- �ӵ��� Ȯ���Ͻÿ�.
-- ���� 2���� ���̺��� �����Ͻÿ�. 
create   table  sales_no_index
as
select  * from  sh.sales where 1 = 2;

create  table  sales_with_index
as
select * from sh.sales where  1 = 2 ;

-- ���� 2���� ���̺� �߿� sales_with_index ���̺��� �ε����� �����Ͻÿ�
create index  sales_index_1
on sales_with_index(amount_sold, promo_id);

-- �Ʒ��� ���� �뷮�� �����͸� 2�� ���̺� ���� �Է��ϰ� �ӵ��� ���Ͻÿ�!
set  timing   on --> ���� ���� �� ��ü ���� 
insert   into  sales_no_index
select *
from sh.sales; --> 1.386

set timing on
insert   into   sales_with_index
select *
from sh.sales; --> 12.746

