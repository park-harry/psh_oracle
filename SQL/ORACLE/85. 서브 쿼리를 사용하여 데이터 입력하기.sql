-- emp_backup9 ���̺��� �����ϴµ� emp ���̺��� ������ ������ �����Ͻÿ�.  
create table emp_backup9 
as 
select * from emp 
where 1=2;

-- emp ���̺��� ��� �����͸� emp_backup9 �� �����Ͻÿ�. 
insert into emp_backup9
select * from emp;

-- emp_backup9�� delete �ϰ� emp ���̺��� �����͸� emp_backup9�� �Է��ϴµ� ������ 0���� �ؼ� �Է��Ͻÿ�. 
delete from emp_backup9;

select listagg(column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

insert into emp_backup9 (LOC,GRADE,EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
select LOC,GRADE,EMPNO,ENAME,JOB,MGR,HIREDATE,0,COMM,DEPTNO from emp;

select * from emp_backup9;