�ԷµǴ� ���� ���� PL/SQL ������ ����Ǿ�����  SQL�� �޶����� ����

Dynamic SQL �̶� �̸� �״�� �������� ���� �� �ִ� SQL�̴�. 
�ݴ��� ���� Static SQL �� �ִµ� Static SQL�� ���� SQL�� ������ �ʴ� SQL �̴�.
	1. Dynamic SQL : PL/SQL ���� ���������� �������� ���� �� �� �ִ� SQL
	2. Static SQL : PL/SQL ���� ���������� �������� ���� �� �� ���� ������ SQL

����: ���ν����� �ԷµǴ� ���� ���� �Ʒ��� ù��° SQL�� ����� �� �� �ְ� �ι�° SQL�� ����� ���� 
�ִ�.
select  sal + comm   into  v_sal
from  emp
where  job='SALESMAN';

select  sal + sal*0.2   into  v_sal
from  emp
where  job='ANALYST';

execute immediate ���� ��� ���� ��

CREATE OR REPLACE PROCEDURE find_sal
(p_job   emp.job%TYPE)
IS
    type trd_emp  is  record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;   
    v_stmt VARCHAR2(200);

BEGIN
    IF p_job = 'SALESMAN' THEN
        v_stmt := 'SELECT ename, sal + comm FROM emp WHERE job = :j';
    ELSIF p_job = 'ANALYST' THEN
        v_stmt := 'SELECT ename, sal + sal*0.2 FROM emp WHERE job = :j';
    ELSE
        v_stmt := 'SELECT ename, sal FROM emp WHERE job = :j';
    END IF;
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_job;
    
    FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).ename ||chr(9) || v_emp(i).sal );
    END LOOP;

END;
/

exec find_sal('SALESMAN');

���� 1. ���� ��ũ��Ʈ�� �̿��ؼ� �μ���ȣ�� �̿��ؼ� ���ν����� �����ϸ� �ش� �μ���ȣ�� ������� 
�̸��� ������ ��µǰ� �Ͻÿ�. 
- �μ���ȣ 30: sal + comm, 10: sal + 1000, ������: sal 

CREATE OR REPLACE PROCEDURE find_sal
(p_deptno   emp.job%TYPE)
IS
    type trd_emp  is  record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;   
    v_stmt VARCHAR2(200);

BEGIN
    IF p_deptno = 30 THEN
        v_stmt := 'SELECT ename, sal + nvl(comm,0) FROM emp WHERE deptno = :j';
    ELSIF p_deptno = 10 THEN
        v_stmt := 'SELECT ename, sal + 1000 FROM emp WHERE deptno = :j';
    ELSE
        v_stmt := 'SELECT ename, sal FROM emp WHERE deptno = :j';
    END IF;
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_deptno;
    
    FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).ename ||chr(9) || v_emp(i).sal );
    END LOOP;

END;
/

exec find_sal(30);

execute immediate ���� ��� ������ ��

CREATE OR REPLACE PROCEDURE find_sal
(p_job IN emp.job%TYPE)
IS
    type trd_emp is record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;

BEGIN
    select ename, 
       CASE WHEN job = 'SALESMAN' THEN sal + comm
            WHEN job = 'ANALYST' THEN sal + sal * 0.2
        ELSE sal END bulk collect into v_emp
    from emp
    where job = p_job;
    
    FOR i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line(v_emp(i).ename || CHR(9) || v_emp(i).sal);
    END LOOP;
END;
/

exec find_ename(10);

=> find_sal ���ν����� ��� CASE ���� ����Ͽ� ���� ���ǿ� ���� �ٸ� ����� �����ϰ� �� ����� 
	 �ϳ��� SQL ������ ó���ϴ� ���� �� ȿ�����̸� �����ϴ�.
   => CASE ���� ����ϸ� ���� ������ ����� �� ������ �ϳ��� SQL ������ ���ϴ� �����
    ���� �� �ִ�.
=> �׷��� ���� SQL �� EXECUTE IMMEDIATE�� ����Ϸ��� ������, �Ϲ������� SQL ���� ��Ÿ�� �߿� 
	 �������� �����Ǵ� ���, ���� ��� �������� ���̺� �̸��̳� �� �̸��� �����ؾ� �ϴ� ��쿡 
	 �����ϴ�. 