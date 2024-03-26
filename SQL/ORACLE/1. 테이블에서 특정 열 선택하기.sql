desc emp 
-- emp 테이블의 구조를 확인하는 명령어 
-- desc 는 describe의 약자 

-- 사원 테이블에서 이름과 월급을 출력하시오. 
select ename, sal from emp;

-- 사원 테이블에서 이름과 직업과 부서번호를 출력하시오. 
select ename, job, deptno from emp; 

-- 사원 테이블에서 사원번호, 이름, 월급, 입사일을 출력하시오.
select empno, ename, sal, hiredate from emp; 

-- 사원테이블에서 사원번호, 이름, 월급, 직업, 커미션, 부서번호를 출력하시오.
select empno, ename, sal, job, comm, deptno from emp;
desc dept;

-- dept 테이블의 구조를 확인하시오 
desc dept   

-- 부서 테이블에서 부서위치만 출력하시오 
select loc from dept; 

-- 부서 테이블에서 부서위치와 부서명을 출력하시오. 
select loc, dname from dept; 

