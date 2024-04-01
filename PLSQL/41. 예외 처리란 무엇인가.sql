���� ó��(exception handling)��, ���α׷��Ӱ� ����ġ ���� ������ �߻��� �̸� ��ó�ϴ� �ڵ带 
�ۼ��ϴ� ������, ���� ���� ���α׷��� ���������� ���Ḧ ���� ���¸� ���� ���·� �����ϴ� ���̴�.

- ����
declare
	���� ���� ;
	���� ���� ;
begin
	���๮;
	����ó����;
end;
/

���� 1. �̸��� �Է��ϸ� �ش� ����� ������ ��µǴ� PL/SQL�ڵ带 �ۼ��Ͻÿ� !
set serveroutput on 
set verify off 
accept p_ename prompt '�̸��� �Է��Ͻÿ�.'
declare 
    v_ename emp.ename%type:= upper('&p_ename');
    v_sal   emp.sal%type;
begin 
    select sal into v_sal 
    from emp 
    where ename = v_ename;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
end;
/

���� 1-1. MARTIN �� �̸��� SCOTT ���� �����ϰ� ���� PL/SQL �ڵ带 �����ϴµ� �̸��� SCOTT����
�Է��غ��ÿ�.
update  emp
set   ename='SCOTT'
where  ename='MARTIN';
commit;

���� 1-2. ���� ��츦 ����ϱ� ���� ����ó���� �ϼ���.
set serveroutput on 
set verify off 
accept p_ename prompt '�̸��� �Է��Ͻÿ�.'
declare 
    v_ename emp.ename%type:= upper('&p_ename');
    v_sal   emp.sal%type;
begin 
    select sal into v_sal 
    from emp 
    where ename = v_ename;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
    
    exception 
	    when too_many_rows then 
	    dbms_output.put_line('�ش� ��� �̸��� ���� �� �ֽ��ϴ�. �����ͷ� �����ϼ���.');
end;
/


�ǽ�ȯ�� ����.

alter session set nls_Date_format='RR/MM/DD';
drop table emp;
drop table dept;

CREATE TABLE DEPT
(DEPTNO number(10),
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
EMPNO               NUMBER(4) NOT NULL,
ENAME               VARCHAR2(10),
JOB                 VARCHAR2(9),
MGR                 NUMBER(4) ,
HIREDATE            DATE,
SAL                 NUMBER(7,2),
COMM                NUMBER(7,2),
DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-09',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7788,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7876,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);
commit;


���� 2. ��� ��ȣ�� ����� �ϰ� �����ȣ�� �Է��ϸ� �ش� ����� ������ ��µǴ� PL/SQL�� 
�����Ͻÿ�. �����ȣ�� �������� ������ '�ش� �����ȣ�� �ߺ��Ǿ� �������� �ֽ��ϴ�. �����ͷ� 
�����ϼ���' ��� �޼����� ��µǰ� ����ó���� �Ͻÿ�.
	�����ȣ�� �Է��ϼ��� ~  7788
	SCOTT �� ������ ANALYST �Դϴ�.*/

set serveroutput on 
set verify off 
accept p_empno prompt '�����ȣ�� �Է��ϼ���.'
declare 
    v_empno emp.empno%type := &p_empno;
    v_ename emp.ename%type;
    v_job emp.job%type;
begin 
    select ename, job into v_ename, v_job
    from emp 
    where empno = v_empno;
    
    dbms_output.put_line(v_ename||'�� ������'||v_job||' �Դϴ�.');
    
    exception 
        when too_many_rows then 
        dbms_output.put_line('�ش� ��� �̸��� ���� �� �ֽ��ϴ�. �����ͷ� �����ϼ���.');
end;
/