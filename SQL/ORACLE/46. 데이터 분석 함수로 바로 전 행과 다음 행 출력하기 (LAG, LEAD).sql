-- 사원 번호, 사원 이름, 바로 전행의 사원번호, 바로 다음행의 사원번호를 출력하시오. 
select empno, ename,
lag(empno,1) over (order by empno) 전행, 
lead(empno,1) over (order by empno) 다음행
from emp;

-- 이름, 입사일, 바로 전행의 입사일을 출력하시오. (입사일이 ascending 하게 출력하시오.) 
select ename, hiredate, 
lag(hiredate,1) over(order by hiredate) 전행
from emp;

-- 이름, 입사일, 바로 전에 입사한 사원 다음에 몇일 후에 입사했는지 출력하시오. 
select ename, hiredate, 
hiredate - lag(hiredate,1) over (order by hiredate) "입사 간격"
from emp; 