-- emp ���̺�� salgrade ���̺��� ���� �����ؼ� �̸�, ����, �޿����(grade)�� ����Ͻÿ�. 
select e.ename, e.sal, s.grade 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal;

-- ���� ����� �ٽ� ����ϴµ� grade�� 2��޸� ������ ����Ͻÿ�. 
select e.ename, e.sal, s.grade 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal 
and s.grade =2;

-- emp, dept, salgrade ���̺��� �����ؼ� dallas���� �ٹ��ϴ� ������� �̸�, �μ���ġ, ����, �޿������ ����Ͻÿ�. 
select e.ename, d.loc, e.sal, s.grade 
from emp e, dept d, salgrade s 
where e.sal between s.losal and s.hisal and e.deptno = d.deptno 
and d.loc = 'DALLAS';

-- emp, dept�� �����ؼ� �μ���ġ�� ����ϰ� �μ���ġ ���� ���� ������� �̸��� ���η� ����Ͻÿ�. 
select d.loc, listagg(e.ename, ',') within group (order by ename asc)
from emp e, dept d 
where e.deptno = d.deptno
group by d.loc;

-- �μ���ġ �� �� ������ ����ϴµ� �� �Ʒ��� �� ������ ����Ͻÿ�. 
select d.loc, sum(e.sal) 
from emp e, dept d 
where e.deptno = d.deptno 
group by rollup(d.loc);

-- emp�� dept�� salgrade�� �����ؼ� ����� ����ϴµ� CHICAGO���� �ٹ��ϴ� ������� �̸�, 
-- ����, �μ���ġ, �μ���, grade�� ����Ͻÿ�. 
select e.ename, e.sal, d.loc, d.dname, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
and d.loc = 'CHICAGO'; 

-- �޿����, �޿���� ���� �ش��ϴ� ������� �̸��� ���η� ��µǰ� �Ͻÿ�. 
-- ���η� ��µ� �� ������ ���� ��� ������ ��µǰ� �Ͻÿ�. 
select s.grade, listagg(e.ename,',') within group (order by e.sal desc) as ename 
from emp e, salgrade s 
where e.sal between s.losal and s.hisal
group by s.grade; 
