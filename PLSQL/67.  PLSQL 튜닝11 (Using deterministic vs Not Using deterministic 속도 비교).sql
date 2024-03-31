- deterministic 은 '결정적인' 이라는 한글 뜻이다. 어떤 입력이 들어와도 언제나 똑같은 과정을 
	거쳐서 똑같은 결과를 내놓는다면 입력되는 값의 결과는 이미 결정되어 있다는 것이다.
- PL/SQL 사용자 정의 함수의 성능을 높이기 위해서 deterministic 절을 사용할 수 있는데,
  deterministic 절을 함수에서 사용하면 함수를 반복적으로 호출하는 대신 이전에 계산된 결과를 
  사용하도록 할 수 있다.
  
  
실습 1.어떤 값을 입력받아서 그 값이 숫자면 Y를 리턴하고 숫자가 아니면 N을 리턴하는 함수를 
생성하시오.
create or replace function is_number
    (p_value in varchar2)
    return char
is
    p_num number(10);
begin
    p_num := to_number(p_value);
    return 'Y';
    exception
	    when value_error then
	    return 'N';
end;
/

실습 2. 
alter  table  emp
add  mgr2   varchar2(10);

update  emp
set  mgr2 = mgr;

select  ename, mgr, mgr2 from emp;

update emp
set  mgr2='A999'
where ename='KING';

commit;

실습 3. 함수를 사용하여 emp 테이블의 데이터를 select 한다.
col isnumber for a10 
select empno, ename, mgr2, is_number(mgr2) as isnumber
from  emp;

=> column의 길이를 a10으로 지정 
=> deterministic 절을 이용해서 수행하면 7839 와 같이 반복되는 번호는 함수를 실행하지 않고 바로 
	결과값을 출력할 수 있다. (함수를 실행하지 않고 결과를 출력하기 때문에 속도가 더 빨라짐.)
    
실습4. deterministic 절 없이 함수를 다음과 같이 수정한다. 
set serveroutput on 
create or replace function is_number
    (p_value in varchar2)
    return char
    is
        p_num number;
begin
    dbms_output.put_line('is_number ('||p_value||') called');
    p_num := to_number(p_value);
    return 'Y';
    exception
        when value_error then
        return 'N';
end;
/

실습 5. 함수를 사용하여 emp 테이블의 데이터를 select 한다
select empno, ename,  mgr2, is_number(mgr2) as isnumber
from  emp;

실습6. deterministic 옵션을 주고 함수를 생성한다.
set serveroutput on 
create or replace function is_number
    (p_value in varchar2)
    return char
    deterministic
    is
        p_num number;
begin
    dbms_output.put_line('is_number ('||p_value||') called');
    p_num := to_number(p_value);
    return 'Y';
    exception
        when value_error then
        return 'N';
end;
/

select empno, ename, mgr2, is_number(mgr2) as isnumber
from  emp;

실습 7. 함수를 사용하여 emp 테이블의 데이터를 select 한다
set serveroutput on
select empno, ename,  mgr2, is_number(mgr2) as isnumber
from  emp;

문제 1. 부서번호를 입력하면 해당 부서번호의 토탈월급이 출력되는 fun51 함수에 deterministic 
옵션을 주고 함수를 생성 하고 작동되는지 테스트 하시오 !
CREATE OR REPLACE FUNCTION fun51
( p_deptno emp.deptno%TYPE )
RETURN NUMBER
deterministic
AS
v_sum NUMBER(10);

BEGIN
    dbms_output.put_line('is_number ('||p_deptno||') called');
    SELECT SUM(sal) INTO v_sum
    FROM emp
    WHERE deptno = p_deptno;
    
    RETURN v_sum;
END;
/

CREATE OR REPLACE FUNCTION fun51
( p_deptno emp.deptno%TYPE )
RETURN NUMBER
deterministic
AS
v_sum NUMBER(10);

BEGIN
    dbms_output.put_line('is_number ('||p_deptno||') called');
    SELECT SUM(sal) INTO v_sum
    FROM emp
    WHERE deptno = p_deptno;
    
    RETURN v_sum;
END;
/

select ename, sal deptno, fun51(deptno)
from emp;

문제 2. emp 테이블의 직업을 입력하면 해당 직업의 토탈 월급이 출력되는 함수를 fun_job으로 
생성하는데 한번 호출된 데이터는 다시 실행되지 않게 함수를 생성하고 사용하시오. 
create or replace function fun_job 
(p_job emp.job%type)
return number
deterministic 
as 
    v_sumsal number(10);
begin
    dbms_output.put_line('job ('||p_job||') called');
    select sum(sal) into v_sumsal 
    from emp 
    where job = p_job;
    
    return v_sumsal;
end;
/

select job, fun_job(job) 
from emp;