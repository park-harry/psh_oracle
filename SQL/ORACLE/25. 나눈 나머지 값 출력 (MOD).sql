select mod(10,3)
from dual;

-- 우리반 테이블에서 이름, 나이를 출력하는데 나이가 짝수인 사람만 출력하시오.
select ename, trunc((sysdate-birth)/365) as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0; 
-- 실행 순서 때문에 mod 함수 안에 'age'를 넣어도 실행이 되지를 않는다. 

-- 우리반 테이블에서 나이가 짝수인 학생들의 이름과 나이를 출력하는데 나이가 높은 
-- 학생부터 출력하시오. 
select ename, trunc((sysdate-birth)/365) as age
from emp18
where mod(trunc((sysdate-birth)/365),2) =0
order by age desc;