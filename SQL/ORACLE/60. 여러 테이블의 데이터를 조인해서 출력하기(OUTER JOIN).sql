-- emp, dept �� �����ؼ� �̸��� �μ���ġ�� ����Ͻÿ�. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;

-- �μ� ��ȣ 40���� ������ �ִ� ����� emp�� ���� ������ ���� SQL�δ� �μ���ġ BOSTON�� 
-- ������ �ʴ´�. 
-- OUTER JOIN�� �Ἥ BOSTON �� ������ �ؾ� �Ѵ�. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno (+)= d.deptno;

--EMP ���̺��� ���������� DEPT ���̺��� �������� ���� �μ���ȣ�� ���� ����̸��� �μ���ġ�� ��µǰ� �Ͻÿ�. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno(+);

-- ���� ����� �ٽ� ����ϴµ� jack�� ����Ͻÿ�. 
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno(+) and e.ename = 'JACK';