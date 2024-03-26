-- ������ SALESMAN�� ������� �̸��� ���ް� ������ ����ϴ� view�� �����Ͻÿ�. (VIEW �̸��� sales _view) 
create or replace view sales_view 
as 
select ename, sal, job 
from emp 
where job = 'SALESMAN';

-- (���� view) �̸�, ����, �μ���ġ�� ����ϴ� view �� emp_dept �� �����Ͻÿ�
create or replace view emp_dept 
as 
select e.ename, e.sal, d.loc 
from emp e, dept d 
where e.deptno = d.deptno; 

-- emp_dept ���� KING�� �μ���ġ��  �ʶ��ǾƷ� �����ϼ���.
update emp_dept 
set loc = 'PHILADELPHIA'
where ename = 'KING';
-- >  King �� ���� �μ���ġ�� ���� ������� �μ���ġ�� �ٲ��.

-- emp_dept �信�� KING �� ������ 9000 ���� �����Ͻÿ�. (21c version)
update emp_dept
set sal = 9000 
where ename = 'KING';

--(19c version) primary key ������ �ɾ���� ������ �����ϴ�.
alter table dept 
add constraint dept_deptno_pk primary key(deptno); 

update emp_dept
set sal = 9000 
where ename = 'KING';

--����, ������ ��Ż������ ����Ͻÿ� !
select job,sum(sal) 
from emp 
group by job; 

--���� ����� ����ϴ� view ��  job_sum �̶�� �̸����� �����Ͻÿ�!
create or replace view job_sum 
as 
select job,sum(sal) as sumsal
from emp 
group by job; 

-- job_sum �信��  ������  CLERK ��  sumsal �� 7000 ���� �����Ͻÿ�
update job_sum 
set sumsal=7000
where job = 'CLERK';

-- ���� job_sum �並  delete �� ����ÿ� !
delete from job_sum;


-- ��ȭ�� ī�� ����Ʈ ���� ���� ���̺�  2%, 5%  �������� �ԷµǾ��ִµ� �� ���̺� ���� DML 
-- ���ϰ� ���ƶ� !

lock table emp in exclusive mode; 
--> �̷��� �ϸ� �ȵȴ�. with read only �� view�� ������ָ� �ȴ�. 
create or replace view emp77 
as 
select * from emp 
with read only; 
-- emp77�� ������ ��� 9000���� �����Ͻÿ�. 
update emp77 
set sal = 9000; 

-- emp77 ���� �����͸� ��� delete �� ����ÿ�. 
delete from emp77; 

-- emp77 ���� �����͸� �ٽ� dml �۾��� �� �� �ֵ��� �����Ͻÿ�. 
create or replace view emp77 
as 
select * from emp; 

-- �μ���ȣ�� 10��, 20���� ������� ��� �÷��� �������� view �� �����Ͻÿ�!(�̸��� emp547) 
create or replace view emp547 
as 
select * from emp 
where deptno in (10,20); 

-- emp547 �並 �����ϴµ� KING �� ������ 8400���� �����Ͻÿ�
update emp547
set sal = 8400
where ename = 'KING';

-- emp547 �並 �����ϴµ� KING �� �μ���ȣ�� 30������ �����Ͻÿ�
update emp547
set deptno = 30
where ename = 'KING';

-- emp547 �並 �ٽ� ����µ� deptno ��ŭ�� ���ŵ��� ���ϰڱ� �並 �����Ͻÿ� !
-- (������� where �� ���ǿ� ����ǰڱ� �並 �������� ���ϰ� �Ͻÿ�!)
create or replace view emp547
as 
select * from emp 
where deptno in (10,20)
with check option; 
-- ���� where �������� ���� �Ǹ� update�� �ȵȴ�. 
update emp547
set deptno = 30
where ename = 'FORD';
-- update �ȵ�. 

-- ������  4000 ������ �������  ��� �÷��� ��� VIEW �� emp551 �� �����ϴµ�
-- emp551���� ������ 4000 ���� ũ�� �������� ���ϵ��� view �� �����Ͻÿ� !
create or replace view emp551 
as 
select * 
from emp 
where sal <= 4000
with check option;

-- emp ���̺��� ���ٸ� �Ʒ��� view�� ��������ڴ°�?
drop table emp; 

create view emp77
as 
select empno, ename, sal 
from emp; 

-- ���̺��� ��� view�� ������ �� �ְ� �ϴ� �ɼ��� �ִ� �ٷ� force��. 
create force view emp77
as 
select empno, ename, sal 
from emp;

-- view�� ������� ������ �����Ͱ� �������� �ʴ´�. 

select * from emp77; 

-- �μ���ȣ, �μ���ȣ�� ��տ����� ����ϴ� view�� �����Ͻÿ�. �μ���ȣ�� ��� ������ �Ҽ��� 
-- ���ϴ� ��� �ȵǰ� �ݿø��ϰ� õ���� ǥ�ø� �� �ؼ� ��µǰ� �Ͻÿ�. (emp_avg) 
create or replace view emp_avg 
as 
select deptno, to_char(round(avg(sal)),'999,999') as avgsal
from emp 
group by deptno; 

select * from emp_avg;