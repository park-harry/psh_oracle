���� 1-1. ���������δ� ���� ���ϴ� ��� (�Ʒ��� �������� error�� �߻��Ѵ�) 
select deptno, sum(sal) 
from (select job, sum(sal) total 
        from emp 
        group by job) as job_sumsal , 
        (select deptno, sum(sal) total 
        from emp 
        group by deptno 
        having sum(sal) > (select avg(total)+ 3000 
                            from job_sumsal) 
            ) as deptno_sumsal;

���� 1-2. ���� ����� with���� ����ÿ�. 
with job_sumsal as (select job, sum(sal) as total 
                    from emp 
                    group by job), 
    deptno_sumsal as (select deptno, sum(sal) as total 
                    from emp 
                    group by deptno
                    having sum(sal) > (select avg(total) + 3000
                                      from job_sumsal))
select deptno, total 
from deptno_sumsal;
=> temp table 2���� ���� ���� (temp table ������ ������ ����.) 