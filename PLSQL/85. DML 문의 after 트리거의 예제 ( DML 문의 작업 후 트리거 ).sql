※ after trigger는 DML 작업이 성공한 후에 작동되는 trigger 다. 

예제 1. 사원 테이블의 월급을 갱신하면 갱신되기 전 월급과 갱신된 후의 월급이 아래의 테이블에 
입력되게 하시오.
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

=> 트리거가 발생되어 audit_emp 테이블에 업데이트 내용이 반영됨.
	 즉, audit_emp 테이블에 데이터가 삽입됨

SELECT *
FROM emp
WHERE ename = 'SCOTT';

SELECT *
FROM audit_emp;

문제1. 우리반 테이블(emp18)의 나이를 변경할 때, 아래의 테이블에 이름과 변경된 나이와 변경전 나이를
입력하는 트리거를 생성하시오 !
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
WHERE ename = '박성환';

select * from change_age;
=> 트리거가 실행되어, change_age 테이블에 데이터가 삽입된 것을 확인할 수 있음.

문제2. 아래의 테이블을 생성하고 emp 테이블을 삭제하는 작업을 하면 삭제된 data 중에 empno, ename,
sal 가 아래의 테이블에 입력되게 하는 트리거를 생성하시오 
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

- 트리거 동작 확인하기
delete from emp 
where empno = 7788;

SELECT * FROM emp WHERE empno = 7788;

SELECT * FROM emp_delete_audit;
=> 데이터가 지워진것 확인됨.

문제3. dept 테이블과 똑같은 테이블을 생성하시오 ! ( 테이블명은 detp900 )
CREATE TABLE dept900
AS
SELECT *
FROM dept;

SELECT *
FROM dept900;

문제4. dept 테이블의 data 를 지우면 dept900 테이블에 같은 data 가 같이 지워지게 트리거를 
생성하시오 !
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
=> dept900도 같이 지워진거 확인되면 정상 작동 

문제5. 위의 트리거를 수정해서 부서테이블에 data 를 입력하면 같은 dept900 에도 입력되게 하시오!
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


문제6. 지금까지 만든 트리거를 모두 drop 하시오
select 'drop trigger ' || trigger_name || ';'
from user_triggers;

drop trigger AFTER_DELETE_EMP;
drop trigger EMP_UPDATE;
drop trigger TG246;
drop trigger TG249;
drop trigger TG250;

문제7. dept 테이블에 insert 와 delete 를 하면 dept900 테이블에 같은 데이터가 insert 와 delete
되게 트리거를 생성하시오
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

문제8. dept 테이블의 20번 데이터를 지우면 dept900 에도 지워지는지 확인하시오
delete from dept
where deptno= 20;

select * from dept900;

insert into dept(deptno, dname, loc)
  values(80, 'aaa', 'bbb');

select * from dept900;

문제 9. dept_dept900 트리거를 수정해서 dept 테이블의 데이터를 update하면 dept900 테이블의 
데이터도 update 되겠금 코드를 수정하시오. 
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

문제 10. dept 테이블의 10번 부선번호의 loc를 seoul로 변경하시오. 
update dept 
set loc = 'SEOUL'
where deptno = 10;

select * from dept;
select * from dept900;