- Ŀ������ -> Ŀ������ -> Ŀ����ġ -> Ŀ�� �ݱ�
accept   p_deptno   prompt  '�μ���ȣ�� �Է��Ͻÿ� ~ '

- Ŀ�� ���� 
declare
		cursor   emp_cursor     is  
		select    ename, sal, job, deptno
		from   emp
		where    deptno  =  &p_deptno ;

		v_ename        emp.ename%type;
		v_sal               emp.sal%type;
		v_job             emp.job%type;
		v_deptno       emp.deptno%type;
begin
		open    emp_cursor;  -> Ŀ�� ���� 
				loop
						fetch   emp_cursor   into   v_ename, v_sal, v_job, v_deptno;   -- Ŀ�� ��ġ
						exit   when     emp_cursor%notfound;
						-> emp_cursor���� �����Ͱ� �߰ߵ��� ���� �� ���Ͷ�. (fetch �Ұ� ������ ����) 
						dbms_output.put_line(v_ename||'  '||v_sal||'  '||v_job||'  '||v_deptno);						
				end  loop;
		close   emp_cursor; -> Ŀ�� �ݱ� 
end;
/

���� 1. ������ ����� �ϰ� ������ �Է��ϸ� �ش� ������ ���� ������� �̸��� ���ް� ������ 
��µǰ� PL/SQL �ڵ带 �ۼ��Ͻÿ�.

accept   p_job   prompt  '������ �Է��Ͻÿ� ~ '

declare
    cursor   emp_cursor     is  
    select    ename, sal, job
    from   emp
    where    job  =  upper('&p_job');
    
    v_ename        emp.ename%type;
    v_sal               emp.sal%type;
    v_job             emp.job%type;
begin
    open    emp_cursor;  
        loop
            fetch   emp_cursor   into   v_ename, v_sal, v_job;  
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(v_ename||chr(9)||v_sal||chr(9)||v_job);						
        end  loop;
    close   emp_cursor; 
end;
/