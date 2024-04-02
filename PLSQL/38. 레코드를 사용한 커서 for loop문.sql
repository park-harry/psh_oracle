���� Ŀ����
1.Ŀ�� ���� 
2. Ŀ�� ���� 
3. Ŀ�� ��ġ 
4. Ŀ�� �ݱ�

���ڵ带 ����� Ŀ�� for loop�� 
1. Ŀ�� ����
- ���� PL/SQL Ŀ����

accept   p_job   prompt  '������ �Է��Ͻÿ� ~ '
declare
    cursor   emp_cursor     is  -- Ŀ�� ����
    select    ename, sal, job
    from   emp
    where    job  = upper('&p_job') ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- Ŀ�� ����
        loop
            fetch   emp_cursor   into  emp_record;   -- Ŀ�� ��ġ
            exit   when     emp_cursor%notfound;
            dbms_output.put_line( emp_record.ename||chr(9)||  
                                  emp_record.sal||chr(9) || 
                                  emp_record.job);
        end  loop;
    close   emp_cursor;
end;
/

- Ŀ�� for ������ �ǽ� ����

set serveroutput on 
set verify  off
accept  p_job  prompt  '������ �Է��ϼ��� '
declare
    cursor emp_cursor is
    select ename, sal, job
    from emp
    where job= upper('&p_job');
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.job);
    end  loop;
end;
/

���� 1. ���� �ڵ带 ���ν����� ����� ������ ���� ����ǰ� �Ͻÿ� !
create or replace procedure pro_job
(p_job emp.job%type) 
is 
    cursor emp_cursor is
    select ename, sal, job
    from emp
    where job= upper(p_job);
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.job);
    end  loop;
end;
/

exec  pro_job('SALESMAN');

���� 2. �μ���ȣ�� �Է��ؼ� ���ν����� �����ϸ� �ش� �μ���ȣ�� ���� ������� �̸�, ����, 
�μ���ȣ�� ��µǴ� ���ν����� �����Ͻÿ�. 
set serveroutput on 
create or replace procedure pro_deptno
(p_deptno emp.job%type) 
is 
    cursor emp_cursor is
    select ename, sal, deptno
    from emp
    where deptno = p_deptno;
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.deptno);
    end  loop;
end;
/

exec  pro_deptno(10);