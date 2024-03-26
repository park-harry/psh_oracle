-- 사원 테이블에서 직업이 SALESMAN인 사원들을 지우시오. 
delete from emp 
where job = 'SALESMAN';

rollback; 
-- 부서번호가 20번인 사원들을 지우시오. 
delete from emp 
where deptno=20;

-- SCOTT 보다 더 많은 월급을 받는 사원들을 지우시오. 
delete from emp 
where sal > (select sal from emp where ename = 'SCOTT');

-- ALLEN보다 늦게 입사한 사원들을 지우시오. 
delete from emp 
where hiredate > (select hiredate from emp where ename = 'ALLEN');




