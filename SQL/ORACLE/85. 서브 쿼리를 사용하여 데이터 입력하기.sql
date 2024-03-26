-- emp_backup9 테이블을 생성하는데 emp 테이블의 구조만 가지고 생성하시오.  
create table emp_backup9 
as 
select * from emp 
where 1=2;

-- emp 테이블의 모든 데이터를 emp_backup9 에 이행하시오. 
insert into emp_backup9
select * from emp;

-- emp_backup9을 delete 하고 emp 테이블의 데이터를 emp_backup9에 입력하는데 월급은 0으로 해서 입력하시오. 
delete from emp_backup9;

select listagg(column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

insert into emp_backup9 (LOC,GRADE,EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
select LOC,GRADE,EMPNO,ENAME,JOB,MGR,HIREDATE,0,COMM,DEPTNO from emp;

select * from emp_backup9;