문제 1-1. salgrade 테이블을 delete 하고 commit 하시오. 
select systimestamp from dual;
23/12/13 15:47:15.580000000 +09:00

delete from salgrade;
commit;

문제 1-2. salgrade 테이블을 flashback table로 복구 하는데 현재 시간에서 5분 전으로 되돌리시오. 
alter table salgrade 
enable row movement;

flashback table salgrade 
to timestamp (systimestamp - interval '5' minute);

문제 2-1. market_2017을 delete하고 commit 하시오. 
delete from market_2017;
commit; 

문제 2-2. market_2017을 flashback table로 복구하시오. 
alter table market_2017 
enable row movement;

flashback table market_2017
to timestamp(systimestamp - interval '3' minute);

=> delete 한 데이터는 flashback 으로 되돌릴 수 있지만 truncate한 데이터는 되돌리지 못한다. 