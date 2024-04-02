-문법 
1. 레코드 변수를 사용 안 했을때 코드

accept   p_deptno   prompt  '부서번호를 입력하시오 ~ '
declare
    cursor   emp_cursor     is  -- 커서 선언
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;

    v_ename        emp.ename%type;
    v_sal               emp.sal%type;
    v_job             emp.job%type;
    v_deptno       emp.deptno%type;

2.  레코드 변수를 사용했을때의 코드:

accept   p_deptno   prompt  '부서번호를 입력하시오 ~ '
declare
    cursor   emp_cursor     is  -- 커서 선언
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;
    
    emp_record     emp_cursor%rowtype;

전체 코드 
accept   p_deptno   prompt  '부서번호를 입력하시오 ~ '
declare
    cursor   emp_cursor     is  -- 커서 선언
    select    ename, sal, job, deptno
    from   emp
    where    deptno  =  &p_deptno ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- 커서 열기
        loop
            fetch   emp_cursor   into  emp_record;   -- 커서 패치
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(emp_record.ename||chr(9)||emp_record.sal||chr(9)||
                            emp_record.job||chr(9)||emp_record.deptno);        
        end  loop;
    close   emp_cursor;
end;
/    


문제 1. 입사한 년도를 물어보게하고 입사한 년도를 입력하면 해당 입사한 년도에 입사한 사원들의
이름과 월급과 입사일이 출력되는 PL/SQL  코드를 레코드 변수를 이용한 커서루프문으로
작성하시오.

accept   p_hireyear   prompt  '입사한 년도를 입력하시오 ~ '
declare
    cursor   emp_cursor     is  -- 커서 선언
    select    ename, sal, hiredate
    from   emp
    where    to_char(hiredate,'RRRR')  = '&p_hireyear' ;
    
    emp_record     emp_cursor%rowtype;
begin
    open    emp_cursor;  -- 커서 열기
        loop
            fetch   emp_cursor   into  emp_record;   -- 커서 패치
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(emp_record.ename||chr(9)||emp_record.sal||chr(9)||
                            emp_record.hiredate);      
        end  loop;
    close   emp_cursor;
end;
/