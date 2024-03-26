-- ������ ���� sys_connect_by_path �Լ��� �̿��� SQL�� �ۼ��Ͻÿ�. 
select ename, sys_connect_by_path( ename,',')
from emp 
start with mgr is null 
connect by prior empno = mgr;

-- ���� ����� �Ʒ��� ���� ����Ͻÿ�. �տ� �޸��� �߶󳻰� ����Ͻÿ�. 
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
case when connect_by_isleaf = 1 then '���� ���' 
else '���� ��� �ƴ�' end as isleaf
from emp 
start with mgr is null 
connect by prior empno = mgr;

select ename, sys_connect_by_path(ename||'('||sal||')','/')
from emp 
start with mgr is null 
connect by prior empno = mgr;