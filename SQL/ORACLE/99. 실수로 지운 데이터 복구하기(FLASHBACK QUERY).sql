문제 1-1. 현재 시간을 확인하기
select systimestamp from dual;

문제 1-2. emp 테이블을 전부 지우고 commit 한다. 
delete from emp; 
commit; 

문제 1-3. emp 테이블의 데이터가 지워지지 10분 전의 상태를 확인하시오. 
select * from emp
as of timestamp to_timestamp('2023/12/13 14:56:55',
                            'RRRR/MM/DD HH24:MI;SS');
위의 시간대에는 emp 테이블이 있고 데이터도 문제가 없이 잘 있는지 확인했으면 시간을 복사해서 
간직한다. 이 시간으로 emp 테이블을 flashback 한다. 

문제 1-4. emp 테이블을 flashback이 가능한 상태로 만든다. 
alter table emp 
enable row movement;

select table_name, row_movement 
from user_tables 
where table_name = 'EMP'; 
=> enabled 나오는지 확인해보기 

flashback table emp18 
to timestamp to_timestamp('2023/12/13 15:01:55','RRRR/MM/DD HH24:MI;SS');

문제 1-5. dept 테이블을 전부 delete 하고 commit 한 후에 flashback query로 dept 테이블이 
지워지기 전의 데이터를 모두 확인하시오.
select systimestamp from dual;
23/12/13 15:16:25.733000000 +09:00

delete from dept;
commit;

select * from dept 
as of timestamp to_timestamp('2023/12/13 15:14:25',
                             'RRRR/MM/DD HH24:MI;SS');
                             
문제 1-6. 위에서 확인한 시간으로 dept 테이블을 flashback table 해서 복구하시오. 
alter table dept 
enable row movement;

select table_name, row_movement 
from user_tables 
where table_name = 'DEPT';

flashback table dept 
to timestamp to_timestamp('2023/12/13 15:14:25',
                             'RRRR/MM/DD HH24:MI;SS');
                             
문제 2. 사원 테이블의 월급을 모두 0으로 변경하고 commit 하시오. 
update emp
set sal =0;
commit;

-- 위의 데이터를 복구 하시오. 
select systimestamp from dual;
23/12/13 15:25:45.288000000 +09:00

select * from emp 
as of timestamp to_timestamp('23/12/13 15:23:45',
                            'RRRR/MM/DD HH24:MI:SS');

alter table emp 
enable row movement;

flashback table emp 
to timestamp to_timestamp('23/12/13 15:23:45',
                            'RRRR/MM/DD HH24:MI:SS');  