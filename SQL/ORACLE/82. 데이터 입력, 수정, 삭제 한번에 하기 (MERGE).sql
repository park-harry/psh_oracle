-- emp와 dept를 조인해서 이름과 부서위치를 출력하시오. 
select e.ename, d.loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp 테이블에 loc 컬럼을 추가한다 (컬럼 추가 작업) 
alter table emp 
add loc varchar2(10);

-- 추가한 loc 컬럼의 데이터를 해당 사원의 부서위치로 값을 갱신하시오. 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc;

select ename, loc 
from emp; 

-- emp 테이블과 salgrade 테이블을 조인해서 이름, 월급, grade를 출력하시오. 
select e.ename, e.sal, s.grade
from emp e, salgrade s 
where e.sal between s.losal and s.hisal ;

-- 위의 join문이 너무 느려서 반정규화 하기. emp 테이블에 grade라는 컬럼을 추가하시오. 
alter table emp 
add grade number(10);

merge into emp e 
using salgrade s
on (e.sal between s.losal and s.hisal) 
when matched then 
update set e.grade = s.grade;

-- emp18 테이블과 telecom_table을 조인해서 이름, 통신사, 통신비를 출력하시오. 
select e.ename, e.telecom, t.t_price
from emp18 e, telecom_table t 
where e.telecom = t.telecom;

-- 위의 join문이 너무 느려서 반정규화 하기. emp18 테이블에 t_price 라는 컬럼을 추가하시오. 
alter table emp18 
add t_price number(10);

-- 추가한 t_price 컬럼에 해당 통신사별 요을 갱신하시오. 
merge into emp18 e
using telecom_table t 
on (e.telecom = t.telecom) 
when matched then 
update set e.t_price = t.t_price;

-- emp 테이블과 구조는 똑같은데 데이터는 없는 테이블을 emp700이라는 이름으로 생성하시오. 
create table emp700 
as 
select * from emp 
where 1 = 2;

-- emp 700 테이블의 emp 테이블의 empno를 입력하시오. 
insert into emp700(empno)
select empno from emp;

-- emp 테이블과 똑같은 데이터와 구조로 emp_backup2라는 테이블을 생성하시오. 
create table emp_backup2 
as 
select * from emp;

-- emp_backup2에서 직업이 salesman과 analyst 를 지우시오. 
delete from emp_backup2
where job in ('SALESMAN','ANALYST');

-- emp_backup2의 월급을 모두 0으로 변경하시오. 
update emp_backup2
set sal =0;

-- merge문을 이용해서 emp_backup2의 데이터를 emp와 똑같이 맞추시오. 
merge into emp_backup2 b 
using emp e 
on (b.empno = e.empno) 
when matched then 
update set b.sal = e.sal
when not matched then 
insert (b.LOC,b.GRADE,b.EMPNO,b.ENAME,b.JOB,b.MGR,b.HIREDATE,b.SAL,b.COMM,b.DEPTNO)
values (e.LOC,e.GRADE,e.EMPNO,e.ENAME,e.JOB,e.MGR,e.HIREDATE,e.SAL,e.COMM,e.DEPTNO);

select listagg('b.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

select listagg('e.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP';

-- 우리반 테이블을 백업하는 emp18_backup7이라는 테이블을 만드시오. 
create table emp18_backup7
as 
select * from emp18;

-- emp18_backup7 의 데이터를 아래와 같이 지우고 update 하시오. 
delete from emp18_backup7 
where lower(telecom) in ('kt','lg');

update emp18_backup7 
set age =null;

-- emp18_backup7의 내용을 emp18 테이블의 내용으로 똑같이 merge 하시오
select listagg('b.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP18';

select listagg('e.'||column_name,',')
from dba_tab_columns 
where table_name = 'EMP18';

merge into emp18_backup7 b 
using emp18 e 
on (b.ename = e.ename) 
when matched then 
update set b.telecom = e.telecom, b.age = e.age
when not matched then 
insert (b.T_PRICE,b.EMPNO,b.ENAME,b.GENDER,b.BIRTH,b.TELECOM,b.MAJOR,b.BEFORE_JOB,b.EMAIL,b.ADDRESS,b.AGE)
values (e.T_PRICE,e.EMPNO,e.ENAME,e.GENDER,e.BIRTH,e.TELECOM,e.MAJOR,e.BEFORE_JOB,e.EMAIL,e.ADDRESS,e.AGE);

-- merge 문을 이용하지 말고 update 문으로 emp 테이블의 loc에 해당 사원의 부서위치로 값을 갱신하시오. 
-- 튜닝 전 sql 
update emp e 
set loc = (select loc from dept d where d.deptno = e.deptno);

-- 튜닝 후 sql 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc; 