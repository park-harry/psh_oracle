	
문제 1. 다음의 테이블을 not null 제약을 걸어서 생성하시오. 
create table emp61
(empno   number(10) constraint emp61_empno_nn not null,
 ename varchar2(10));

insert into emp61(empno, ename)
 values(null,'scott');

문제 2. 다음과 같이 table level로 제약을 걸면 생성되지 않는지 확인하시오. (OCP 시험 문제) 
create table emp62
(empno number(10),
ename varchar2(10),
constraint emp62_empno_nn not null(empno));

문제 3. emp 테이블의 sal에 not null 제약을 거시오. 
alter table emp 
modify sal constraint emp_sal_nn not null;

문제 4. 우리반 테이블의 ename에 not null 제약을 거시오. 
alter table emp18 
modify ename constraint emp18_ename_nn not null;

문제 5. dept 테이블에 loc 컬럼에 not null 제약을 거시오. 
alter table dept 
modify loc constraint dept_loc_nn not null;

문제 6. dept 테이블의 20번 부서번호의 loc을 null로 변경하시오. 
update dept 
set loc = null 
where deptno = 20;
