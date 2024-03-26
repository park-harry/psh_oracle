create table emp600
(ename varchar2(10),
sal number(10),
deptno varchar2(10) );

create table dept600
(deptno char(10),
loc varchar2(10)  );

insert into emp600 (ename, sal, deptno)
select ename, sal, to_char(deptno)
from emp;

insert into dept600(deptno, loc )
select to_char(deptno), loc
from dept;

