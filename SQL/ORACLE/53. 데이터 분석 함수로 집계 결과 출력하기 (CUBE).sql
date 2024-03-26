-- 부서 번호, 부서번호별 총 월급을 출력하는데 전체 총 월급을 맨 위에 출력하시오. 
select deptno, sum(sal) 
from emp 
group by cube(deptno);

-- 통신사를 출력하고 통신사별 인원수를 출력하는데 전체 학생 인원수가 맨 위에 출력되게 하시오. 
select telecom, count(*) 
from emp18 
group by cube(telecom);

select deptno, job, sum(sal) 
from emp 
group by cube(deptno, job);