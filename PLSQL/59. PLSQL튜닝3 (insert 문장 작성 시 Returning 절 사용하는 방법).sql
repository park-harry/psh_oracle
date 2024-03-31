���� 1. ��� ���̺� bonus �÷��� number(10,2) �� �ؼ� �߰��Ͻÿ� !
ALTER TABLE emp
ADD bonus number(10,2);

���� 2. �����ȣ, �̸�, ������ �Է��ؼ� ���ν����� �����ϸ� ��� ���̺� �ش� ����� �����ȣ,
 �̸�, ����, ���ʽ��� �Էµǰ� �ϴ� ���ν����� ����µ�, ���ʽ��� �Է��ϴ� ������ 20%�� �Էµǰ�
 �Ͻÿ�! 
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )
  -- IN (input�� ����) �Է� �Ű������� ��Ÿ���� Ű���� 
  -- out - ��� �Ű����� 
  -- default ���� in (in �� ��������) 
IS
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 );
END;
/

execute pro1(8899, 'JANE', 3000);

SELECT ename, sal, bonus
FROM emp;

���� 1. ���� ���ν����� �����ؼ� ���ν����� �����ϰ� ���� �ٷ� �Է��� ����� �̸��� ���ʽ��� 
��µǰ� �Ͻÿ�.
- returning ���� ��� ������ ��:
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )

IS
    v_bonus emp.bonus%type;
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 );
    
    select bonus into v_bonus 
    from emp 
    where empno = p_empno;
    dbms_output.put_line('�Է��� ��� '||p_ename||
                        '�� ���ʽ��� '||v_bonus||' �Դϴ�');
END;
/
set serveroutput on
execute pro1(8899, 'JANE', 3000);

-- returning ���� ��� ���� ��:
CREATE OR REPLACE PROCEDURE pro1
( p_empno   IN emp.empno%TYPE, 
  p_ename   IN emp.ename%TYPE,
  p_sal     IN emp.sal%TYPE )

IS
    v_bonus emp.bonus%type;
BEGIN
    INSERT INTO emp ( empno, ename, sal, bonus )
    VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 )
    returning bonus into v_bonus;

    dbms_output.put_line('�Է��� ��� '||p_ename||
                        '�� ���ʽ��� '||v_bonus||' �Դϴ�');
END;
/
set serveroutput on
execute pro1(5555, 'JANE', 3000)

���� 2. �μ�(dept) ���̺� �����͸� �Է��ϴ� ���ν����� �����ϴµ� ���ν����� �����ϸ� �ԷµǴ�
�����Ͱ� �ٷ� ��µǰ��Ͻÿ�.
CREATE OR REPLACE PROCEDURE pro1
( p_deptno   IN dept.deptno%TYPE, 
  p_dname   IN dept.dname%TYPE,
  p_loc     IN dept.loc%TYPE )

IS
   v_deptno     dept.deptno%type;
   v_dname      dept.dname%type;
   v_loc        dept.loc%type;
BEGIN
    INSERT INTO dept ( deptno, dname, loc)
    VALUES ( p_deptno, p_dname, p_loc )
    returning deptno, dname, loc into v_deptno, v_dname, v_loc;

    dbms_output.put_line(v_deptno||chr(9)||v_dname||chr(9)||v_loc);
END;
/
set serveroutput on
exec pro1(50,'hr','seoul');