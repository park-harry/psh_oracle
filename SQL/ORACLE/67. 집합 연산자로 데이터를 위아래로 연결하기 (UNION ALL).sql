-- �μ���ȣ, �μ���ȣ�� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno;

-- ��� ���̺��� ��ü ��Ż ������ ����Ͻÿ�. 
select sum(sal) 
from emp; 

-- rollup�� �̿��ؼ� �μ���ȣ, �μ���ȣ�� �� ������ ����ϴµ� �� �Ʒ��� ��ü �� ������ 
-- ��µǰ� �Ͻÿ�.
select deptno, sum(sal) 
from emp 
group by rollup(deptno); 

-- ���� ����� rollup�� �̿����� �ʰ� union all �� �����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno
union all
select to_number(null) ,sum(sal) 
from emp;

-- (SQLD,SQLP ����) �Ʒ��� SQL ����� UNION ALL�� �����Ͻÿ�. 
select to_char(hiredate,'RRRR'), job, sum(sal) 
from emp 
group by grouping sets((to_char(hiredate,'RRRR')), (job),());

select to_char(hiredate,'RRRR'), to_char(null), sum(sal) 
from emp 
group by to_char(hiredate,'RRRR')
union all 
select to_char(null), job, sum(sal) 
from emp 
group by job 
union all 
select to_char(null), to_char(null), sum(sal) 
from emp;