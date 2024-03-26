-- 이름과 부서위치를 출력하는데 using 절을 사용한 조인으로 수행하시오. 
select e.ename, d.loc 
from emp e join dept d 
using (deptno);

-- using 절을 사용한 조인 문법으로 직업이 salesman인 사원들의 이름, 월급, 부서위치를 출력하시오. 
select e.ename, e.sal, d.loc 
from emp e join dept d 
using (deptno) 
where e.job = 'SALESMAN';

