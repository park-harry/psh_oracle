-���� 
1. ���ڵ� ������ ��� �� ������ �ڵ�

accept   p_deptno   prompt  '�μ���ȣ�� �Է��Ͻÿ� ~ '
declare
    cursor   emp_cursor     is  -- Ŀ�� ����
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;

    v_ename        emp.ename%type;
    v_sal               emp.sal%type;
    v_job             emp.job%type;
    v_deptno       emp.deptno%type;

2.  ���ڵ� ������ ����������� �ڵ�:

accept   p_deptno   prompt  '�μ���ȣ�� �Է��Ͻÿ� ~ '
declare
    cursor   emp_cursor     is  -- Ŀ�� ����
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;
    
    emp_record     emp_cursor%rowtype;

��ü �ڵ� 
accept   p_deptno   prompt  '�μ���ȣ�� �Է��Ͻÿ� ~ '
declare
    cursor   emp_cursor     is  -- Ŀ�� ����
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- Ŀ�� ����
        loop
            fetch   emp_cursor   into  emp_record;   -- Ŀ�� ��ġ
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(emp_record.ename||chr(9)||emp_record.sal||chr(9)||
                            emp_record.job||chr(9)||emp_record.deptno);        
        end  loop;
    close   emp_cursor;
end;
/    


���� 1. �Ի��� �⵵�� ������ϰ� �Ի��� �⵵�� �Է��ϸ� �ش� �Ի��� �⵵�� �Ի��� �������
�̸��� ���ް� �Ի����� ��µǴ� PL/SQL  �ڵ带 ���ڵ� ������ �̿��� Ŀ������������
�ۼ��Ͻÿ�.

accept   p_hireyear   prompt  '�Ի��� �⵵�� �Է��Ͻÿ� ~ '
declare
    cursor   emp_cursor     is  -- Ŀ�� ����
    select    ename, sal, hiredate
    from   emp
    where    to_char(hiredate,'RRRR')  = '&p_hireyear' ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- Ŀ�� ����
        loop
            fetch   emp_cursor   into  emp_record;   -- Ŀ�� ��ġ
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(emp_record.ename||chr(9)||emp_record.sal||chr(9)||
                            emp_record.hiredate);      
        end  loop;
    close   emp_cursor;
end;
/