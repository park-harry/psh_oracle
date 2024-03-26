-- 직업이 salesman인 사원들을 사원 테이블에서 지우시오. 
delete from emp 
where job = 'SALESMAN';

-- 사원 테이블에서 커미션이 null인 사원들을 지우시오. 
delete from emp 
where comm is null;

-- 사원 테이블의 모든 데이터를 지우고 commit 하시오. 그리고 테이블을 복구 시키시오. 
delete from emp;
commit;

alter table emp enable row movement;

select table_name, row_movement from user_tables 
where table_name = 'EMP';

flashback table emp to timestamp 
(systimestamp - interval '5' minute);

-- emp18 테이블의 백업을 만들고 emp18 테이블을 drop 하시오. 
create table emp18_backup 
as 
select * from emp18;

drop table emp18;

-- flashback 으로 테이블을 복구하는데 휴지통 속에 emp18이 있는지 확인하고 있다면, 휴지통에서 복구하시오.  
show recyclebin;

flashback table emp18 to before drop;

truncate table emp18;

--emp18_backup 테이블의 데이터를 emp18 테이블에 입력하시오. 
insert into emp18 
select * from emp18_backup;