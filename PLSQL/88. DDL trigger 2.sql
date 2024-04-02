※ 컬럼 추가나 삭제는 업무 시간에 수행하면 안된다. 업무 외 시간에 해야 한다. 업무 시간에 하게 되면
	 컬럼 추가나 삭제로 인해서 영향을 받는 테이블을 액세스 하는 쿼리가 느려지기 때문이다.
		select 'drop trigger ' || object_name || ';'
		from user_procedures
		where object_type = 'TRIGGER';

예제 1. 기존에 만든 trigger를 모두 삭제하시오.
select 'drop trigger ' || object_name || ';'
from user_procedures
where object_type = 'TRIGGER'; 
=> trigger 이름에 bin$ 가 있다면 양 옆에 double quotation mark를 달아주고 삭제 실행 

예제2. 사원 테이블에 email 컬럼을 추가하시오 !
alter table emp 
add email varchar2(200);

예제3. 사원 테이블에 email 컬럼을 삭제하시오 !
ALTER TABLE emp
DROP COLUMN email ;

예제4. 사원 테이블에 컬럼 추가, 삭제를 업무시간에 하지 못하도록 트리거를 생성하시오.
(업무시간 : 9:00 ~ 18:00 )
CREATE OR REPLACE TRIGGER tg270
BEFORE ALTER ON c##SCOTT.SCHEMA

BEGIN
    IF ( TO_CHAR( SYSDATE, 'HH24:MI' ) BETWEEN '09:00' AND '18:00' ) THEN
        RAISE_APPLICATION_ERROR( -20002, '업무시간에 테이블 변경을 하지 마세요~' );
    END IF;
END;
/

ALTER TABLE emp
ADD email VARCHAR2(200);

- 사원 테이블의 월급 컬럼을 drop 하시오. 
alter table emp 
drop column sal;
=> 안되는게 정상 


문제 1. emp 테이블과 똑같은 테이블인 emp_backup 테이블을 생성하고 emp 테이블에 데이터가 입력, 
수정, 삭제 될 때 마다emp_backup 테이블에도 똑같이 데이터가 입력, 수정, 삭제 되게 하시오.
아래의 트리거 스크립트를 참고하세요.
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

- 답: 
- emp_backup 테이블을 생성
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

- 예시 
insert into emp(empno, ename, sal, deptno)
values(9999,'HARRY',9000, 50);

update emp 
set job = 'DBA'
where ename = 'HARRY';

select * from emp_backup;