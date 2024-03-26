-- 사원 테이블에서 이름이 S로 시작하는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename like 'S%';

-- 사원 테이블에서 이름의 끝 철자가 T로 끝나는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename like '%T';

-- 우리반 테이블에서 성씨가 김씨인 학생들의 이름과 주소를 출력하시오. 
select ename, address 
from emp18 
where ename like '김%';

-- 우리반 테이블에서 성씨가 김씨가 아닌 학생들의 이름과 주소를 출력하시오.
select ename, address 
from emp18 
where ename not like '김%'; 

-- 우리반 테이블에서 전공(major)에 '경영'을 포함하고 있는 학생들의 
-- 이름과 전공을 출력하시오. 
select ename, major 
from emp18 
where major like '%경영%';
-- 포함하고 있다는 가정이기 때문에 % 를 양 옆에 붙여준다. 

-- 우리반 테이블에서 naver 메일을 사용하는 학생들의 이름과 이메일을 출력하시오.
select ename, email 
from emp18 
where email like '%naver%'; 

--사원 테이블에서 이름의 2번째 철자기 %인 사원들의 이름과 월급을 출력하시오. 
select ename 
from emp 
where ename like '_m%%' escape 'm';
-- m 바로 다음에 나오는 % 는 특수문자 %

--사원 테이블에서 이름의 2번째 철자가 M인 사원들의 이름을 출력하시오. 
select ename 
from emp 
where ename like '_M%';

--사원 테이블에서 이름의 3번째 철자가 L인 사원들의 이름을 출력하시오. 
select ename 
from emp 
where ename like '__L%';

-- 이름의 2번째 철자와 3번째 철자가 %인 사원의 이름을 출력하시오.
select ename 
from emp 
where ename like '_m%m%%' escape 'm'; 

-- 우리반 테이블에서 서울시에서 거주하는 학생들의 이름과 주소를 출력하시오.
select ename, address
from emp18 
where address like '서울%'; 

-- 우리반 테이블에서 생일이 11월 달인 학생들의 이름과 생일을 출력하시오.
select ename, birth 
from emp18 
where birth like '%/11/%'; 


-- 사원 테이블에서 이름에 'S'자를 포함하고 있는 사원들의 이름과 입사일을 출력하는데 입사일이 
-- 최근에 입사한 사원부터 출력하시오.
select ename, hiredate 
from emp 
where ename like '%S%'
order by hiredate desc;