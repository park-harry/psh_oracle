-- 부서번호가 20번인 사원들과 월급이 같지 않은 사원들의 이름, 월급을 출력하시오. 
select ename, sal 
from emp 
where deptno not in (select deptno from emp where deptno=20);

-- KING에게 보고 하는 사원들의 이름을 출력하시오. 
select ename 
from emp 
where mgr = (select empno from emp where ename = 'KING');

-- 관리자인 사원들의 이름을 출력하시오. (자기 밑에 직속 부하 사원들이 있는 사원들) 
select ename 
from emp 
where empno in (select mgr from emp);

-- 관리자가 아닌 사원들의 이름을 출력하시오. 
select ename 
from emp 
where empno not in (select mgr from emp where mgr is not null);

-- 직업이 salesman인 사원들과 월급이 같은 사원들의 이름, 월급, 커미션을 출력하시오. 
select ename, sal, comm 
from emp 
where sal in (select sal from emp where job = 'SALESMAN');

-- 직업이 salesman인 사원들과 월급도 같고 커미션도 같은 사원들의 이름, 월급, 커미션, 직업을 
-- 출력하시오. 
select ename, sal, comm, job 
from emp 
where sal in (select sal from emp where job = 'SALESMAN')
and comm in(select comm from emp where job = 'SALESMAN') ;

// pairwise 방식 
select ename, sal, comm, job 
from emp 
where (sal,comm) in (select sal,comm from emp where job = 'SALESMAN');

-- 우리반에서 통신사가 kt인 학생들과 나이가 같고 성별이 같은 학생들의 이름, 나이, 성별, 
-- 통신사를 출력하시오. (non piar wise 방식으로) 
select ename, age, gender, telecom 
from emp18 
where age in (select age from emp18 where telecom = 'kt')
and gender in (select gender from emp18 where telecom = 'kt');

-- 위의 결과를 다시 출력하는데 pairwise 방식으로 출력하시오. 
select ename, age, gender, telecom 
from emp18 
where (age,gender) in (select age,gender from emp18 where telecom = 'kt');