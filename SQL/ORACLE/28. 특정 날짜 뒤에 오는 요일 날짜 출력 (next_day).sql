-- 오늘 날짜에서 바로 돌아오는 월요일의 날짜를 출력하시오. 
select next_day(sysdate,'월요일')
from dual;

-- 오늘부터 100달 뒤에 돌아오는 월요일의 날짜를 출력하시오. 
select next_day(sysdate +(interval '100' month),'월요일')
from dual;

select next_day(add_months(sysdate,100),'월요일')
from dual;

-- 오늘부터 100년 뒤에 돌아오는 월요일의 날짜를 출력하시오. 
select next_day( add_months(sysdate,100*12),'월요일')
from dual;
-- interval로는 99까지 밖에 안된다. 