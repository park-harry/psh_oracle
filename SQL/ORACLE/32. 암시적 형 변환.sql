-- 다음의 SQL이 에러가 안나고 잘 수행이 되는가? 
select ename, sal
from emp
where sal = '3000';
-- 실행된다. -> 암시적 형 변환이 발생됨. 
-- single quotation mark를 쓰면 문자형으로 변환되서 원래대로라면 에러가 나야 되지만  
-- 오라클이 암시적으로 문자형인 '3000'을 숫자형인 3000으로 변환했다. 

-- 확인해보기 (SQL의 실행 계획을 확인하는 방법 
explain plan for 
select ename, sal
from emp
where sal = '3000';
-- 설명 보기 
select * from table(dbms_xplan.display);

-- '3000'이 3000으로 변환되었다. 

--  다음의 SQL이 에러가 안나고 잘 수행이 되는가? 
select ename, sal
from emp 
where sal like '30%';

-- 실행된다. -> 암시적 형 변환이 발생됨. 
-- sal column 이 문자형으로 변환되었다. 
-- 원래대로라면 숫자형으로 변환되어야 하지만 %를 숫자형으로 변화할 수 없기 때문에 
-- sal 이 문자형으로 변환되었다. 

-- 아래의 테이블과 데이터를 만들고 아래의 쿼리를 실행하면 실행되는지 확인하시오. 
create   table   emp100
( ename   varchar2(10),
  sal         varchar2(10) );

insert  into  emp100  values('scott', '3000' );
insert  into  emp100  values('smith', '1200' );
commit;

select   ename, sal
  from  emp100
  where  sal = 3000;
-- 암시적 형 변환 발생 
-- sal column 이 숫자형으로 변환되었다. 