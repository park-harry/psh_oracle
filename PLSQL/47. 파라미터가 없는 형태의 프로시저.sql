- 입력 파라미터가 없는 프로시저 문법
create  [ or replace ] procedure [ 프로시저 이름 ]
is | as
		[ 선언부 ]
begin
		[ 실행부 ]
		exception
		[ 예외 처리부 ]
end [ 프로시저 이름 ];


- 파라미터가 없는 프로시저 생성 예제
1. demo.sql 을 수행해서 emp 와 dept 테이블을 초기화 시킨다.
@demo 

2. emp 테이블에 grade 컬럼을 추가하고 이름, 월급, grade를 조회한다. 

alter table emp 
add grade varchar2(10);

select ename, sal, grade
from emp;

프로시저 사용하지 않은 익명 PL/SQL 블럭 코드
3. emp 테이블에 grade 라는 컬럼에 다음의 조건에 해당되는 데이터로 값을 갱신하시오.

	월급이 3000 이상이면 A 등급
	월급이 2000 이상이면 B 등급
	월급이 1000 이상이면 C 등급
	나머지 월급은 D 등급으로  갱신
	단, 월급이 없는 사원들은 등급은  null 로 갱신되어야 한다.

declare
    cursor    emp_cursor    is
    select    empno, ename, sal
    from  emp
    for  update;
        emp_record    emp_cursor%rowtype;
        v_grade       varchar2(5);
begin
    open   emp_cursor  ;
        loop
        fetch    emp_cursor    into   emp_record;
        exit   when   emp_cursor%notfound;
                    if   emp_record.sal >= 3000  then
                          v_grade  := 'A';
                   elsif    emp_record.sal >= 2000  then
                         v_grade := 'B';
                   elsif     emp_record.sal >=1000   then
                         v_grade := 'C' ;
                    else
                         v_grade  := 'D';
                   end  if;
                   update   emp
                    set   grade = v_grade
                    where   current  of   emp_cursor;
        end  loop;
        commit;
    close   emp_cursor;
end;
/

4. grade 컬럼을 null 값으로 변경한다.
update  emp
set  grade = null;
commit;

5. 프로시저 생성 코드
exec pro2;


문제 1. grade 컬럼을 null 값으로 변경합니다.
update emp 
set grade = null;

문제 2. SMITH 의 월급을 null 값으로 변경합니다.
update emp 
set sal = null
where ename = 'SMITH';
commit;

문제 3. SMITH 처럼 월급이 NULL 값인 사원들의 GRADE 는 갱신되지 않도록 프로시저를 수정하시오. 
create or replace procedure  pro2
is
    cursor    emp_cursor    is
    select    empno, ename, sal
    from  emp
    where sal is not null
    for  update;
        emp_record    emp_cursor%rowtype;
        v_grade       varchar2(5);
begin
    open   emp_cursor  ;
        loop
        fetch    emp_cursor    into   emp_record;
        exit   when   emp_cursor%notfound;
                    if   emp_record.sal >= 3000  then
                          v_grade  := 'A';
                   elsif    emp_record.sal >= 2000  then
                         v_grade := 'B';
                   elsif     emp_record.sal >=1000   then
                         v_grade := 'C' ;
                    else
                         v_grade  := 'D';
                   end  if;
                   update   emp
                    set   grade = v_grade
                    where   current  of   emp_cursor;
        end  loop;
        commit;
    close   emp_cursor;
end;
/

exec pro2;