PL/SQL ���α׷��� �����ϴ� ���� ����Ŭ�� �����ϴ� ���� �����δ� �پ��� ������ ���ܸ� �� ǥ���� ��
����. �̶�, ���� ���ܸ� �����Ͽ� ����ϴ� ���ܸ� ����� ���� ���� ��� �Ѵ�.

set  serveroutput on
accept   p_deptno  prompt  '�μ���ȣ�� �Է��ϼ��� ~ '
declare
    v_deptno    number :=  &p_deptno;
    e_invalid      exception;
begin
    update   dept
    set  dname ='testing'
    where  deptno = v_deptno; -- 0���� ���� ���ŵǾ��ٰ� ������ �ٷ� exception ó���� �ȴ�. 
    
    if  SQL%NOTFOUND  THEN
         raise  e_invalid;
    end  if;
    commit;

    exception
        when   e_invalid   then
        dbms_output.put_line('�μ���ȣ�� �����');
end;
/

=> update���� ���� �����͸� �Է��ߴٰ� ������ �߻����� �ʰ� ��0���� ������Ʈ �Ǿ����ϴ١� ��� �Ѵ�.

���� 1. �̸��� ������ϰ� �̸��� �Է��ϸ� �ش� ����� ������ ��µǴ� PL/SQL �ڵ带 �ۼ��Ͻÿ�.
�׷��� ������ 3000 �̻��̸� '�ش� ����� ������ �� �� �����ϴ�.' ��� �޼����� ��µǰ� 
����� ���� ����ó���� �����Ͻÿ�.

set  serveroutput on
accept   p_ename  prompt  '�̸��� �Է��ϼ��� ~ '
declare
    v_ename    emp.ename%type :=  upper('&p_ename');
    v_sal    emp.sal%type;
    e_invalid      exception;
begin
    select sal into v_sal
    from emp
    where  ename = v_ename;
    
    if  v_sal >=3000 THEN
         raise  e_invalid;
    end  if;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
    commit;

    exception
        when   e_invalid   then
        dbms_output.put_line('�ش� ����� ������ �� �� �����ϴ�.' );
end;
/