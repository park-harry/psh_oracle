-- �μ� ��ȣ, �μ���ȣ�� �� ������ ����ϴµ� ��ü �� ������ �� ���� ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by cube(deptno);

-- ��Ż縦 ����ϰ� ��Ż纰 �ο����� ����ϴµ� ��ü �л� �ο����� �� ���� ��µǰ� �Ͻÿ�. 
select telecom, count(*) 
from emp18 
group by cube(telecom);

select deptno, job, sum(sal) 
from emp 
group by cube(deptno, job);