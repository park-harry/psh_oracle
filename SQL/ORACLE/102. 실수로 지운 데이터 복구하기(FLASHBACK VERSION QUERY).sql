문제 1-1. 현재 시간 확인 
select systimestamp from dual;
23/12/13 16:18:26.805000000 +09:00

문제 1-2. KING의 월급을 9000으로 변경하시오. 
update emp 
set sal = 9000 
where ename = 'KING';
commit;

문제 1-3. KING의 부서번호를 30번으로 변경하시오. 
update emp 
set deptno = 30 
where ename = 'KING';
commit;

문제 1-4. KING의 행을 지우시오. 
delete from emp 
where ename = 'KING';
commit;

문제 1-5. emp 테이블의 KING의 데이터가 그동안 어떻게 변경이 되어왔는지 그 이력정보를 확인하시오. 
select ename, sal, deptno, 
versions_starttime, versions_endtime, versions_operation
from emp 
versions between timestamp to_timestamp('23/12/13 16:18:26','RRRR/MM/DD hh24:mi:ss')
and maxvalue
where ename = 'KING';

문제 1-6. 다시 emp 테이블을 flashback table을 해서 복구하시오. 
alter table emp 
enable row movement;

flashback table emp 
to timestamp to_timestamp('23/12/13 16:18:26',
                            'RRRR/MM/DD HH24:MI;SS');