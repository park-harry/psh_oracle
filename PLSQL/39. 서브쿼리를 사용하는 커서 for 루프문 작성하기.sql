���� Ŀ����
1.Ŀ�� ���� 
2. Ŀ�� ���� 
3. Ŀ�� ��ġ 
4. Ŀ�� �ݱ�

���ڵ带 ����� Ŀ�� for loop�� 
1. Ŀ�� ����
- ���� ������ ����ϴ� Ŀ�� for ������ : x

�� ���� �ڵ尡 �����ϰ� �ܼ�ȭ �ǰ� �ִ�. (���� ���� ���� ����� ���� Ŀ���� �ʿ��ϴ�)


���� 1. �μ���ȣ��  ������ϰ� �μ���ȣ�� �Է��ϸ� �ش� �μ���ȣ�� ������� �̸��� ���ް� �μ���ȣ�� 
��µǰ� Ŀ�� for loop���� �ۼ��Ͻÿ�.
set serveroutput on 
set verify off 
accept p_deptno prompt '�μ���ȣ�� �Է��Ͻÿ�. '
begin 
    for emp_record in (select ename, sal, deptno 
                        from emp
                        where deptno = &p_deptno) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.deptno);
    end loop;
end;
/

���� 1. ������ PL/SQL�� ���ν����� �����Ͽ� ������ ���� ����ǰ��Ͻÿ�
	 exec pro_deptno(10);

set serveroutput on 
create or replace procedure pro_deptno
(p_deptno emp.deptno%type)
is 
begin 
    for emp_record in (select ename, sal, deptno 
                        from emp
                        where deptno = p_deptno) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.deptno);
    end loop;
end;
/

exec pro_deptno(10);

���� 2. �Ʒ��� ���� ������ �Է��ؼ� ���ν����� �����ϸ� �ش� ������ ������� �̸�, ����, ������ ���
�ǰ� ���ν����� �����Ͻÿ�. 

exec pro_job('SALESMAN')*/
set serveroutput on 
create or replace procedure pro_job
(p_job emp.job%type)
is 
begin 
    for emp_record in (select ename, sal, job 
                        from emp
                        where job = p_job) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.job);
    end loop;
end;
/

exec pro_job('SALESMAN');