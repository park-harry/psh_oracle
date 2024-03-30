문제 1-1. 다음과 같이 테이블을 생성하면서 empno에 primary key 제약을 걸어서 생성하시오. 
create table emp51 
(empno  number(10) primary key, 
ename   varchar2(10));

문제 1-2. null 값을 emp51에 empno에 입력해본다. 
insert into emp51(empno, ename) 
values(1111,'scott');
insert into emp51(empno, ename) 
values(null,'smith');
=> null 값을 넣을려고 하면 error가 발생한다. 

문제 1-3. 중복된 데이터가 입력 안되는지 확인한다. 
insert into emp51(empno, ename) 
values(1111,'allen');

문제 2-1. 다시 중복된 데이터와 null 값을 입력해야 되서 primary key 제약을 삭제하고 싶다. 
- 제약 이름 확인하기 
select t.table_name, t.constraint_name, c.column_name 
from user_constraints t, user_cons_columns c 
where t.constraint_name = c.constraint_name and t.table_name = 'EMP51';

문제 2-2. primary key 제약 삭제하기 
alter table emp51 
drop constraint SYS_C008581;

문제 2-3. 제약 이름을 의미있게 생성하도록 다시 테이블과 제약을 생성하시오. 
drop table emp51;

create table emp51 
(empno  number(10) constraint emp51_empno_pk primary key, 
ename   varchar2(20));

select t.table_name, t.constraint_name, c.column_name 
from user_constraints t, user_cons_columns c 
where t.constraint_name = c.constraint_name and t.table_name = 'EMP51'; 

문제 2-4. primary key 제약 삭제하기
alter table emp51 
drop constraint emp51_empno_pk;

문제 3-1. 아래의 테이블을 제약과 함께 생성하시오. 
- 테이블명 : emp52 
- 컬럼명 : empno, ename, sal, hiredate (empno에 primary key 제약)

create table emp52 
(empno number(10) constraint emp52_empno_pk primary key ,
 ename  varchar2(20),
 sal  number(10),
 hiredate  date); 

문제 3-2. emp52 테이블에 아래의 데이터를 입력하시오. 
- empno: 1111, ename: allen, sal: 3000, hiredate: 2023/12/14

insert into emp52(empno, ename, sal, hiredate)
 values(1111, 'allen', 3000, '2023/12/14');

문제 3-3. emp52에 empno가 중복된 데이터와 null 값이 입력되는지 확인하시오. 
insert into emp52(empno, ename, sal, hiredate)
 values(1111, 'smith', 2000, '2023/12/13');

insert into emp52(empno, ename, sal, hiredate)
 values(null, 'smith', 2000, '2023/12/13');

문제 4. 우리반 테이블의 empno에 primary key 제약을 거시오. 
alter table emp18 
add constraint emp18_empno_pk primary key(empno);