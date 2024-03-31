���� 1. �����ȣ�� �Է��Ͽ� ���ν����� �����ϸ� �ش� �����ȣ�� �����Ͱ� ��� ���̺���
�������� ���ν����� �����ϴµ� ���ν����� �����ϸ� ������ ���� �������� �����
�����Ͱ� ��µǰ��Ͻÿ�!
create or replace procedure delete_emp
(p_empno   emp.empno%type)
is 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
begin 
    delete from emp
    where empno = p_empno
    returning empno, ename into v_empno, v_ename;
    
    dbms_output.put_line(v_empno||chr(9)||v_ename);
end;
/

exec delete_emp(7788);

���� 2. �̸��� �Է��ؼ� ���ν����� �����ϸ� �ش� ����� �����Ͱ� �������� ���� ������ �����Ͻÿ�.
create or replace procedure delete_emp
(p_ename   emp.ename%type)
is 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
begin 
    delete from emp
    where ename = p_ename
    returning empno, ename into v_empno, v_ename;
    
    dbms_output.put_line(v_empno||chr(9)||v_ename);
end;
/

exec delete_emp('KING');