-- �̸��� �μ���ġ�� ����ϴµ� using ���� ����� �������� �����Ͻÿ�. 
select e.ename, d.loc 
from emp e join dept d 
using (deptno);

-- using ���� ����� ���� �������� ������ salesman�� ������� �̸�, ����, �μ���ġ�� ����Ͻÿ�. 
select e.ename, e.sal, d.loc 
from emp e join dept d 
using (deptno) 
where e.job = 'SALESMAN';

