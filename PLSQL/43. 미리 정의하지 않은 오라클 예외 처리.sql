�� ����Ŭ���� �̸� ���� ���� ���� ���� ó�� �� ���� ���� ���� ó���� �ؾ� �ϴµ� 
pragma  exception_init�� �̿��ؼ� ���� ó�� �ϸ� �ȴ�. 

- ����Ŭ���� �̸� �������� ���� ����ó��
1. emp �� dept �� �ʱ�ȭ �Ѵ�.
@demo.sql

2. dept ���̺� loc �÷��� not null ������ �Ǵ�.*/
alter  table  dept
modify   loc  not  null;

3. dept ���̺� �����͸� �Է��ϴ� PL/SQL ���α׷��� �ۼ��Ѵ�.
accept  p_deptno  prompt  '�μ���ȣ�� �Է��ϼ���~ '
accept  p_dname   prompt  '�μ����� �Է��ϼ���~ '
accept  p_loc     prompt  '�μ���ġ�� �Է��ϼ���~ '
begin
    insert into  dept
    values(&p_deptno, '&p_dname', '&p_loc');	
    commit;
end;
/

4. loc�� null ���� �Է��غ���. 
�μ���ȣ�� �Է��ϼ���~ 70
�μ����� �Է��ϼ���~ hr2
�μ���ġ�� �Է��ϼ���~

5. ����ó���� �Ѵ�.
accept  p_deptno  prompt  '�μ���ȣ�� �Է��ϼ���~ '
accept  p_dname   prompt  '�μ����� �Է��ϼ���~ '
accept  p_loc     prompt  '�μ���ġ�� �Է��ϼ���~ '
declare 
    e_insert_except exception;
    pragma exception_init(e_insert_except, -01400);
begin
    insert into  dept
    values(&p_deptno, '&p_dname', '&p_loc');	
    commit;
    
    exception 
        when e_insert_except then 
            dbms_output.put_line('�μ���ġ�� �Է����� �ʾҽ��ϴ�. �μ���ġ�� �Է��Ͻÿ�.' );
end;
/

���� 1. 
1-1.emp ���̺� empno �÷��� �ߺ��� �����Ͱ� �Էµ��� ���ϰ� primary key ������ �Žÿ�.
demo script �ѹ� �����ְ� Ǫ�ÿ�. 
@demo
alter  table  emp
add  constraint  emp_empno_pk primary  key(empno);

1-2. emp ���̺� �����͸� �Է��ϴ� �Ʒ��� PL/SQL ���α׷��� �ۼ��Ͻÿ�
accept   p_empno prompt  '�����ȣ�� �Է��ϼ���~ '
accept  p_ename   prompt  '����̸��� �Է��ϼ���~ '
accept  p_sal     prompt  '������ �Է��ϼ���~ '
begin
    insert into  emp(empno, ename, sal)
    values(&p_empno, '&p_ename',  &p_sal );	
    commit;
end;
/
1-3. empno �� �ߺ��� ��� ��ȣ�� �Է����� �� '�ش� �����ȣ�� ������ �����մϴ�.' ��� �޼����� 
��µǰ� �Ͻÿ� !
accept   p_empno prompt  '�����ȣ�� �Է��ϼ���~ '
accept  p_ename   prompt  '����̸��� �Է��ϼ���~ '
accept  p_sal     prompt  '������ �Է��ϼ���~ '
declare 
    e_insert_except exception;
    pragma exception_init(e_insert_except, -1);
begin
    insert into  emp(empno, ename, sal)
    values(&p_empno, '&p_ename',  &p_sal );	
    commit;
    exception
        when e_insert_except then 
            dbms_output.put_line('�ش� �����ȣ�� ������ �����մϴ�.');
end;
/