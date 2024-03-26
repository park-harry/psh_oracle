-- 부서 번호 20번인 사원들의 사원번호, 이름, 월급, 월급에 대한 비율을 출력하시오. 
// 1. 월급 나누기 전체 월급 
select empno, ename,  
round(sal/sum(sal) over(),2) as 비교비율
from emp 
where deptno =20;

// 2.  ratio_to_report 
select empno, ename, sal, 
round(ratio_to_report(sal) over (),2) as 비율
from emp 
where deptno = 20;