-- 다음과 같이 sys_connect_by_path 함수를 이용한 SQL을 작성하시오. 
select ename, sys_connect_by_path( ename,',')
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- 위의 결과를 아래와 같이 출력하시오. 앞에 콤마를 잘라내고 출력하시오. 
select ename, substr(sys_connect_by_path(ename,','),2)
from emp 
start with mgr is null 
connect by prior empno = mgr;

select ename, ltrim(sys_connect_by_path(ename,','),',')
from emp 
start with mgr is null 
connect by prior empno = mgr;

select rpad(' ', level *3)||ename as employee, level, ename, sal, job, connect_by_isleaf as isleaf 
from emp 
start with mgr is null 
connect by prior empno = mgr;

select rpad(' ', level *3)||ename as employee, level, ename, sal, job, 
case when connect_by_isleaf = 1 then '말단 사원' 
else '말단 사원 아님' end as isleaf
from emp 
start with mgr is null 
connect by prior empno = mgr;

select ename, sys_connect_by_path(ename||'('||sal||')','/')
from emp 
start with mgr is null 
connect by prior empno = mgr;