-- �μ���ȣ, �μ���ȣ �� �� ������ ����ϴµ� �� �Ʒ��� ��ü �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by grouping sets(deptno,());

-- �Ʒ��� SQL�� ����� GROUPING SETS �� �����Ͻÿ� 
select deptno, job, sum(sal) 
from emp 
group by rollup(deptno, job) 
order by deptno, job; 

-- ��:
select deptno, job, sum(sal) 
from emp 
group by grouping sets(deptno,(deptno, job),())
order by deptno, job; 

-- �Ʒ��� SQL�� ����� GROUPING SETS �� �����Ͻÿ� 
select deptno, sum(sal) 
from emp 
group by cube(deptno);

-- ��:
select deptno, sum(sal) 
from emp 
group by grouping sets(deptno,())
order by deptno asc nulls first;

select empno, ename, sum(sal) 
from emp 
group by grouping sets((empno,ename),())
order by empno;

select to_char(hiredate,'rrrr'), job, sum(sal) 
from emp 
group by grouping sets(to_char(hiredate,'rrrr'), job)
order by job asc, to_char(hiredate,'rrrr') desc;

select  to_char(hiredate,'RRRR') �⵵,job, to_char(sum(sal),'999,999') ��Ż
from emp 
group by grouping sets(to_char(hiredate,'RRRR'), (to_char(hiredate,'RRRR'),job),())
order by �⵵;
