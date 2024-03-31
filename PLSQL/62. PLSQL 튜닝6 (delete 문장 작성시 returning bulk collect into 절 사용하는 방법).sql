���� 1. returning ���� ����Ͽ� ������ ���� ������ �μ���ȣ�� �Է��Ͽ� ���ν����� �����ϸ� ������
���� ������ �μ���ȣ�� ����� ����̸��� �μ���ȣ�� ��µǰ� �Ͻÿ�.
create or replace procedure delete_deptno
(p_deptno   emp.deptno%type)
is 
    type trd_emp is record(ename emp.ename %type, 
                            deptno emp.deptno%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
begin 
    delete from emp
    where deptno = p_deptno
    returning ename,deptno bulk collect into v_emp ;
    
    for i in 1..v_emp.count loop
        dbms_output.put_line(v_emp(i).ename||chr(9)||v_emp(i).deptno);
    end loop;
end;
/
exec delete_deptno(10);

���� 2. ������ �Է��ϸ� �ش� ������ ������� emp ���̺��� �����Ǵ� ���ν����� �����ϴµ�
���ν����� �����ϸ� �����Ǵ� ������ ������� �̸��� ������ ��µǰ� �Ͻÿ�.
create or replace procedure delete_job
(p_job   emp.job%type)
is 
    type trd_emp is record(ename emp.ename %type, 
                            job emp.job%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
begin 
    delete from emp
    where job = p_job
    returning ename,job bulk collect into v_emp ;
    
    for i in 1..v_emp.count loop
        dbms_output.put_line(v_emp(i).ename||chr(9)||v_emp(i).job);
    end loop;
end;
/
exec delete_job('SALESMAN');