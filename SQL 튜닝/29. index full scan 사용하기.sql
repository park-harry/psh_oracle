���� 1. ����, ������ �ο����� ����Ͻÿ�. 
@demo 
create index emp_job on emp(job); 

select job, count(*) 
from emp 
group by job; 
@p

-> �Ʒ��� ���� table full scan �ϴ� ���� ��ȹ�� ��� �Ǿ���. �׷��� index full scan���� ������
   �ϰ� �ʹٸ� job�� not null �� �ɷ� ������ �ȴ�. 
   
alter table emp 
modify job not null; 

select job, count(*) 
from emp 
group by job; 
@p

=> ������ ������ 6������ 2���� �پ���. 
=> index full scan�̳� index fast full scan�� �Ƿ��� �ش� �÷��� null �� ������ ��������� �Ѵ�.
	 �׷��� not null ������ �� �� ���ٰ� �Ѵٸ� ������ ���� SQL�� �ۼ��Ѵ�. 

select job, count(*) 
from emp 
where job is not null 
group by job; 
@p

select constraint_name
 from user_constraints
 where table_name='EMP';

--SYS_C008746
--SYS_C008747

alter table emp
drop constraint SYS_C008746;

alter table emp
drop constraint SYS_C008747;


���� 1. �μ���ȣ�� �ε����� �ɰ� �μ���ȣ, �μ���ȣ �� �ο����� ����ϴµ� index full scan�� �� 
�� �ֵ��� Ʃ���ؼ� ����Ͻÿ�. 
create index emp_deptno on emp(deptno); 

select count(*) 
from emp 
where deptno is not null 
group by deptno; 

=> index full scan�� ���ĵ� ����� ������ �ȴ�. 

���� 2. ����, ������ ��Ż������ ����ϴµ� table full scan�� �ƴ� index full scan�� �� �� �ְ�
�ε����� �ɰ� SQL�� �ۼ��Ͻÿ�. 
create index emp_job_sal on emp(job,sal); 

select job, sum(sal) 
from emp 
where job is not null 
group by job; 

=> table full scan���� �� ������ ����� �� �� �ִ�. 

���� 3. �μ���ȣ, �μ���ȣ�� ��տ����� ����ϴµ� index full scan�� �ǰڱ� �ε����� �����ϰ� 
SQL�� �ۼ��Ͻÿ�. 
create index emp_deptno_sal on emp(deptno,sal); 

select deptno, round(avg(sal)) 
from emp 
where deptno is not null 
group by deptno; 