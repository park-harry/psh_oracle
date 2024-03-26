-- emp ���̺� loc �÷��� �߰��Ͻÿ�. 
alter table emp add loc varchar2(10); 

-- merge ���� �̿��ؼ� ���� ��� �߰��� loc�� �����͸� �ش� ����� �μ���ġ�� ���� �����Ͻÿ�. 
merge into emp e 
using dept d 
on (e.deptno = d.deptno) 
when matched then 
update set e.loc = d.loc; 

-- dept ���̺� sumsal�̶�� �÷��� �߰��Ͻÿ�. 
alter table dept add sumsal number(10); 

-- ��� ���̺��� �μ���ȣ�� �̰�, �μ���ȣ �� ��Ż ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp 
group by deptno; 

-- merge ���� �̿��ؼ� dept ���̺��� merge �ϴµ� �ش� �μ��� ��Ż �������� ���� �����Ͻÿ�. 
merge into dept d 
using (select deptno, sum(sal) as sumsal from emp group by deptno) e
on (d.deptno = e.depno) 
when matched then 
update set d.sumsal = e.sumsal; 


-- dept ���̺� cnt ��� �÷��� �߰��ϰ� �ش� �μ� ��ġ�� �ο����� ���� �����Ͻÿ�. 
alter table dept add cnt number(10); 

merge into dept d 
using (select deptno, count(*) as cnt from emp group by deptno) e
on (d.deptno = e.deptno) 
when matched then 
update set d.cnt = e.cnt;