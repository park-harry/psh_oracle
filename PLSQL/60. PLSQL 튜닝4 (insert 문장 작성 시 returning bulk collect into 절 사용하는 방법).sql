�� returning into ���� ������� �� : �ϳ��� ���� ���� ������ �Է��� �� �ִ�.

INSERT INTO emp ( empno, ename, sal, bonus )
VALUES ( p_empno, p_ename, p_sal, p_sal * 0.2 )
RETURNING bonus INTO v_bonus;

�� returning bulk collect into ���� ������� ��: ���� ���� ���� ������ ������ ���� �� �ִ�
���� 1. emp ���̺��� ������ ��� emp_t ���̺��� �����Ѵ�.
create table emp_t 
 as 
     select * 
     from  emp 
     where 1=2;
     
���� 2. �μ���ȣ�� �Է��ؼ� ���ν����� �����ϸ� �ش� �μ���ȣ�� ��� ������� �����Ͱ� emp ���̺�
���� emp_t ���̺� �Էµǰ� ���ν����� �����Ͻÿ�. 
create or replace procedure insert_emp_t
(p_deptno   emp.deptno%type)
is 
begin 
    insert into emp_t 
    select * 
    from emp 
    where deptno = p_deptno;
end;
/
exec insert_emp_t(20);

delete from emp_t;
commit;

���� 3. insert ���� return bulk collect into ���� ����Ͽ� �Էµ� �����Ͱ� ��� ��µǰ� �Ͻÿ�.
create or replace procedure insert_emp_t
(p_deptno   emp.deptno%type)
is 
    type trd_emp is table of emp%rowtype; -- emp�� rowtype�� ��� ī���Ѵ�. 
    type tnt_emp is table of trd_emp;
    v_emp       tntemp;
begin 
    insert into emp_t 
    select * 
    from emp 
    where deptno = p_deptno
    return empno,ename,job,mgr, hiredate, sal, comm, deptno 
         bulk collect into v_emp;
end;
/

=> �Ʒ��� ���� ������ �߻��Ѵ�. 
=> insert������ returning bulk collect into�� �ȵȴ�. 