-- 오늘 날짜의 달에 마지막 날짜를 출력하시오. 
select sysdate, last_day(sysdate)
from dual;

-- 오늘 날짜에서 하루를 더한 날짜의 날짜를 출력하고 그 옆에 그 날짜의 달의 마지막 날짜를 출력하시오.
select sysdate +1, last_day(sysdate +1)
from dual; 