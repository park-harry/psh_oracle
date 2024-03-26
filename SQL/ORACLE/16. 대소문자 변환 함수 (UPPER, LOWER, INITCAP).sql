-- 사원 테이블에서 이름이 SCOTT 인 사원의 데이터를 검색하는데 이름의 데이터가 대문자로 저장되어 있든, 
-- 소문자로 저장 되어 있든 상관없이 데이터가 검색되게 하시오. 
select ename 
    from emp 
    where lower(ename) = 'scott';

select ename 
    from emp 
    where upper(ename) = 'SCOTT';

-- 우리반 테이블에서 통신사가 kt 인 학생들의 이름과 통신사를 출력하시오.
select ename, telecom 
    from emp18 
    where lower(telecom) = 'kt' or lower(telecom) = '알뜰 kt';

-- 통신사가 sk인 학생들의 이름과 통신사를 출력하시오.
select ename, telecom 
    from emp18 
    where lower(telecom) like '%sk%';