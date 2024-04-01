실습 환경 구성 
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
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7876,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;


문제 1. 아래의  PL/SQL 코드를 수행하는데 사원 이름을 물어볼 때 없는 사원 이름을 넣고 실행하시오. 
없는 사원이름을 넣으면 에러가 발생하는데 에러가 발생하지 않고 예외처리를 해서 '해당 사원은 없습니다'
라는 메세지가 화면에 출력되게 하시오. 

set verify off
set  serveroutput  on
accept   p_ename  prompt   '이름을 입력하세요 ~'
declare
    v_ename     emp.ename%type :=  upper('&p_ename');
    v_sal           emp.sal%type ;
begin
    select   sal   into   v_sal
    from  emp
    where  ename = v_ename;
    
    dbms_output.put_line( v_sal );
    
    exception 
        when no_data_found then 
         dbms_output.put_line('해당 사원은 없습니다');
end;
/


문제 2. 다음과 같이 부서번호를 물어보게 하고 부서번호를 입력하면 해당 부서번호의 부서위치가 
출력되는 PL/SQL 코드를 실행하는데 없는 부서번호를 입력하면 '해당 부서번호는 없는 부서번호입니다.'
라는 메세지가 출력되게 예외처리를 하세요.

set serveroutput on
accept   p_deptno  prompt   '부서번호를 입력하세요 ~'
declare
    v_deptno     dept.deptno%type :=  &p_deptno;
    v_loc           dept.loc%type ;
begin
    select   loc   into   v_loc
    from  dept
    where  deptno = v_deptno;
    
    dbms_output.put_line( v_loc );
    
    exception 
        when no_data_found then 
        dbms_output.put_line( '해당 부서번호는 없는 부서번호입니다.' );
end;
/