-- 이름, 월급, 월급에 대한 순위, 순위에 대한 비율을 출력하시오. 
select ename, sal, rank() over (order by sal desc) 순위, 
                   round(rank() over (order by sal desc)/14,2) 비율
from emp;

-- 회사의 데이터 베이스는 지금 이 시간에도 데이터가 계속 insert 되고 있으므로 위와 같이 14라고 쓸 수 없다.
-- 그렇다고 count(*) 을 쓰면 에러가 발생한다. 그래서 필요한 데이터 분석함수가 cume_dist이다. 
select ename, sal, rank() over(order by sal desc) 순위, 
                    round(cume_dist() over (order by sal desc),2) 비율
from emp;