문제 1. 아래의 SQL의 실행계획을 확인하시오. 
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

문제 2. with 절을 사용하지 않은 일반 subquery 문의 실행계획을 확인하시오. 
explain plan for 
select job, sum(sal) as total 
from emp 
group by job 
having sum(sal) > (select avg(sum(sal))
					from emp 
					group by job);

select * from table(dbms_xplan.display);

문제 3. 아래의 SQL을 with 절로 변경하시오. 
select deptno, count(*) 
from emp 
group by deptno 
having count(*) >( select avg(count(*)) 
                    from emp 
                    group by deptno);
- 답: 
with deptno_cnt as 
        (select deptno, count(*) as cnt
            from emp 
            group by deptno)
    select deptno, cnt
    from deptno_cnt 
    where cnt > (select avg(cnt) from deptno_cnt);