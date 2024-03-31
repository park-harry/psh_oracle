문제 1. 직업별 입사한 년도별 토탈월급을 출력하시오 !
select  job,  sum( decode( to_char(hiredate, 'RRRR'), '1980' , sal, null)  )  as "1980",
							sum( decode( to_char(hiredate, 'RRRR'), '1981' , sal, null)  )  as "1981",
							sum( decode( to_char(hiredate, 'RRRR'), '1982' , sal, null)  )  as "1982",
							sum( decode( to_char(hiredate, 'RRRR'), '1983' , sal, null)  )  as "1983"
from  emp
group by  job;

문제 2. 부서번호별 입사한 년도별 토탈월급을 출력하세요.
select  deptno,  sum( decode( to_char(hiredate, 'RRRR'), '1980' , sal, null)  )  as "1980",
                sum( decode( to_char(hiredate, 'RRRR'), '1981' , sal, null)  )  as "1981",
                sum( decode( to_char(hiredate, 'RRRR'), '1982' , sal, null)  )  as "1982",
                sum( decode( to_char(hiredate, 'RRRR'), '1983' , sal, null)  )  as "1983"
from  emp
group by  deptno;