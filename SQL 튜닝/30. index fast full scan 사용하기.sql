index full scan vs. index fast full scan
- index full scan
  => �ε����� ������ ���� ��ĵ�ϸ� ������ ������ �ȴ�.
  => single block i/o
  => ���� ��ĵ�� �Ұ����ϴ�.
- index fast full scan
  => ���׸�Ʈ ��ü�� ��ĵ�ϸ� ������ ������� �ʴ´�.
  => multi block i/o
  => ���� ��ĵ�� �����ϴ�.
  
���� 1. ����, ������ �ο����� ����ϴ� SQL�� �ۼ��ϴµ� index fast full scan�� �Ͻÿ�. 
@demo 
create index emp_job on emp(job); 

select /*+index_ffs(emp emp_job) */ job, count(*) 
from emp 
where job is not null 
group by job; 
@p

���� 1. �μ���ȣ, �μ���ȣ�� �ο����� ����ϴµ� ���õ� �ε��� �����ϰ� index fast full scan�� 
�ǰ� �Ͻÿ�. 
create index emp_deptno on emp(deptno); 

select /*+ index_ffs(emp emp_deptno)*/ deptno, count(*) 
from emp 
where deptno is not null 
group by deptno; 
@p

���� 2. ������ ������ ��Ż������ ����ϴµ� index fast full scan�� �ǰڱ� ���õ� �ε����� �ɰ� 
SQL�� �ۼ��Ͻÿ�. 
create index emp_job_sal on emp(job, sal);

select /*+ index_ffs(emp emp_job_sal)*/ job, sum(sal) 
from emp 
where job is not null 
group by job; 
@p

=> /*+ index_ffs(emp emp_job_sal)*/ ��Ʈ�� �� ���� index full scan�� �ϴ� ���̴�. 

���� 2. ���ķ� index fast full scan�� �Ͻÿ�. 
select /*+ index_ffs(emp emp_job_sal) 
				parallel_index(emp, emp_job_sal,4) */ job, sum(sal) 
from emp 
where job is not null 
group by job; 

=> parallel_index(���̺��, �ε��� �̸�, ���ĵ�) �� xe ���������� �����۾��� �ȵȴ�.
   => ���ĵ��� Ŭ���� �������µ� ���ĵ��� �ִ밪�� (cpu_count x 2) ��ŭ �� �� �ִ�.
       show parameter cpu_count
       
���� 3. �μ���ȣ, �μ���ȣ �� �ο����� ����ϴµ� index fast full scan�� �ϰ� ���ķ� �۾��� �� 
�ְ� ��Ʈ�� �ֽÿ�. 
create index emp_deptno on emp(deptno); 

select /*+ index_ffs(emp emp_deptno) parallel_index(emp, emp_deptno,16) */ 
			deptno, count(*) 
from emp 
where deptno is not null 
group by deptno; 
@p    