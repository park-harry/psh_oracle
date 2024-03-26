-- 이름이 scott인 사원의 월급을 5600으로 수정하시오. 
update emp 
set sal = 5600
where ename = 'SCOTT';

-- 직업이 salesman인 사원들의 커미션을 9000으로 수정하시오. 
update emp 
set comm = 9000
where job = 'SALESMAN';

-- 월급이 2000 이상인 사원들의 부서번호를 10번으로 변경하시오. 
update emp 
set deptno = 10 
where sal >= 2000;

-- 사원 테이블의 월급을 모두 0으로 변경하시오. 
update emp 
set sal = 0; 

-- commit 하기 전에 취소하기 
rollback;

// 잘못 commit 해서 데이터 복구 하는 방법 -> 오라클의 타임머신 기능 사용하기 
-- emp 테이블을 flashback이 가능한 상태로 구성 
alter table emp enable row movement;

select table_name, row_movement from user_tables
where table_name = 'EMP';

-- 현재 시간에서 19분 전으로  emp 테이블을 되돌린다. 
flashback table emp to timestamp 
(systimestamp - interval '19' minute);

-- flashback이 가능한 시간을 확인하시오. 
select name, value 
from v$parameter 
where name ='undo_retention'; 
