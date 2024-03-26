-- oracle join ���� 
select e.ename, d.loc 
from emp e , dept d 
where e.deptno (+)= d.deptno;

-- 1999 ansi ���� 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno);

-- oracle join ���� 
select e.ename, d.loc 
from emp e , dept d 
where e.deptno = d.deptno(+);

-- 1999 ansi ���� 
select e.ename, d.loc 
from emp e left outer join dept d 
on (e.deptno = d.deptno);

-- right outer join �� �̿��ؼ� �̸�, �μ����� ����Ͻÿ�. 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno);

-- ���� ����� �ٽ� ����ϴµ� ename�� null ���� �� ���� ���� �Ͻÿ�. 
select e.ename, d.loc 
from emp e right outer join dept d 
on (e.deptno = d.deptno)
order by ename nulls first;

-- self join �� 1999 ansi ���� �������� �����ؼ� ��� �̸�, �������� ��� �̸��� ����Ͻÿ�. 
select e.ename as ����̸�, m.ename as �������̸�
from emp e join emp m
on (e.mgr = m.empno);

-- ���� ����� �ٽ� ����ϴµ� 1999 ANSI �������� ��� �̸��ʿ� KING �� ������ 14 ���� ���� ��µǰ� �Ͻÿ�. 
-- 1999 ansi ����
select e.ename as ����̸�, m.ename as �������̸�
from emp e left outer join emp m
on (e.mgr = m.empno);

-- oracle ���� 
select e.ename as ����̸�, m.ename as �������̸�
from emp e ,emp m
where e.mgr = m.empno(+);