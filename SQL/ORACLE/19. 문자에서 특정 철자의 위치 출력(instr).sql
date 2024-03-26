-- 우리 반 테이블에서 이메일을 출력하고 이메일에서 @의 자리번호를 출력하시오. 
select email, instr(email, '@') 
from emp18; 

-- 우리 반 테이블에서 이름 출력하고 그 옆에 이름의 '일'자가 몇 번째 자리에 있는지 출력하시오. 
select ename, instr(ename, '일')
from emp18;
-- 이름에 '일' 자가 없으면 0으로 출력 

-- 우리 반 테이블에서 이름에 '일'자를 포함하고 있는 학생들의 이름을 출력하시오.
select ename
from emp18
where instr(ename, '일') != 0 ; 

-- 우리 반 테이블에서 이메일을 출력하고, 이메일에서 @ 앞에 철자만 출력하시오. 
select ename, substr(email, 1, instr(email,'@')-1)
from emp18; 

-- 우리 반 테이블에서 이메일을 출력하는데 이름과 이메일 도메인만 출력하시오. 
-- ex) 박성환 gmail 
select ename, substr(email, instr(email,'@')+1, instr(email,'.')-instr(email,'@')-1) 
from emp18;

-- 우리 반 테이블에서 이메일 도메인을 출력하고 이메일 도메인 별 건수를 출력하는데 건수가 
-- 높은 것부터 출력하시오. 
select substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1), count(*) 
from emp18
group by substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1)
order by count(*) desc;
