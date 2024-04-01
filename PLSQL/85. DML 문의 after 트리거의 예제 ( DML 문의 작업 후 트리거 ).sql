�� after trigger�� DML �۾��� ������ �Ŀ� �۵��Ǵ� trigger ��. 

���� 1. ��� ���̺��� ������ �����ϸ� ���ŵǱ� �� ���ް� ���ŵ� ���� ������ �Ʒ��� ���̺� 
�Էµǰ� �Ͻÿ�.
CREATE OR REPLACE TRIGGER emp_update
    AFTER UPDATE OF sal ON emp
    FOR EACH ROW
BEGIN
    INSERT INTO audit_emp
    VALUES ( :OLD.ename, :OLD.sal, :NEW.sal, SYSDATE );
END;
/

UPDATE emp
SET sal = sal*2
WHERE ename = 'SCOTT';

=> Ʈ���Ű� �߻��Ǿ� audit_emp ���̺� ������Ʈ ������ �ݿ���.
	 ��, audit_emp ���̺� �����Ͱ� ���Ե�

SELECT *
FROM emp
WHERE ename = 'SCOTT';

SELECT *
FROM audit_emp;

����1. �츮�� ���̺�(emp18)�� ���̸� ������ ��, �Ʒ��� ���̺� �̸��� ����� ���̿� ������ ���̸�
�Է��ϴ� Ʈ���Ÿ� �����Ͻÿ� !
CREATE TABLE change_age
(
ename   VARCHAR2(10),
OLD_AGE NUMBER(10),
NEW_AGE NUMBER(10)
);

CREATE OR REPLACE TRIGGER tg246
    AFTER UPDATE OF age ON emp18
    FOR EACH ROW
BEGIN
    INSERT INTO change_age
    VALUES ( :OLD.ename, :OLD.age, :NEW.age );
END;
/

UPDATE emp18
SET age = 100
WHERE ename = '�ڼ�ȯ';

select * from change_age;
=> Ʈ���Ű� ����Ǿ�, change_age ���̺� �����Ͱ� ���Ե� ���� Ȯ���� �� ����.

����2. �Ʒ��� ���̺��� �����ϰ� emp ���̺��� �����ϴ� �۾��� �ϸ� ������ data �߿� empno, ename,
sal �� �Ʒ��� ���̺� �Էµǰ� �ϴ� Ʈ���Ÿ� �����Ͻÿ� 
CREATE TABLE emp_delete_audit
(
empno   NUMBER(10),
ename   VARCHAR2(10),
sal     NUMBER(10)
);

CREATE OR REPLACE TRIGGER after_delete_emp
    AFTER DELETE ON emp
    FOR EACH ROW
BEGIN
    INSERT INTO emp_delete_audit
    VALUES ( :OLD.empno, :OLD.ename, :OLD.sal );
end;
/

- Ʈ���� ���� Ȯ���ϱ�
delete from emp 
where empno = 7788;

SELECT * FROM emp WHERE empno = 7788;

SELECT * FROM emp_delete_audit;
=> �����Ͱ� �������� Ȯ�ε�.

����3. dept ���̺�� �Ȱ��� ���̺��� �����Ͻÿ� ! ( ���̺���� detp900 )
CREATE TABLE dept900
AS
SELECT *
FROM dept;

SELECT *
FROM dept900;

����4. dept ���̺��� data �� ����� dept900 ���̺� ���� data �� ���� �������� Ʈ���Ÿ� 
�����Ͻÿ� !
create or replace trigger after_delete_dept
after delete on dept 
for each row 
begin 
    delete from dept900
    where deptno = :old.deptno or loc = :old.loc or dname = :old.dname;
end;
/
delete from dept 
where deptno = 10;

select * from dept;
select * from dept900;
=> dept900�� ���� �������� Ȯ�εǸ� ���� �۵� 

����5. ���� Ʈ���Ÿ� �����ؼ� �μ����̺� data �� �Է��ϸ� ���� dept900 ���� �Էµǰ� �Ͻÿ�!
create or replace trigger after_insert_dept
after insert on dept 
for each row 
begin 
    insert into dept900
    values(:new.deptno, :new.dname,:new.loc);
end;
/

insert into dept (deptno, dname, loc)
values(10,'ACCOUNTING', 'NEW YORK');

select * from dept;
select * from dept900;


����6. ���ݱ��� ���� Ʈ���Ÿ� ��� drop �Ͻÿ�
select 'drop trigger ' || trigger_name || ';'
from user_triggers;

drop trigger AFTER_DELETE_EMP;
drop trigger EMP_UPDATE;
drop trigger TG246;
drop trigger TG249;
drop trigger TG250;

����7. dept ���̺� insert �� delete �� �ϸ� dept900 ���̺� ���� �����Ͱ� insert �� delete
�ǰ� Ʈ���Ÿ� �����Ͻÿ�
create or replace trigger dept_dept900
after delete or insert on dept
 for each row

begin

 if deleting then
      delete from dept900
      where deptno = :OLD.deptno or
             loc    = :OLD.loc    or
          dname  = :OLD.dname;
 elsif inserting then
      insert into dept900
         values( :NEW.deptno, :NEW.dname, :NEW.loc );
end if;

end;
/

����8. dept ���̺��� 20�� �����͸� ����� dept900 ���� ���������� Ȯ���Ͻÿ�
delete from dept
where deptno= 20;

select * from dept900;

insert into dept(deptno, dname, loc)
  values(80, 'aaa', 'bbb');

select * from dept900;

���� 9. dept_dept900 Ʈ���Ÿ� �����ؼ� dept ���̺��� �����͸� update�ϸ� dept900 ���̺��� 
�����͵� update �ǰڱ� �ڵ带 �����Ͻÿ�. 
create or replace trigger dept_dept900 
after update or delete or insert on dept 
for each row 
begin
    if deleting then 
        delete from dept900 
        where deptno = :old.deptno or 
                loc = :old.loc or 
                dname = :old.dname;
    elsif inserting then 
        insert into dept900
        values (:new.deptno, :new.dname, :new.loc);
    elsif updating then 
        update dept900 
        set deptno= :new.deptno, dname = :new.dname, loc =:new.loc
        where deptno = :old.deptno or 
                loc = :old.loc or 
                dname = :old.dname;
    end if;
end;
/

���� 10. dept ���̺��� 10�� �μ���ȣ�� loc�� seoul�� �����Ͻÿ�. 
update dept 
set loc = 'SEOUL'
where deptno = 10;

select * from dept;
select * from dept900;