문제 1. c##scott 유져에서  c##smith 유져를 만들고 접속할 수 있는 권한을 부여하고 c##smith 유져로 
접속하시오
create user c##smith
identified by tiger;

grant dba to c##smith;

connect c##smith/tiger

select count(*) from c##scott.emp;

문제 2-1. c##scott.emp 를 emp라고도 불러도 될 수 있게 설정하시오. 
create public synonym emp
for c##scott.emp;

문제 2-2. c##smith 유져가 c##scott의 dept 테이블과 saglrade 테이블을 조회할 수 있게 하시오.
create public synonym dept 
for c##scott.dept;

create public synonym salgrade 
for c##scott.salgrade;

select count(*) from dept;
select count(*) from salgrade;

문제 3. hr 계정이 가지고 있는 모든 테이블들을 c##smith 유져가 select 할 수 있게 하시오
-> 먼저 c##scott 유저로 접속해야 한다. 
connect c##scott/tiger 

grant select on dept to c##smith;
grant select on salgrade to c##smith;

문제 4. hr 계정이 소유하고 있는 테이블 리스트를 확인하시오 !
select table_name 
from dba_tables  => db의 모든 table 리스트를 보는 사전 
where owner='HR'; => 소유자 

- 명령 프롬포트에서 다음의 코드 실행 
sqlplus sys/oracle_4U as sysdba

alter user hr 
identified by hr; 

connect c##scott/tiger

grant dba to hr; 

connect hr/hr

문제 5. hr 계정의 테이블들을의 일부롤 synonym으로 생성하시오. 
create public synonym jobs for hr.jobs;
create public synonym employees for hr.employees ;
create public synonym departments for hr.departments;
create public synonym locations for hr.locations;

문제 6. c##scott/tiger 유저로 접속해서 hr 유저의 테이블인 jobs를 아래와 같이 조회하시오. 
connect c##scott/tiger

select * from jobs; 

문제 7. hr 유저가 생성한 synonym을 전부 삭제하시오. 
select synonym_name
from all_synonyms
where table_owner = 'HR';

drop public synonym employees;
drop public synonym departments;
drop public synonym jobs;
drop public synonym locations;