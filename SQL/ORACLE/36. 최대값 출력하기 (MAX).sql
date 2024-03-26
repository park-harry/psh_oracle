-- 사원 테이블에서 최대 월급을 출력하시오. 
select max(sal) 
from emp;

-- 직업이 salesman 인 사원들 중에서 최대 월급을 출력하시오. 
select max(sal) 
from emp 
where job = 'SALESMAN';

-- 위의 결과를 다시 출력하는데 직업도 같이 출력하시오. 
select job, max(sal)
from emp 
where job = 'SALESMAN'
group by job;

-- 위의 결과에서 where 절을 빼고 실행하면 각 job 마다 max(sal)이 나온다. 
select job, max(sal) 
from emp 
group by job; 

-- 부서번호, 부서번호 별 최대 월급을 출력하시오. 
select deptno, max(sal) 
from emp 
group by deptno;

-- 직업, 직업별 최대 월급을 출력하는데 직업이 salesman은 제외하고 출력하시오.
select job, max(sal) 
from emp 
where job <> 'SALESMAN'
group by job;

-- 위의 결과를 다시 출력하는데 직업별 최대월급이 높은 것부터 출력하시오.
select job, max(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by max(sal) desc;

-- 우리 반 테이블에 나이 컬럼 추가하기 
alter table emp18 add age number(10); 

-- 추가한 컬럼 age에 해당 학생의 나이로 값을 갱신하시오. 
update emp18 outer 
set age=(select trunc(months_between(sysdate,birth)/12)
        from emp18 
        where empno = outer.empno);

-- (난이도 중)통신사, 통신사 별 최대 나이를 출력하시오. 
select telecom, max(age) 
from emp18 
group by telecom;