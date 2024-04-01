emp -> emp_test2 에 update  수행하기
문제 1. emp 테이블과 똑같은 구조를 갖는 emp_test2 테이블을 생성하시오.
그리고 emp 테이블에서 사원번호만 emp_test2 테이블에 입력하시오. 
create table emp_test2
as 
select * 
from emp 
where 1 = 2;

insert into emp_test2(empno)
select empno 
from emp;

문제 2. 사원번호를 입력받아 해당 사원번호의 데이터를 emp 테이블에서 불러와서 emp_test2 테이블에 
입력되게 PL/SQL을 작성하시오.

accept p_empno prompt '사원번호를 입력하세요 !'
declare 
    v_empno emp.empno%type:= &p_empno;
    v_emp   emp%rowtype;
begin 
    select * into v_emp
    from emp 
    where empno = v_empno;
    
    v_emp.sal := 0;
    
    update emp_test2
    set row = v_emp 
    where empno = v_empno;

		commit;
end;
/

문제 3. 먼저 salgarde 테이블의 구조를 가지고 salgrade_test 테이블을 생성하시오. 
그리고 grade 컬럼에 1~5까지 입력하시오. 

drop  table  salgrade;
create table salgrade
( grade   number(10),
losal   number(10),
hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);
commit;

create table salgrade_test
as 
    select * from salgrade 
    where 1=2;

insert into salgrade_test(grade) 
select grade 
from salgrade;

문제 4. grade 를 물어보게하고 grade 를 입력하면 해당 등급의 데이터를  salgrade 테이블에서 읽어서
salgrade_test 테이블에 갱신되게하는 PL/SQL 프로그램을 작성하시오.

accept  p_grade  prompt  '등급을 입력하세요 ~ '
declare
    v_grade     salgrade.grade%type :=  &p_grade;
    v_salgrade    salgrade%rowtype ;
begin
    select   *   into   v_salgrade
    from  salgrade
    where   grade = v_grade;
    
    update salgrade_test
    set row = v_salgrade
    where grade = v_grade;

		commit;
end;
/