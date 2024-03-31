���� 1. emp ���̺��� �����͸� emp_test ���̺� �Է��� �� �ְ� emp ���̺�� �Ȱ��� ������ 
emp_test ���̺��� �����Ͻÿ�. 
drop table emp_test purge;

create table emp_test 
as 
    select * 
    from emp 
    where 0 = 1;

���� 2. forall ���� �̿��ؼ� emp ���̺��� ��� �����͸� emp_test ���̺� 1���� �Է��ϴ� 
���ν����� forall_emp�ϴ� �̸����� �����Ͻÿ�. 
create or replace procedure forall_emp 
is 
    type tnt_test is table of emp%rowtype;
    v_test tnt_test;
begin
    select * bulk collect into v_test 
    from emp;
    
    forall i in v_test.first .. v_test.last
        insert /*+ for_all */ into emp_test values v_test(i);
end;
/

exec forall_emp;

select * from emp_test;

���� 3. ���� forall_emp ���ν����� �������� �� �� ���� insert ���� �� 1���� ����Ǿ����� 
v$sql�� ��ȸ�ؼ� Ȯ���Ͻÿ�. 
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR_ALL */%';

���� 4. ���� ���� ���ν����� drop�Ͻÿ�. 
drop procedure forall_emp;

���� 5. v$sql�� ���� �ִ� �޸𸮿� �ִ� ������ ��� �� ����ÿ�. 
alter system flush shared_pool;