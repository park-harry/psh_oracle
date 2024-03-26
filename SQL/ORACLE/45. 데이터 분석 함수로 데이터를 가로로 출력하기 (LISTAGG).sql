-- �μ���ȣ, �μ� ��ȣ���� �ش��ϴ� ������� �̸��� ���η� ����Ͻÿ�. 
select deptno, listagg(ename,',') within group (order by ename) 
from emp 
group by deptno;

-- ����, ���� ���� ���� ������� �̸��� ���η� ����Ͻÿ�. (�̸��� abcd ������� ���) 
select job, listagg(ename, ',') within group (order by ename asc) 
from emp
group by job;

-- �츮�� ���̺��� ��Ż�, ��Ż� ���� ���� �л����� �̸��� ���η� ����ϴµ� 
-- ���̰� ���� �л������ ��µǰ� �Ͻÿ�.
select telecom, listagg(ename,', ') within group (order by age desc) 
from emp18 
group by telecom;

-- (����� �������� ��û�ߴ� sql) ���� ��� + �̸� ���� ���� ��� 
select telecom, listagg(ename || '('||age||')', ', ') within group (order by age desc)
from emp18 
group by telecom;

-- �μ���ġ�� ���� �̸��� ������ ������ ����ϴµ� Employee��� column���� �����ϰ� ������
-- �̸��� ������ ���η� ����Ͻÿ�. 
select d.loc, listagg(ename || '('||sal||')') within group (order by sal desc) as Employee
from emp e, dept d
where e.deptno = d.deptno 
group by d.loc;