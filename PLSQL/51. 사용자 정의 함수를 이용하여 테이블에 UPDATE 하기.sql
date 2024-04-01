사용자 정의 함수를 이용하여 테이블에 UPDATE 하기 생성 예제:
1. 먼저 demo.sql 을 수행한다. 
@demo 

2. 부서번호, 부서번호별 토탈월급을 출력하시오.
select deptno, sum(sal)
from emp
group  by deptno;

3. 이름과 월급과 부서번호, 자기가 속한 부서번호의 토탈월급이 출력되게하시오 !
create or replace function fun51
(p_deptno emp.deptno%type) 
return number 
as 
    v_sum number(10);
begin
    select sum(sal) into v_sum 
    from emp 
    where deptno = p_deptno;
    
    return v_sum;
end;
/
SELECT ename, sal, deptno, fun51(deptno)
FROM emp;

4. 부서테이블에 sumsal 컬럼을 숫자형으로 추가하시오 !
alter table dept 
add sumsal number(10);

5. 방금 추가한 sumsal 컬럼에 해당 부서번호의 토탈월급으로 값을 갱신하시오 !
update dept 
set sumsal = fun51(deptno);
commit;

select * from dept;


문제 1.
1-1. 부서테이블에 cnt 라는 컬럼을 아래와 같이 추가하시오.
alter table dept 
add cnt number(10);

1-2. CNT 컬럼의 data 를 해당 부서번호의 인원수로 갱신하는 함수를 생성하시오
create or replace function pro_cnt
(p_deptno dept.deptno%type) 
return number 
as 
    v_cnt number(10);
begin 
    select count(deptno) into v_cnt 
    from emp 
    where deptno = p_deptno;
    
    return v_cnt;
end;
/

update dept 
set cnt = pro_cnt(deptno);
commit;

select * from dept;


문제 2. 아래와 같이 컬럼을 추가하고 그 컬럼에 해당 사원이 입사한 요일로 값을 갱신하는 프로시져를 
실행하는데 프로시져가 실행될 때 update 되는 그 값이 출력되게 하시오 !
alter table emp 
add hire_day varchar2(20);

create or replace procedure pro_day
(p_ename  emp.ename%type)
as 
    v_hireday emp.hire_day%type;
begin 
    update emp 
    set hire_day = to_char(hiredate,'day')
    where ename = p_ename
    returning hire_day into v_hireday;
    
    dbms_output.put_line(p_ename||'의 입사한 요일이 '||v_hireday||'로 갱신되었습니다.');
end;
/

set serveroutput on 
exec  pro_day('SCOTT');

select ename, hire_day from emp;