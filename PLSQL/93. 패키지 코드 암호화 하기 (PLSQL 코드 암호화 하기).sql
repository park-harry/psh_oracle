PL/SQL �ڵ带 ��ȣȭ �ϸ� ���� ��
=> ���� ���� �ڵ带 ���ȭ �� �� �ִ�.

1. �Ʒ��� ��Ű���� �����ϰ� �� �۵��Ǵ��� Ȯ���Ͻÿ�. 
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

- ��Ű�� ���� Ȯ��
SELECT ename, sal, pcg_rank.fun179(ename) �ҵ�
FROM emp;

2. �޸����� ��� ��Ű�� �� �κ��� �ۼ��� �� pack01.sql �̶� �̸����� �����Ѵ�.
ed pack01.sql 

3. �޸����� ��� ��Ű�� ������ �ۼ��ϰ� pack01_body.sql�̶� �̸����� �����Ѵ�. (sqpplus)
ed pack01_body.sql

4. ���� ������ sqlplus ������Ʈ â���� exit ��ɾ �����ϰ� ���� ���ͼ� ���� �ۼ��� 2���� 
sql ������ �� �ִ��� Ȯ���Ѵ�. 
exit; 
dir 

5. ��� ������Ʈ â���� �Ʒ��� ��ɾ �����Ѵ�. (���� ���� �ѱ��� ����� �Ѵ�.) 
wrap iname=pack01_body.sql oname=pack01.plb

=> iname -> input name, oname -> output name  
=> ���� ��, pack01.plb ������ ��� ������ ��ȣȭ �������� ����! 

�� ������ ���� �ڵ带 ���� �� ���� ������ ���� 2������ �����ϸ� �ȴ�. 
1. ���ڵ�� ��ȣȭ�� body �ڵ� 
2. ��Ű�� �� �ڵ� 
CREATE OR REPLACE PACKAGE pcg_rank
AS FUNCTION fun179(p_ename emp.ename%TYPE) RETURN VARCHAR2;
END pcg_rank;
/

- ��Ű�� ��ȣȭ�� �ٵ� �ڵ� 
CREATE OR REPLACE PACKAGE BODY pcg_rank wrapped 
a000000
34e
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
1bc 189
fqSwszdYDr+Xy8ce6oQVp9GnLl4wg3nM2dxqfC9dbmS0mSdmqDaU5zV9r1LfKA2TuvZJFrDn
XE07qW9S7v5Sihpb24efDYIccrSjhQ0W82WN/qUNVbKaZMb+WgQWo/FhKyHLxCjQLx77oSHn
tH32JEyDhwvTf4OnvXuvwtM0Xye2NwpIcDX2picTdK28riXeVXXAirYAhxlXFGrCG9D9aA6g
3bkRLisuZRzFVCovcnQg7p7AFNZBtkkOe5HGaW6YQYFw29TzX0aRjtJmx0J/H0TTnT8myH8R
FZ6jO5BDPqWRNNGLWnK4W2Hmex4CWa7VVIoomAB2SgXrwQVmdmrwr6rjLLBPJHqXVZQ4QQ/1
kbCz40Yk5wOnY/73h+ThWmonEA==
/

- ��Ű�� ���� Ȯ��
SELECT ename, sal, pcg_rank.fun179(ename) �ҵ�
FROM emp;