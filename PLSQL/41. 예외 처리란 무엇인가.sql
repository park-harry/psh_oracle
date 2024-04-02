예외 처리(exception handling)란, 프로그래머가 예기치 못한 예외의 발생에 미리 대처하는 코드를 
작성하는 것으로, 실행 중인 프로그램의 비정상적인 종료를 막고 상태를 정상 상태로 유지하는 것이다.

- 문법
declare
	변수 선언 ;
	예외 선언 ;
begin
	실행문;
	예외처리문;
end;
/

예제 1. 이름을 입력하면 해당 사원의 월급이 출력되는 PL/SQL코드를 작성하시오 !
set serveroutput on 
set verify off 
accept p_ename prompt '이름을 입력하시오.'
declare 
    v_ename emp.ename%type:= upper('&p_ename');
    v_sal   emp.sal%type;
begin 
    select sal into v_sal 
    from emp 
    where ename = v_ename;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
end;
/

문제 1-1. MARTIN 의 이름을 SCOTT 으로 변경하고 위의 PL/SQL 코드를 수행하는데 이름을 SCOTT으로
입력해보시오.
update  emp
set   ename='SCOTT'
where  ename='MARTIN';
commit;

문제 1-2. 위의 경우를 대비하기 위한 예외처리를 하세요.
set serveroutput on 
set verify off 
accept p_ename prompt '이름을 입력하시오.'
declare 
    v_ename emp.ename%type:= upper('&p_ename');
    v_sal   emp.sal%type;
begin 
    select sal into v_sal 
    from emp 
    where ename = v_ename;
    
    dbms_output.put_line(v_ename||chr(9)||v_sal);
    
    exception 
	    when too_many_rows then 
	    dbms_output.put_line('해당 사원 이름이 여러 명 있습니다. 고객센터로 문의하세요.');
end;
/


실습환경 구성.

alter session set nls_Date_format='RR/MM/DD';
drop table emp;
drop table dept;

CREATE TABLE DEPT
(DEPTNO number(10),
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
EMPNO               NUMBER(4) NOT NULL,
ENAME               VARCHAR2(10),
JOB                 VARCHAR2(9),
MGR                 NUMBER(4) ,
HIREDATE            DATE,
SAL                 NUMBER(7,2),
COMM                NUMBER(7,2),
DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-09',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7788,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7876,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);
commit;


문제 2. 사원 번호를 물어보게 하고 사원번호를 입력하면 해당 사원의 직업이 출력되는 PL/SQL을 
생성하시오. 사원번호가 여러개가 있으면 '해당 사원번호가 중복되어 여러개가 있습니다. 고객센터로 
문의하세요' 라는 메세지가 출력되게 예외처리를 하시오.
	사원번호를 입력하세요 ~  7788
	SCOTT 의 직업은 ANALYST 입니다.*/

set serveroutput on 
set verify off 
accept p_empno prompt '사원번호를 입력하세요.'
declare 
    v_empno emp.empno%type := &p_empno;
    v_ename emp.ename%type;
    v_job emp.job%type;
begin 
    select ename, job into v_ename, v_job
    from emp 
    where empno = v_empno;
    
    dbms_output.put_line(v_ename||'의 직업은'||v_job||' 입니다.');
    
    exception 
        when too_many_rows then 
        dbms_output.put_line('해당 사원 이름이 여러 명 있습니다. 고객센터로 문의하세요.');
end;
/