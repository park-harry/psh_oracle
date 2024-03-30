1. DB를 정상 종료한다. 
sqlplus sys/oracle_4U as sysdba

shutdown immediate

2. DB를 마운트(mount) 상태로 올린다. 
startup mount 

3. 아카이브 모드로 변환하다.(나중에 복구가 가능할 수 있도록 로그를 자동으로 기록하게 설정하기) 
alter database archivelog;

4. DML 문이 기록될 수 있도록 설정한다. 
alter database add supplemental log data;

5. DB를 open 시킨다.
alter database open;

6. 설정이 잘 되었는지 확인한다. 
archive log list;

7. c##scott 유저로 접속해서 KING의 월급과 부서번호를 조회한다. 
connect c##scott/tiger
select ename, sal, deptno 
from emp 
where ename = 'KING';

8. KING의 부서번호를 20번호로 변경한다. 
update emp 
set deptno = 20 
where ename = 'KING';

9. KING의 월급을 800으로 변경한다. 
update emp 
set sal= 8000
where ename = 'KING';

10. flashback version query 를 이용해서 KING의 데이터가 어떻게 변경되어 왔는지 그 이력 정보를 
확인하시오. 
select versions_startscn, versions_endscn, versions_operation, sal, deptno
from emp
versions between scn minvalue and maxvalue
where ename = 'KING';

11. flashback transaction query 를 이용해서 KING의 데이터를 과거로 되돌리기 위한 DML 문장을 
출력하시오. 
select undo_sql
from flashback_transaction_query
where table_owner='C##SCOTT' and table_name = 'EMP'
and commit_scn between 21500538 and 21500622
order by start_timestamp desc;

문제 1-1. ALLEN의 커미션을 7000으로 변경하고 직업을 president로 변경하시오. 
update emp set comm = 7000
where ename = 'ALLEN';

update emp
set job = 'PRESIDENT'
WHERE ENAME = 'ALLEN';

commit;

문제 1-2. ALLEN 의 데이터가 그동안 어떻게 변경되어 왔는지 flashback version query 로 이력정보를
확인하고 flashback transaction query로 복구 dml 문장을 추출하시오. 
select versions_startscn, versions_endscn, versions_operation, comm,job
from emp
versions between scn minvalue and maxvalue
where ename = 'ALLEN';

select undo_sql
from flashback_transaction_query
where table_owner='C##SCOTT' and table_name = 'EMP'
and commit_scn between 21503285 and 21503285
order by start_timestamp desc;

만약에 scn 을 알 수 없다면, 시간으로 scn 번호를 알아낼 수 있다.
1. 현재 시간을 확인한다. 
select systimestamp from dual; 

2. 시간으로 scn 번호를 찾는다. 
select timestamp_to_scn('23/12/14 10:48:08')
from dual;

3. scn 번호로 시간을 찾을 수도 있다. 
select scn_to_timestamp('21506708')
from dual;