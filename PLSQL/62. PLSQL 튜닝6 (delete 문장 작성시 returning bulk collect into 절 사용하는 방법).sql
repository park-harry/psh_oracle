문제 1. returning 절을 사용하여 다음과 같이 삭제할 부서번호를 입력하여 프로시져를 수행하면 다음과
같이 지워진 부서번호의 사원의 사원이름과 부서번호를 출력되게 하시오.
create or replace procedure delete_deptno
(p_deptno   emp.deptno%type)
is 
    type trd_emp is record(ename emp.ename %type, 
                            deptno emp.deptno%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
begin 
    delete from emp
    where deptno = p_deptno
    returning ename,deptno bulk collect into v_emp ;
    
    for i in 1..v_emp.count loop
        dbms_output.put_line(v_emp(i).ename||chr(9)||v_emp(i).deptno);
    end loop;
end;
/
exec delete_deptno(10);

문제 2. 직업을 입력하면 해당 직업인 사원들이 emp 테이블에서 삭제되는 프로시져를 생성하는데
프로시져를 실행하면 삭제되는 직업의 사원들의 이름과 직업이 출력되게 하시오.
create or replace procedure delete_job
(p_job   emp.job%type)
is 
    type trd_emp is record(ename emp.ename %type, 
                            job emp.job%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;
begin 
    delete from emp
    where job = p_job
    returning ename,job bulk collect into v_emp ;
    
    for i in 1..v_emp.count loop
        dbms_output.put_line(v_emp(i).ename||chr(9)||v_emp(i).job);
    end loop;
end;
/
exec delete_job('SALESMAN');