문제 1. emp 테이블의 데이터를 emp_test 테이블에 입력할 수 있게 emp 테이블과 똑같은 구조로 
emp_test 테이블을 생성하시오. 
drop table emp_test purge;

create table emp_test 
as 
    select * 
    from emp 
    where 0 = 1;

문제 2. forall 문을 이용해서 emp 테이블의 모든 데이터를 emp_test 테이블에 1번에 입력하는 
프로시져를 forall_emp하는 이름으로 생성하시오. 
create or replace procedure forall_emp 
is 
    type tnt_test is table of emp%rowtype;
    v_test tnt_test;
begin
    select * bulk collect into v_test 
    from emp;
    
    forall i in v_test.first .. v_test.last
        insert /*+ for_all */ into emp_test values v_test(i);
end;
/

exec forall_emp;

select * from emp_test;

문제 3. 위의 forall_emp 프로시져를 실행했을 때 그 안의 insert 문이 딱 1번만 수행되었는지 
v$sql을 조회해서 확인하시오. 
SELECT sql_id, sql_text, executions, program_line#
FROM v$sql
WHERE sql_text LIKE 'INSERT /*+ FOR_ALL */%';

문제 4. 지금 만든 프로시져를 drop하시오. 
drop procedure forall_emp;

문제 5. v$sql로 볼수 있는 메모리에 있는 내용을 모두 다 지우시오. 
alter system flush shared_pool;