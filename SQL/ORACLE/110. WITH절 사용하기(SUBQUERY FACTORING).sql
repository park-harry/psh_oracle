문제 1-1. 서브쿼리로는 구현 못하는 결과 (아래의 쿼리문은 error가 발생한다) 
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

문제 1-2. 위의 결과를 with절로 만드시오. 
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
=> temp table 2개를 만들어서 실행 (temp table 개수에 제한은 없다.) 