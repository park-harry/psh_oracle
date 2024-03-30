���� 1. �Ʒ��� SQL�� �����ȹ�� Ȯ���Ͻÿ�. 
explain plan for
with job_sumsal as 
        (select job, sum(sal) as total 
        from emp 
        group by job)
select job, total 
from job_sumsal 
where total > (select avg(total) 
                from job_sumsal);  
                
select * from table(dbms_xplan.display);

���� 2. with ���� ������� ���� �Ϲ� subquery ���� �����ȹ�� Ȯ���Ͻÿ�. 
explain plan for 
select job, sum(sal) as total 
from emp 
group by job 
having sum(sal) > (select avg(sum(sal))
					from emp 
					group by job);

select * from table(dbms_xplan.display);

���� 3. �Ʒ��� SQL�� with ���� �����Ͻÿ�. 
select deptno, count(*) 
from emp 
group by deptno 
having count(*) >( select avg(count(*)) 
                    from emp 
                    group by deptno);
- ��: 
with deptno_cnt as 
        (select deptno, count(*) as cnt
            from emp 
            group by deptno)
    select deptno, cnt
    from deptno_cnt 
    where cnt > (select avg(cnt) from deptno_cnt);