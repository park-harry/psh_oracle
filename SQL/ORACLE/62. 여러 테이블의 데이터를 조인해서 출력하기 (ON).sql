-- emp�� dept�� �����ؼ� �̸��� �μ���ġ�� ����Ͻÿ�. (1999 ANSI ����)
select e.ename, d.loc
from emp e join dept d 
on (e.deptno = d.deptno);

-- on ���� ����� ���ι������� ������ salesman�� ������� �̸�, ����, ������, �μ���ġ�� ����Ͻÿ�. 
select e.ename, e.sal, e.job, d.loc 
from emp e join dept d 
on (e.deptno = d.deptno)
where e.job = 'SALESMAN';

-- on ���� ����� ���ι������� EMP�� SALGRADE�� �����ؼ� �̸�, ����, �޿������ ����ϴµ� 
-- �޿������ 2��޸� ����Ͻÿ�. 
select e.ename, e.sal, s.grade
from emp e join salgrade s 
on (e.sal between s.losal and s.hisal) 
where s.grade = 2;

-- EMP�� dept�� salgrade�� �����ؼ� �̸�, �μ���ġ, �޿������ ����Ͻÿ�. 
select e.ename, d.loc, s.grade 
from emp e join dept d on (e.deptno = d.deptno) 
            join salgrade s on(e.sal between s.losal and s.hisal);

-- ���� ����� �ٽ� ����ϴµ� chicago���� �ٹ��ϴ� ����鸸 ����Ͻÿ�. 
select e.ename, d.loc, s.grade 
from emp e join dept d on (e.deptno = d.deptno) 
            join salgrade s on(e.sal between s.losal and s.hisal)
where d.loc = 'CHICAGO';
