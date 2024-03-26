create global temporary table emp_temp3 
(empno number(10), 
ename varchar2(10), 
sal   number(10) )
on commit delete rows;

insert into emp_temp3 values(1111,'scott',3000);
insert into emp_temp3 values(2222,'allen',2000);

select * from emp_temp3;

commit;

-- on commit preserve rows 옵션으로 임시 테이블을 생성한다.
create global temporary table emp_temp4
(empno number(10), 
ename varchar2(10), 
sal   number(10) )
on commit preserve rows;

-- dept 테이블과 똑같은 구조로 dept_temp 테이블을 만드는데 commit 하면 사라지는 임시 
-- 테이블로 생성하시오. 
create global temporary table dept_temp
on commit delete rows
as 
select * from dept where 1=2;

insert into dept_temp 
select * from dept;

