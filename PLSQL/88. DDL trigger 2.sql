�� �÷� �߰��� ������ ���� �ð��� �����ϸ� �ȵȴ�. ���� �� �ð��� �ؾ� �Ѵ�. ���� �ð��� �ϰ� �Ǹ�
	 �÷� �߰��� ������ ���ؼ� ������ �޴� ���̺��� �׼��� �ϴ� ������ �������� �����̴�.
		select 'drop trigger ' || object_name || ';'
		from user_procedures
		where object_type = 'TRIGGER';

���� 1. ������ ���� trigger�� ��� �����Ͻÿ�.
select 'drop trigger ' || object_name || ';'
from user_procedures
where object_type = 'TRIGGER'; 
=> trigger �̸��� bin$ �� �ִٸ� �� ���� double quotation mark�� �޾��ְ� ���� ���� 

����2. ��� ���̺� email �÷��� �߰��Ͻÿ� !
alter table emp 
add email varchar2(200);

����3. ��� ���̺� email �÷��� �����Ͻÿ� !
ALTER TABLE emp
DROP COLUMN email ;

����4. ��� ���̺� �÷� �߰�, ������ �����ð��� ���� ���ϵ��� Ʈ���Ÿ� �����Ͻÿ�.
(�����ð� : 9:00 ~ 18:00 )
CREATE OR REPLACE TRIGGER tg270
BEFORE ALTER ON c##SCOTT.SCHEMA

BEGIN
    IF ( TO_CHAR( SYSDATE, 'HH24:MI' ) BETWEEN '09:00' AND '18:00' ) THEN
        RAISE_APPLICATION_ERROR( -20002, '�����ð��� ���̺� ������ ���� ������~' );
    END IF;
END;
/

ALTER TABLE emp
ADD email VARCHAR2(200);

- ��� ���̺��� ���� �÷��� drop �Ͻÿ�. 
alter table emp 
drop column sal;
=> �ȵǴ°� ���� 


���� 1. emp ���̺�� �Ȱ��� ���̺��� emp_backup ���̺��� �����ϰ� emp ���̺� �����Ͱ� �Է�, 
����, ���� �� �� ����emp_backup ���̺��� �Ȱ��� �����Ͱ� �Է�, ����, ���� �ǰ� �Ͻÿ�.
�Ʒ��� Ʈ���� ��ũ��Ʈ�� �����ϼ���.
create or replace  trigger  dept_dept900
after update or delete  or  insert   on  dept
for  each  row

 begin
        if  deleting   then
           delete  from  dept900
            where   deptno = :OLD.deptno   or
                    loc = :OLD.loc   or
                    dname = :OLD.dname;

        elsif   inserting   then 
           insert  into  dept900
              values( :NEW.deptno, :NEW.dname, :NEW.loc );

        elsif  updating  then
                update  dept900
                  set  deptno = :NEW.deptno,
                       dname = :NEW.dname,
                       loc = :NEW.loc
                 where  deptno = :OLD.deptno  or
                        dname = :OLD.dname  or
                        loc = :OLD.loc;
       
       end if;
end;
/

- ��: 
- emp_backup ���̺��� ����
create table emp_backup
as 
    select * from emp 
    where 1=2;

create or replace  trigger  emp_empbackup
after update or delete  or  insert   on  emp
for  each  row
begin
    if  deleting   then
        delete  from  emp_backup
        where   empno = :OLD.empno   or
                ename = :OLD.ename   or
                job = :OLD.job  or 
                mgr = :old.mgr or
                HIREDATE = :old.HIREDATE or
                SAL = :old.SAL or
                COMM = :old.COMM or
                DEPTNO = :old.DEPTNO or
                RNK = :old.RNK;
    elsif   inserting   then 
        insert  into  emp_backup
        values( :NEW.empno,:NEW.ename ,:NEW.job  ,
                :NEW.mgr ,:NEW.HIREDATE ,:NEW.SAL ,
              :NEW.COMM ,:NEW.DEPTNO ,:NEW.RNK );
    elsif  updating  then
        update  emp_backup
        set empno = :NEW.empno,
            ename = :NEW.ename ,
            job = :NEW.job  ,
            mgr = :NEW.mgr ,
            HIREDATE = :NEW.HIREDATE ,
            SAL = :NEW.SAL ,
            COMM = :NEW.COMM ,
            DEPTNO = :NEW.DEPTNO ,
            RNK = :NEW.RNK
    where  empno = :OLD.empno   or
            ename = :OLD.ename   or
            job = :OLD.job  or 
            mgr = :old.mgr or
            HIREDATE = :old.HIREDATE or
            SAL = :old.SAL or
            COMM = :old.COMM or
            DEPTNO = :old.DEPTNO or
            RNK = :old.RNK;  
    end if;
end;
/

- ���� 
insert into emp(empno, ename, sal, deptno)
values(9999,'HARRY',9000, 50);

update emp 
set job = 'DBA'
where ename = 'HARRY';

select * from emp_backup;