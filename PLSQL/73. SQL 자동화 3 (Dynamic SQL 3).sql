입력되는 값에 따라 PL/SQL 내에서 수행되어지는  SQL이 달라지는 예제

Dynamic SQL 이란 이름 그대로 동적으로 변할 수 있는 SQL이다. 
반대의 경우는 Static SQL 이 있는데 Static SQL은 정적 SQL로 변하지 않는 SQL 이다.
	1. Dynamic SQL : PL/SQL 내의 실행절에서 동적으로 변경 될 수 있는 SQL
	2. Static SQL : PL/SQL 내의 실행절에서 동적으로 변경 될 수 없는 정해진 SQL

예제: 프로시져에 입력되는 값에 따라 아래의 첫번째 SQL이 실행될 수 도 있고 두번째 SQL이 실행될 수도 
있다.
select  sal + comm   into  v_sal
from  emp
where  job='SALESMAN';

select  sal + sal*0.2   into  v_sal
from  emp
where  job='ANALYST';

execute immediate 절을 사용 했을 때

CREATE OR REPLACE PROCEDURE find_sal
(p_job   emp.job%TYPE)
IS
    type trd_emp  is  record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;   
    v_stmt VARCHAR2(200);

BEGIN
    IF p_job = 'SALESMAN' THEN
        v_stmt := 'SELECT ename, sal + comm FROM emp WHERE job = :j';
    ELSIF p_job = 'ANALYST' THEN
        v_stmt := 'SELECT ename, sal + sal*0.2 FROM emp WHERE job = :j';
    ELSE
        v_stmt := 'SELECT ename, sal FROM emp WHERE job = :j';
    END IF;
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_job;
    
    FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).ename ||chr(9) || v_emp(i).sal );
    END LOOP;

END;
/

exec find_sal('SALESMAN');

문제 1. 위의 스크립트를 이용해서 부서번호를 이용해서 프로시져를 실행하면 해당 부서번호인 사원들의 
이름과 월급이 출력되게 하시오. 
- 부서번호 30: sal + comm, 10: sal + 1000, 나머지: sal 

CREATE OR REPLACE PROCEDURE find_sal
(p_deptno   emp.job%TYPE)
IS
    type trd_emp  is  record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp  is table of trd_emp;
    v_emp   tnt_emp;   
    v_stmt VARCHAR2(200);

BEGIN
    IF p_deptno = 30 THEN
        v_stmt := 'SELECT ename, sal + nvl(comm,0) FROM emp WHERE deptno = :j';
    ELSIF p_deptno = 10 THEN
        v_stmt := 'SELECT ename, sal + 1000 FROM emp WHERE deptno = :j';
    ELSE
        v_stmt := 'SELECT ename, sal FROM emp WHERE deptno = :j';
    END IF;
    
    EXECUTE IMMEDIATE v_stmt BULK COLLECT INTO v_emp USING p_deptno;
    
    FOR  i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line (v_emp(i).ename ||chr(9) || v_emp(i).sal );
    END LOOP;

END;
/

exec find_sal(30);

execute immediate 절을 사용 안했을 때

CREATE OR REPLACE PROCEDURE find_sal
(p_job IN emp.job%TYPE)
IS
    type trd_emp is record(ename emp.ename%type, sal emp.sal%type);
    type tnt_emp is table of trd_emp;
    v_emp tnt_emp;

BEGIN
    select ename, 
       CASE WHEN job = 'SALESMAN' THEN sal + comm
            WHEN job = 'ANALYST' THEN sal + sal * 0.2
        ELSE sal END bulk collect into v_emp
    from emp
    where job = p_job;
    
    FOR i IN 1 .. v_emp.COUNT LOOP
        DBMS_OUTPUT.put_line(v_emp(i).ename || CHR(9) || v_emp(i).sal);
    END LOOP;
END;
/

exec find_ename(10);

=> find_sal 프로시저의 경우 CASE 문을 사용하여 여러 조건에 따라 다른 계산을 수행하고 그 결과를 
	 하나의 SQL 문으로 처리하는 것이 더 효율적이며 간단하다.
   => CASE 문을 사용하면 여러 조건을 고려할 수 있으며 하나의 SQL 문으로 원하는 결과를
    얻을 수 있다.
=> 그러면 동적 SQL 및 EXECUTE IMMEDIATE를 사용하려는 이유는, 일반적으로 SQL 문이 런타임 중에 
	 동적으로 생성되는 경우, 예를 들어 동적으로 테이블 이름이나 열 이름을 결정해야 하는 경우에 
	 유용하다. 