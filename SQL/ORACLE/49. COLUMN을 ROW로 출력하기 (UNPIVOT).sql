-- 아래와 같이 sql을 작성 시, 물품이 수백개면 코드가 너무 길어진다. 
select sum(bicycle), sum(camera), sum(notebook)
from order2;

-- column을 row로 바꾸기 
select * from order2
unpivot( 갯수 for 아이템 in (bicycle, camera, notebook));

select * from order2;

-- 위의 unpivot 문의 결과로 테이블을 생성한다. (dba만의 특권) 
create table order3 as
select * 
from order2 
unpivot (갯수 for 아이템 in (bicycle, camera, notebook));
commit;

select 아이템, sum(갯수)
from order3
group by 아이템; 

-- unpivot 문을 이용해서 crime_time의 column을 row로 변경하시오. 
select * from crime_time
unpivot(건수 for 시간 in (f0t3,f3t6,f6t9,f9t12,f12t15,f15t18,f18t21,f21t24));

-- 위의 결과를 crime_time2 라는 테이블로 생성하시오. 
create table crime_time2 
as
select * from crime_time
unpivot(건수 for 시간 in (f0t3,f3t6,f6t9,f9t12,f12t15,f15t18,f18t21,f21t24));
commit;

-- 살인이 가장 많이 일어나는 시간대를 출력하시오. 
select 시간
from crime_time2 
where crime_type = '살인'
order by 건수 desc fetch first 1 row only;

-- 방화가 가장 많이 일어나는 시간대 순위 1위와 2위를 출력하시오. 
select 시간
from crime_time2 
where crime_type = '방화'
order by 건수 desc fetch first 2 row only;