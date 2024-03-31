- Ʃ���� PL/SQL :
UPDATE emp
SET sal = sal * 2
WHERE empno = v_empno;

SELECT sal INTO v_sal
FROM emp
WHERE empno = v_empno;

- Ʃ���� PL/SQL :
UPDATE emp
SET sal = sal * 2
WHERE empno = v_empno
RETURNING sal INTO v_sal;

���� 1. �����ȣ�� �Է��ϸ� �ش� ����� ������ 2��� �����ϴ� ���ν����� �����ϴµ�
���� ���� ������ �� ���� ��µǰ� �Ͻÿ�! (Returning �� Ȱ��) 
- returning �� Ȱ�� �� (Ʃ�� ��) 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno;

    select sal into v_sal 
    from emp 
    where empno = p_empno;

    DBMS_OUTPUT.PUT_LINE ('������ ������ : ' || v_sal );
end;
/
exec pro238(7788);

- returning �� Ȱ�� �� (Ʃ�� ��) 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno
    returning sal into v_sal;

    DBMS_OUTPUT.PUT_LINE ('������ ������ : ' || v_sal );
end;
/
exec pro238(7788);


���� 2. ���� ������ ���ν����� ������ �� ������ ���� ��� ���� ���ŵǾ��ٴ� �޼�����
���� ��µǰ� �ڵ带 �߰��ϼ���! 
set timing on
create or replace procedure pro238 
(p_empno emp.empno%type)
is 
    v_sal emp.sal%type;
begin
    update emp 
    set sal = sal * 2
    where empno = p_empno
    returning sal into v_sal;

    DBMS_OUTPUT.PUT_LINE ('������ ������ : ' || v_sal );
    dbms_output.put_line(SQL%rowcount||'���� ���ŵǾ����ϴ�.');
end;
/
exec pro238(7788);

���� 3. �̸��� �Է��ؼ� ���ν����� �����ϸ� �ش� ����� Ŀ�̼��� 8000���� ���ŵǴ� ���ν����� 
�����ϴµ� ������ Ŀ�̼��� ȭ�鿡 ��µǰ� �ϰ� 1���� ���� �� ���ŵǾ��ٴ� �޼����� ��µǰ� �Ͻÿ�. 
create or replace procedure update_comm
(p_ename emp.ename%type) 
is 
    v_comm emp.comm%type;
begin
    update emp 
    set comm = 8000
    where ename =upper(p_ename)
    returning comm into v_comm;
    
    dbms_output.put_line('������ Ŀ�̼���: '||v_comm);
    dbms_output.put_line(SQL%rowcount||'���� ���ŵǾ����ϴ�.');   
end;
/
exec update_comm('scott');