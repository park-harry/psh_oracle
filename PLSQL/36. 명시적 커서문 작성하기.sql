- 커서선언 -> 커서오픈 -> 커서패치 -> 커서 닫기
accept   p_deptno   prompt  '부서번호를 입력하시오 ~ '

- 커서 선언 
declare
		cursor   emp_cursor     is  
		select    ename, sal, job, deptno
		from   emp
		where    deptno  =  &p_deptno ;

		v_ename        emp.ename%type;
		v_sal               emp.sal%type;
		v_job             emp.job%type;
		v_deptno       emp.deptno%type;
begin
		open    emp_cursor;  -> 커서 오픈 
				loop
						fetch   emp_cursor   into   v_ename, v_sal, v_job, v_deptno;   -- 커서 패치
						exit   when     emp_cursor%notfound;
						-> emp_cursor에서 데이터가 발견되지 않을 때 나와라. (fetch 할게 없으면 종료) 
						dbms_output.put_line(v_ename||'  '||v_sal||'  '||v_job||'  '||v_deptno);						
				end  loop;
		close   emp_cursor; -> 커서 닫기 
end;
/

문제 1. 직업을 물어보게 하고 직업을 입력하면 해당 직업을 갖는 사원들의 이름과 월급과 직업이 
출력되게 PL/SQL 코드를 작성하시오.

accept   p_job   prompt  '직업을 입력하시오 ~ '

declare
    cursor   emp_cursor     is  
    select    ename, sal, job
    from   emp
    where    job  =  upper('&p_job');
    
    v_ename        emp.ename%type;
    v_sal               emp.sal%type;
    v_job             emp.job%type;
begin
    open    emp_cursor;  
        loop
            fetch   emp_cursor   into   v_ename, v_sal, v_job;  
            exit   when     emp_cursor%notfound;
            dbms_output.put_line(v_ename||chr(9)||v_sal||chr(9)||v_job);						
        end  loop;
    close   emp_cursor; 
end;
/