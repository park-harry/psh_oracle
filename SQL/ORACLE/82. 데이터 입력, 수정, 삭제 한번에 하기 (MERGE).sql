-- emp�� dept�� �����ؼ� �̸��� �μ���ġ�� ����Ͻÿ�. 
select e.ename, d.loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp ���̺� loc �÷��� �߰��Ѵ� (�÷� �߰� �۾�) 
alter table emp 
add loc varchar2(10);

-- �߰��� loc �÷��� �����͸� �ش� ����� �μ���ġ�� ���� �����Ͻÿ�. 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc;

select ename, loc 
from emp; 

-- emp ���̺�� salgrade ���̺��� �����ؼ� �̸�, ����, grade�� ����Ͻÿ�. 
select e.ename, e.sal, s.grade
from emp e, salgrade s 
where e.sal between s.losal and s.hisal ;

-- ���� join���� �ʹ� ������ ������ȭ �ϱ�. emp ���̺� grade��� �÷��� �߰��Ͻÿ�. 
alter table emp 
add grade number(10);

merge into emp e 
using salgrade s
on (e.sal between s.losal and s.hisal) 
when matched then 
update set e.grade = s.grade;

-- emp18 ���̺�� telecom_table�� �����ؼ� �̸�, ��Ż�, ��ź� ����Ͻÿ�. 
select e.ename, e.telecom, t.t_price
from emp18 e, telecom_table t 
where e.telecom = t.telecom;

-- ���� join���� �ʹ� ������ ������ȭ �ϱ�. emp18 ���̺� t_price ��� �÷��� �߰��Ͻÿ�. 
alter table emp18 
add t_price number(10);

-- �߰��� t_price �÷��� �ش� ��Ż纰 ���� �����Ͻÿ�. 
merge into emp18 e
using telecom_table t 
on (e.telecom = t.telecom) 
when matched then 
update set e.t_price = t.t_price;

-- emp ���̺�� ������ �Ȱ����� �����ʹ� ���� ���̺��� emp700�̶�� �̸����� �����Ͻÿ�. 
create table emp700 
as 
select * from emp 
where 1 = 2;

-- emp 700 ���̺��� emp ���̺��� empno�� �Է��Ͻÿ�. 
insert into emp700(empno)
select empno from emp;

-- emp ���̺�� �Ȱ��� �����Ϳ� ������ emp_backup2��� ���̺��� �����Ͻÿ�. 
create table emp_backup2 
as 
select * from emp;

-- emp_backup2���� ������ salesman�� analyst �� ����ÿ�. 
delete from emp_backup2
where job in ('SALESMAN','ANALYST');

-- emp_backup2�� ������ ��� 0���� �����Ͻÿ�. 
update emp_backup2
set sal =0;

-- merge���� �̿��ؼ� emp_backup2�� �����͸� emp�� �Ȱ��� ���߽ÿ�. 
merge into emp_backup2 b 
using emp e 
on (b.empno = e.empno) 
when matched then 
update set b.sal = e.sal
when not matched then 
insert (b.LOC,b.GRADE,b.EMPNO,b.ENAME,b.JOB,b.MGR,b.HIREDATE,b.SAL,b.COMM,b.DEPTNO)
values (e.LOC,e.GRADE,e.EMPNO,e.ENAME,e.JOB,e.MGR,e.HIREDATE,e.SAL,e.COMM,e.DEPTNO);

select listagg('b.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

select listagg('e.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

-- �츮�� ���̺��� ����ϴ� emp18_backup7�̶�� ���̺��� ����ÿ�. 
create table emp18_backup7
as 
select * from emp18;

-- emp18_backup7 �� �����͸� �Ʒ��� ���� ����� update �Ͻÿ�. 
delete from emp18_backup7 
where lower(telecom) in ('kt','lg');

update emp18_backup7 
set age =null;

-- emp18_backup7�� ������ emp18 ���̺��� �������� �Ȱ��� merge �Ͻÿ�
select listagg('b.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP18';

select listagg('e.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP18';

merge into emp18_backup7 b 
using emp18 e 
on (b.ename = e.ename) 
when matched then 
update set b.telecom = e.telecom, b.age = e.age
when not matched then 
insert (b.T_PRICE,b.EMPNO,b.ENAME,b.GENDER,b.BIRTH,b.TELECOM,b.MAJOR,b.BEFORE_JOB,b.EMAIL,b.ADDRESS,b.AGE)
values (e.T_PRICE,e.EMPNO,e.ENAME,e.GENDER,e.BIRTH,e.TELECOM,e.MAJOR,e.BEFORE_JOB,e.EMAIL,e.ADDRESS,e.AGE);

-- merge ���� �̿����� ���� update ������ emp ���̺��� loc�� �ش� ����� �μ���ġ�� ���� �����Ͻÿ�. 
-- Ʃ�� �� sql 
update emp e 
set loc = (select loc from dept d where d.deptno = e.deptno);

-- Ʃ�� �� sql 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc; 