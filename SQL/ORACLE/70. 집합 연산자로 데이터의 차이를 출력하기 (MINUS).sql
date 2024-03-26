-- 2017년도에는 존재했는데 2022년에 사라진 스타벅스 매장이 총 몇개인지 출력하시오. 
select count(*) from 
(select 상호명 
from market_2017
where 상호명 like '%스타벅스%'
minus
select 상호명 
from market_2022
where 상호명 like '%스타벅스%');



