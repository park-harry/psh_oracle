create global temporary table emp_temp3 
(empno number(10), 
ename varchar2(10), 
sal   number(10) )
on commit delete rows;

insert into emp_temp3 values(1111,'scott',3000);
insert into emp_temp3 values(2222,'allen',2000);

select * from emp_temp3;

commit;

-- on commit preserve rows �ɼ����� �ӽ� ���̺��� �����Ѵ�.
create global temporary table emp_temp4
(empno number(10), 
ename varchar2(10), 
sal   number(10) )
on commit preserve rows;

-- dept ���̺�� �Ȱ��� ������ dept_temp ���̺��� ����µ� commit �ϸ� ������� �ӽ� 
-- ���̺�� �����Ͻÿ�. 
create global temporary table dept_temp
on commit delete rows
as 
select * from dept where 1=2;

insert into dept_temp 
select * from dept;

