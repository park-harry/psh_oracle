기존 커서문
1.커서 선언 
2. 커서 오픈 
3. 커서 패치 
4. 커서 닫기

레코드를 사용한 커서 for loop문 
1. 커서 선언
- 서브 쿼리를 사용하는 커서 for 루프문 : x

※ 점점 코드가 간결하고 단순화 되고 있다. (여러 개의 행을 출력할 때는 커서가 필요하다)


예제 1. 부서번호를  물어보게하고 부서번호를 입력하면 해당 부서번호인 사원들의 이름과 월급과 부서번호가 
출력되게 커서 for loop문을 작성하시오.
set serveroutput on 
set verify off 
accept p_deptno prompt '부서번호를 입력하시오. '
begin 
    for emp_record in (select ename, sal, deptno 
                        from emp
                        where deptno = &p_deptno) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.deptno);
    end loop;
end;
/

문제 1. 예제의 PL/SQL을 프로시져로 생성하여 다음과 같이 수행되게하시오
	 exec pro_deptno(10);

set serveroutput on 
create or replace procedure pro_deptno
(p_deptno emp.deptno%type)
is 
begin 
    for emp_record in (select ename, sal, deptno 
                        from emp
                        where deptno = p_deptno) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.deptno);
    end loop;
end;
/

exec pro_deptno(10);

문제 2. 아래와 같이 직업을 입력해서 프로시져를 실행하면 해당 직업인 사원들의 이름, 월급, 직업이 출력
되게 프로시저를 생성하시오. 

exec pro_job('SALESMAN')*/
set serveroutput on 
create or replace procedure pro_job
(p_job emp.job%type)
is 
begin 
    for emp_record in (select ename, sal, job 
                        from emp
                        where job = p_job) loop
            dbms_output.put_line(emp_record.ename||chr(9)||
                                emp_record.sal||chr(9)||
                                emp_record.job);
    end loop;
end;
/

exec pro_job('SALESMAN');