-- 월급이 1000 이상이고 직업이 SALESMAN인 사원들의 이름, 월급,직업을 출력하시오. 
select ename, sal, job 
	from emp 
	where sal >= 1000 and job = 'SALESMAN'; 

-- 월급이 1000 이상이거나 직업이 SALESMAN인 사원들의 이름, 월급,직업을 출력하시오.
select ename, sal, job 
	from emp 
	where sal >= 1000 or job = 'SALESMAN';  

-- 우리반 테이블에서 서울시와 경기도에서 거주하는 학생들의 이름, 주소를 출력하시오. 
select ename, address 
    from emp18 
    where address like '%서울%' or address like '%경기%';

-- 우리반 테이블에서 이메일이 naver 또는 gmail을 사용하는 학생들의 이름과 이메일을 출력하시오. 
select ename, email 
    from emp18 
    where email like '%@naver%' or email like '%@gmail%';

-- 우리반 테이블에서 통신사가 kt 인 학생들의 이름과 통신사를 출력하시오.
select ename, telecom 
    from emp18 
    where telecom = 'kt' or telecom = 'KT'; 

-- 우리반 테이블에서 통신사가 sk인 학생들의 이름과 통신사를 출력하시오.
select ename, telecom 
    from emp18 
    where telecom like 'sk%' or telecom like 'SK%';