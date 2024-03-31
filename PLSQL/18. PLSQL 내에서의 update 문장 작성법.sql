- PL/SQL 내에 실행절에 update 문을 넣어서 실행할 수 있다.
update emp
set  sal = 9000
where job='SALESMAN';

환경 구성. 실습을 실행하기 전에 먼저 아래의 스크립트를 init_emp.sql 이란 이름으로 저장 하세요.
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
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);
commit;

문제 1-1. 프로시져를 생성합니다.
create   or  replace   procedure    update_job
as
		begin
		update    emp
		set   sal  =  sal * 1.1
		where  job='SALESMAN';
    commit;
end;
/

문제 1-2. 프로시져를 실행합니다.
exec update_job;

문제 1-3. update_job 프로시져를 실행할 때 다음과 같이 직업을 입력해서 실행되게 하세요.
execute   update_job('ANALYST');

create   or  replace   procedure    update_job 
		(p_job  emp.job%type)
as
		begin
		update    emp
		set   sal  =  sal * 1.1
		where  job=p_job;
    commit;
end;
/

문제 1-4. 부서번호를 넣고 프로시져를 실행하면 해당 부서번호인 사원들의 커미션을 9000 으로 변경하는 
프로시져를 생성하시오 !
exec  update_deptno(20);

create or replace procedure update_deptno
		(p_deptno emp.deptno%type)
as
		begin 
		update emp 
		set comm = 9000
		where deptno = p_deptno;
		commit;
end;
/