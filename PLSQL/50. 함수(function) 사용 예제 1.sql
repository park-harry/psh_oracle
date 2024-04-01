- 사용자 정의 함수 문법
create  or  replace  function   함수이름
(입력변수   데이터 유형)
is | as
		return 출력 데이터 유형
begin
		실행문		
		return  출력변수;	
end;
/


사용자 정의 함수 생성 예제 1.
이름을 입력했을때, 해당 사원의 월급의 순위가 출력되게하는 함수를 생성하시오.

create or replace function fun178
    (p_ename emp.ename%type)
    return number 
		as 
				v_rank number(5);
begin
    select 순위 into v_rank
    from (select ename, dense_rank() over (order by sal desc) 순위 
            from emp)
    where ename = upper(p_ename);
    
    return v_rank;
end;
/

- 결과확인 
SELECT ename, sal, fun178(ename) 순위
FROM emp
ORDER BY 순위;

문제 1. 위에서 생성한 사용자 정의 함수 fun178을 이용해서 사원 테이블에서 월급의 순위가 12위인 
사원의 이름과 월급을 출력하시오. 
SELECT ename, sal, fun178(ename) 순위
FROM emp
where fun178(ename) = 12
ORDER BY 순위;

문제 2. 위의 결과를 사용자 정의 함수 이용하지 말고 출력하시오. 
select ename, sal 
from ( select ename, sal, dense_rank() over (order by sal desc) as 순위 
        from emp)
where 순위 = 12;


사용자 정의 함수 생성 예제 2.
위의 함수코드를 수정해서 아래와 같이 결과가 나오게 하시오.
	-> 즉, 월급의 순위가 1 ~ 3등까지는 고소득,
	-> 나머지 순위는 저소득 이란 글씨가 출력되게 하는 함수를 생성하시오.

create or replace function fun179
(p_ename emp.ename%type) 
return varchar2
as 
    v_rank  number(10);
    v_msg   varchar2(20);
begin 
    select 순위 into v_rank
    from (  select ename, dense_rank() over (order by sal desc) 순위 
            from emp )
    where ename = upper(p_ename);
    
    if v_rank <4 then 
        v_msg := '고소득';
    else 
        v_msg := '저소득';
    end if;
    
    return v_msg;
end;
/

- 결과확인 
SELECT ename, sal, fun179(ename) 소득
FROM emp
order by 소득;

문제 3. 위에서 만든 함수를 사용해서 고소득인 사원의 이름과 월급을 출력하시오 !
select ename, sal 
from emp 
where fun179(ename) = '고소득';

문제 4. 소득이 고소득자인 사원들을 출력하는데 월급이 3000 이상인 사원들만 출력하고 월급이 높은 사원
순으로 출력되게 하시오. 
select ename, sal 
from emp 
where fun179(ename) = '고소득' and sal>=3000
order by sal desc;

문제 5. 우리반 테이블에서 나이를 입력하면 나이대가 출력되는 함수를 생성하시오. 
select ename, func3(age)
from emp18;

- 답: 
create or replace function func3 
(p_age emp18.age%type)
return varchar2 
as 
    v_agedae varchar2(10);
begin 
    select substr(p_age,1,1)||'0대' into v_agedae
    from dual;    
   
    return v_agedae;
end;
/

select ename, func3(age) as 나이대 
from emp18;