���� 1-1. ������  insert ������ �����ϴ� ���ν����� �����մϴ�.
insert   into   emp(empno, ename, sal )
values( 1122,  'JAMES',  3000 );

--���ν����� �����Ѵ�.
create  or  replace  procedure   insert_emp
as
		begin
				insert   into   emp(empno, ename, sal )
				values(  1122,  'JAMES',  3000 );
		end;
/

���� 1-2. ���ν����� �����Ѵ�.
execute   insert_emp;
select * from emp;

���� 1. ���� ���ν�����  ������ �� ��� ���̺� �Է��� �Է°��� ���� �Է��� �� �ְ� �����Ͻÿ�.
execute   insert_emp(1234, 'JACK', 4000);
execute   insert_emp(1235, 'JANE', 5000);
-- ���� 2���� �Է��ϸ� error �߻� 

create  or replace  procedure    insert_emp
		( p_empno   emp.empno%type,
		p_ename  emp.ename%type,
		p_sal       emp.sal%type ) -- �Է� parameter(�Ű�) ���� 
as
		begin
		insert   into   emp(empno, ename, sal )
		values( p_empno, p_ename, p_sal );
		end;
/

execute   insert_emp(1234, 'JACK', 4000);
select * from emp;

���� 2. dept ���̺� �����͸� �Է��ϴ� ���ν����� �����Ͻÿ�.
exec  insert_dept(50,'HR', 'SEOUL');

create or replace procedure insert_dept
		(p_deptno dept.deptno%type,
		p_dname  dept.dname%type,
		p_loc    dept.loc%type)
as
		begin
		insert into dept(deptno, dname, loc)
		values (p_deptno, p_dname, p_loc);
		end;
/