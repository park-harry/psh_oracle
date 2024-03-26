-- 다음과 같이 출력되는 컬럼명을 한글로 출력되게 하시오 
select empno as 사원번호, ename as 사원이름, sal as 월급 
    from emp;
-- as 는 생략 가능 

-- 사원이름, 직업과 부서번호를 출력하는데 컬럼명을 한글로 출력하시오.
select ename as "사원 이름", job as 직업, deptno as "부서 번호" 
    from emp;
    
--example 
select ename as "사원 이름", sal as "salary*"
	from emp; 
    
-- column 명에 대소문자를 구분해서 출력하고 싶다면 double quotation mark 를 둘러줘야 한다. 
select ename as "Employee name", sal as "Salary"
from emp; 

-- 부서 테이블에서 부서 번호와 부서 위치를 출력하는데 column 명이 Department number와 Department location 으로 출력되게 하시오.
select deptno "Department number", loc "location"
from dept;

--사원 테이블에서 이름, 월급, 월급 +300 *2를 출력하시오 
select ename, sal, (sal+300)*2
from emp;

-- 위의 결과를 다시 출력하는데 월급 +300 *2의 컬럼명을 보너스로 출력하시오
select ename, sal, (sal+300)*2 as bonus
from emp;