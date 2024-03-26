-- 이름과 월급을 출력하는데 월급을 출력할 때 월급의 나머지 자리에 *을 채워넣으시오. 
select ename, lpad(sal,10,'*') 
	from emp;
 -- sal 을 출력하는데 전체를 10자리로 잡고, 나머지 빈자리에는 * 을 채워 넣어라. 
select ename, rpad(sal,10,'*') 
	from emp;
