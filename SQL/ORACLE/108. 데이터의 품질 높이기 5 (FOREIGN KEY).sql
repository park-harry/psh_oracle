문제 1. demo 스크립트를 돌려서 emp 테이블을 초기화 시키고 dept 테이블의 deptno 에 primary key 
제약을 거시오. 
alter table dept 
add constraint dept_deptno_pk primary key(deptno);

문제 2-1. emp 테이블에 deptno에 foreign key 제약을 걸면서 dept 테이블에 deptno를 참조하라고 하시오. 
alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno);

=>위의 명령어가 성공하려면 dept 테이블의 deptno에 primary key 제약이 걸려있어야 한다.

문제 2-2. emp 테이블에 부서번호 70번을 입력해보시오. 
 insert into emp(empno, ename, sal, deptno)
values(1234, 'aaa',4000,70);

=>무결성 제약조건 위배: 부모 key가 없다는 error가 난다. 

문제 2-3. dept 테이블에 부서번호 10번을 삭제하시오. 
delete from dept 
where deptno=10;
=> 무결성 제약조건 위배: 자식 레코드가 발견되었다는 error가 난다. 

문제 3. 아래의 테이블을 생성하면서 primary key 제약을 거시오. 
- 테이블명: dept700
- 컬럼명: deptno, loc, dname (deptno에 primary key 제약) 
create table dept700 
( deptno  number(10),
loc  varchar2(10),
dname varchar2(10),
constraint dept700_deptno_pk primary key(deptno));

문제 4. 아래의 테이블을 생성하는데 dept700의 deptno를 참조하라고 하시오. 
- 테이블명: emp700
- 컬럼명: empno, ename, sal, deptno (deptno에 foreign key 제약) 
create table emp700
( empno number(10), 
ename varchar2(10),
sal number(10),
deptno number(10), 
constraint emp700_deptno_fk foreign key(deptno) references dept700(deptno));

[dba의 업무 중 하나인 etl 업무]
문제 5-1. dept 테이블의 모든 데이터를 dept700 테이블에 입력하시오. 
insert into dept700(deptno, loc, dname) 
select deptno, loc, dname 
from dept;

commit;

문제 5-2. emp 테이블의 empno, ename, sal, deptno의 모든 데이터를 emp700 테이블에 이행하시오. 
insert into emp700(empno, ename, sal, deptno) 
select empno, ename, sal, deptno 
from emp;
=> 제약에 위반되는 데이터가 없기 때문에 잘 입력이 된다. 

문제 6. telecom_table에 telecom에 primary key 제약을 거시오. 
alter table telecom_table 
add constraint telecom_table_telecom_pk primary key(telecom);

- 중복된 데이터 지우기
select rowid, t.*
from telecom_table t;

delete from telecom_table 
where rowid = '중복이 되는 rowid';

문제 7. emp18 테이블의 telecom에 foreign key 제약을 걸면서 telecom_table에 telecom을 
참조하겠다고 하시오. 
update emp18 
set telecom = lower(telecom);
=> 모두 소문자로 바꿔야 참조가 된다. 

alter table emp18 
add constraint emp18_telecom_fk foreign key(telecom) references telecom_table(telecom);


1. on delete cascade 옵션: dept 테이블의 deptno를 지우면 emp 테이블의 deptno 도 같이 
													지워지는 옵션 
2. on delete set null 옵션: dept 테이블의 deptno를 지우면 emp 테이블의 null로 변경 되는 옵션 
			
문제 8-1. dept 테이블의 부모 자식 관계를 모두 삭제하시오. primary key 제약과 foreign key 제약을 
모두 삭제하시오. 
alter table dept 
drop constraint dept_deptno_pk cascade;

문제 8-2. 이번에는 on delete cascade 옵션을 써서 다시 부모 자식 관계를 형성하시오. 
alter table dept 
add constraint dept_deptno_pk primary key(deptno);

alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno)
on delete cascade;

문제 9-1. dept 테이블의 부서번호 10번을 지우시오. 
delete from dept 
where deptno = 10;

select * from emp;
=> dept 테이블의 부서 번호 10번도 지워지고 emp 테이블의 부서번호 10번도 다 지워졌다. 
rollback;

문제 9-2. 이번에는 on delete set null을 테스트 하시오. 
alter table dept 
drop constraint dept_deptno_pk cascade;
=> 제약 지우기 

alter table dept 
add constraint dept_deptno_pk primary key(deptno);

alter table emp 
add constraint emp_deptno_fk foreign key(deptno) references dept(deptno)
on delete set null;

delete from dept 
where deptno = 10;

select * from emp;
=> dept 테이블의 부서 번호 10번도 지워지고 emp 테이블의 부서번호 10번 데이터는 null 값으로 바뀜.

문제 10. foreign key 제약 생성 시 column level, table level 다 가능한지 test 하시오. 
- table level 
create table dept901
(deptno number(10),
loc varchar2(10),
dname varchar2(10),
constraint dept901_deptno_pk primary key (deptno));

create table emp901
(ename varchar2(10),
deptno number(10),
constraint emp901_deptno_fk foreign key(deptno) references dept901(deptno));

- column level 
create table dept902
(deptno number(10) constraint dept902_deptno_pk primary key,
loc varchar2(10),
dname varchar2(10)
);

create table emp902
(ename varchar2(10),
deptno number(10) constraint emp902_deptno_fk references dept902(deptno)); 