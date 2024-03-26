-- 사원 테이블에 아래의 데이터를 입력하시오. 
-- 사원번호: 9321, 사원이름: JANE, 월급, 4000, 입사일: 2023/12/7
insert into emp(empno, ename, sal, hiredate) 
values(9231,'JANE',4000,to_date('2023/12/7','rrrr/mm/dd'));

-- 사원번호: 9422, 사원이름: JACK, 월급, 5000, 입사일: 오늘
insert into emp(empno, ename, sal, hiredate) 
values(9422,'JACK',5000,sysdate);

-- 부서 테이블에 아래의 데이터를 입력하시오 
-- 부서번호: 50, 부서명: dba team, 부서위치: SEOUL 
insert into dept (deptno, dname, loc) 
values (50,'dba team','SEOUL');

--우리 반 테이블에 아래의 데이터를 입력하시오. 
-- 학생번호: 31, 학생이름: 김인호, 나이: 33, 생일: 1991/11/04, 주소: 서울시 강남구 통신사: sk, 성별: 남 
insert into emp18(empno, ename, age, birth, address, telecom, gender) 
values (31,'김인호',33, to_date('1991/11/04','rrrr/mm/dd'),'서울시 강남구', 'sk', '남');

-- null 값 명시적 입력 
insert into emp(empno, ename, sal) 
values(7234,null, 4000);

insert into emp(empno, ename, sal) 
values(7456,'', 5000);

-- null 값 암시적 입력 
insert into emp(empno, ename, sal) 
values(3933,'ANDY',5000);

-- 이름이 null인 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename is null;

-- 아래와 같이 사원테이블의 이름에 공백을 입력하시오.
insert into emp(empno, ename, sal) 
values(4956, '   ', 6000);

-- 이름이 null이 아닌 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename is not null;

-- 위의 결과를 다시 출력하는데 이름이 공백인 사원도 제외하고 출력되게 하시오. 
select ename, sal 
from emp 
where ename is not null and ename not like '% %';