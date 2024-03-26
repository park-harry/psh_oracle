-- �μ���ȣ�� 10,20�� ������� �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno;

-- �μ���ȣ�� 20,30���� ������� �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno;

-- ���� 2�� ����� �ϳ��� ���ļ� ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
where deptno in (10,20)
group by deptno
union 
select deptno, sum(sal) 
from emp 
where deptno in (20,30)
group by deptno; 

-- �Ʒ��� SQL�� ����� union all �Ǵ� union���� �����Ͻÿ�. 
select job, deptno, sum(sal) 
from emp 
group by grouping sets(job,deptno);

select to_char(null) as job, deptno, sum(sal) 
from emp 
group by deptno 
union 
select job, to_number(null) as deptno, sum(sal) 
from emp 
group by job;

-- �Ʒ��� SQL�� ����� union all �Ǵ� union���� �����Ͻÿ�. 
select empno, ename, sum(sal) 
from emp 
group by grouping sets((empno, ename),());

select empno, ename, sum(sal) 
from emp 
group by empno, ename 
union 
select to_number(null), to_char(null), sum(sal) 
from emp;