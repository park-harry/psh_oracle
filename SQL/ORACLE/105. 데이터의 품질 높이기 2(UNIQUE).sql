문제 1-1. 아래와 같이 unique 제약을 걸어서 테이블을 생성하시오. 
create table emp55
( empno number(10),
ename varchar2(10) constraint emp55_ename_un unique,
sal number(10));

문제 1-2. 이번에는 table level로 생성하시오. 
create table emp56
(empno number(10),
ename varchar2(10),
sal number(10),
constraint emp56_ename_un unique(ename));

문제 1-3. 사원 테이블의 ename에 unique 제약을 거시오. 
alter table emp 
add constraint emp_ename_un unique(ename);

문제 2. 아래의 테이블을 생성하면서 제약을 생성하시오. 
- 테이블명: emp57
- 컬럼명: empno, ename, sal, hiredate (sal에다가 unique 제약 걸기) 
create table emp57
(empno number(10),
ename varchar2(10), 
sal number(10) constraint emp57_sal_un unique, 
hiredate date);

문제 3-1. 우리반 테이블 ename에 unique 제약을 거시오. 
alter table emp18
add constraint emp18_ename_un unique(ename);

문제 3-2. 우리반 테이블에 ename에 걸린 unique 제약을 삭제하시오. 
alter table emp18 
drop constraint emp18_ename_un;