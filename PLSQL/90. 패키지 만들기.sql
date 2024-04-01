���� 1. ��� ���̺� rnk(����) �÷��� �߰��Ͻÿ�
ALTER TABLE emp
ADD rnk NUMBER(10);

-- ����2. �߰��� rnk �÷��� ���� �ش� ����� ������ ������ �����Ͻÿ�.
BEGIN
    FOR emp_record IN ( 
            SELECT empno, DENSE_RANK() OVER (ORDER BY sal desc) ����
            FROM emp )
    LOOP
        UPDATE  emp
        SET   rnk = emp_record.����
        WHERE empno = emp_record.empno;
    END LOOP;
    COMMIT;
END;
/

SELECT ename, rnk
FROM emp
ORDER BY rnk;

���� 2. rnk �÷� ���� ��� NULL �� �����ϱ�.
UPDATE emp
SET rnk = NULL;

����3. ���� �ڵ带 ��Ű���� �����Ͻÿ�.
- ���κ� ����
CREATE OR REPLACE PACKAGE crank -- package ��
AS PROCEDURE crank_play;   -- procedure ��
END crank;
/

- �ٵ�κ� ����
CREATE OR REPLACE PACKAGE BODY CRANK    -- package body. ���κ��� package ��� �Ȱ��ƾ� �Ѵ�!
AS PROCEDURE crank_play    -- ���κп��� ������ procedure �̸�
IS
BEGIN
    FOR emp_record IN ( 
            SELECT empno, DENSE_RANK() OVER (ORDER BY sal desc) ����
            FROM emp )LOOP
        UPDATE  emp
        SET   rnk = emp_record.����
        WHERE empno = emp_record.empno;
    END LOOP;
    END crank_play; -- procedure �̸�
END crank;  -- package �̸�
/

- ��Ű�� ���� (EXECUTE ��Ű���̸�.���ν����̸�;)
EXECUTE crank.crank_play;

- Ȯ��
SELECT ename, rnk
FROM emp
ORDER BY rnk;

���� 1. �Ʒ��� �Լ��� ��Ű���� �ۼ��Ͻÿ�
CREATE OR REPLACE FUNCTION fun179
( p_ename emp.ename%TYPE )
RETURN VARCHAR2
AS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);
BEGIN
    SELECT ���� INTO v_rank
    FROM (SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) ����
            FROM emp )
    WHERE ename = UPPER(p_ename);
    
    IF v_rank < 4 THEN
        v_msg := '��ҵ�';
    ELSE
        v_msg := '���ҵ�';
    END IF;
    RETURN v_msg;
END;
/

- ��: 
- ���� �ۼ� 
CREATE OR REPLACE PACKAGE pcg_rank
AS FUNCTION fun179(p_ename emp.ename%TYPE) RETURN VARCHAR2;
END pcg_rank;
/
- �ٵ�� �ۼ� 
CREATE OR REPLACE PACKAGE BODY pcg_rank
AS FUNCTION fun179 (p_ename emp.ename%TYPE)
RETURN VARCHAR2
IS
    v_rank  NUMBER(5);
    v_msg   VARCHAR2(20);
BEGIN
    SELECT ���� INTO v_rank
    FROM ( SELECT ename, DENSE_RANK() OVER ( ORDER BY sal DESC ) ����
            FROM emp )
    WHERE ename = UPPER(p_ename);
    IF v_rank < 4 THEN
        v_msg := '��ҵ�';
    ELSE
        v_msg := '���ҵ�';
    END IF;
    RETURN v_msg;
END fun179;
END pcg_rank;
/

SELECT ename, sal, pcg_rank.fun179(ename) �ҵ�
FROM emp;

���� 2. pcg_rank.fun179(ename) �� ����ؼ� �ҵ��� ��ҵ��� ����� �̸��� ���ް� �ҵ� ���θ� 
����Ͻÿ�
select ename, sal, pcg_rank.fun179(ename)
from emp
where pcg_rank.fun179(ename) = '��ҵ�';


���� 3. �Ʒ��� �Լ��� ��Ű���� �����ؼ� �Ʒ��� ���� ����ǰ� �Ͻÿ�. 
create or replace package emp18_package
as function domain(p_ename emp18.ename%type) 
    return varchar2;
end emp18_package;
/

create or replace package body emp18_package 
as function domain(p_ename emp18.ename%type) return varchar2
is
    v_domain varchar2(50);
BEGIN
    select ������ into v_domain 
    from (select ename, substr(email, 
            instr(email,'@')+1, instr(email,'.')-instr(email,'@')-1) as ������
            from emp18) 
    where ename = p_ename;
    
    return v_domain;
    end domain;
end emp18_package;
/

select ename, email, emp18_package.domain(ename) 
from emp18;