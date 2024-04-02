※ %rowtype을 이용해서  레코드 변수를 선언하면 다음의 기능을 이용할 수 있다.
1. 
select * into 레코드 변수명 
from emp where 
empno = v_empno;

2. 
update emp
set row = 레코드 변수명
where empno = v_empno;

3. 
insert   into  emp  
values  레코드 변수명;


데이터 이행
- emp -> emp_test

예제 1. emp 테이블과 똑같은 emp_test 라는 테이블로 생성하는데 데이터는 가져오지 말고 구조만 
구성하시오.
create   table   emp_test
as
select  *
from   emp
where  1= 2;

문제 1. 사원번호를 물어보게하고 사원번호를 입력하면 해당 사원의 모든 데이터가 emp_test 테이블에 
입력되는 PL/SQL 코드를 작성하시오
accept  p_empno   prompt  '사원번호를 입력하세요 ~' 
declare
    v_empno      emp.empno%type :=  &p_empno;
    v_emp          emp%rowtype;  -> emp 테이블의 컬럼의 모든 데이터 타입을 그대로 따르겠다.
begin                                    
    select   *   into   v_emp
    from   emp
    where   empno  = v_empno;
    
    v_emp.sal :=  0 ;
    insert   into    emp_test   values    v_emp;
end;
/
select * from emp_test;


문제 2. dept 테이블의 구조를 가지고 있는 dept_backup 테이블을 다음과 같이 생성하고 부서번호를 
물어보게 하고 부서번호를 입력하면 해당 부서번호의 모든 행을  dept 테이블에서 찾아서 dept_backup 
테이블에 입력되게 PL/SQL 코드를 작성하시오.

create table dept_backup
as 
    select * 
    from dept 
    where 1=2;

set serveroutput on 
accept p_deptno prompt '부서번호를 입력하시오.'
declare 
    v_deptno dept.deptno%type := &p_deptno;
    v_dept dept%rowtype;
begin 
    select * into v_dept 
    from dept 
    where deptno = v_deptno;
    
    insert into dept_backup values v_dept;
end;
/

select * from dept_backup;