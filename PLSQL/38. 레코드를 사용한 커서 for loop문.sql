기존 커서문
1.커서 선언 
2. 커서 오픈 
3. 커서 패치 
4. 커서 닫기

레코드를 사용한 커서 for loop문 
1. 커서 선언
- 기존 PL/SQL 커서문

accept   p_job   prompt  '직업을 입력하시오 ~ '
declare
    cursor   emp_cursor     is  -- 커서 선언
    select    ename, sal, job
    from   emp
    where    job  = upper('&p_job') ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- 커서 열기
        loop
            fetch   emp_cursor   into  emp_record;   -- 커서 패치
            exit   when     emp_cursor%notfound;
            dbms_output.put_line( emp_record.ename||chr(9)||  
                                  emp_record.sal||chr(9) || 
                                  emp_record.job);
        end  loop;
    close   emp_cursor;
end;
/

- 커서 for 루프문 실습 예제

set serveroutput on 
set verify  off
accept  p_job  prompt  '직업을 입력하세요 '
declare
    cursor emp_cursor is
    select ename, sal, job
    from emp
    where job= upper('&p_job');
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.job);
    end  loop;
end;
/

문제 1. 위의 코드를 프로시져로 만들어 다음과 같이 수행되게 하시오 !
create or replace procedure pro_job
(p_job emp.job%type) 
is 
    cursor emp_cursor is
    select ename, sal, job
    from emp
    where job= upper(p_job);
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.job);
    end  loop;
end;
/

exec  pro_job('SALESMAN');

문제 2. 부서번호를 입력해서 프로시져를 실행하면 해당 부서번호의 속한 사원들의 이름, 월급, 
부서번호가 출력되는 프로시져를 생성하시오. 
set serveroutput on 
create or replace procedure pro_deptno
(p_deptno emp.job%type) 
is 
    cursor emp_cursor is
    select ename, sal, deptno
    from emp
    where deptno = p_deptno;
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line( emp_record.ename||chr(9)||  
                              emp_record.sal||chr(9)|| 
                              emp_record.deptno);
    end  loop;
end;
/

exec  pro_deptno(10);