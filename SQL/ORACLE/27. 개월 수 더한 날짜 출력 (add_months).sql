-- 오늘 날짜에서 3일을 더한 날짜를 출력하시오. 
select sysdate + 3
from dual; 

-- 오늘 날짜에서 3달 뒤의 날짜를 출력하시오. 
select add_months(sysdate,3)
from dual;

-- 오늘 날짜에서 3년 뒤 날짜를 출력하시오.
select sysdate +(interval '3' year)
from dual; 

-- 이름 뽑고 생일 뽑고, 생일에서 50년을 더한 날짜를 출력하시오. 
alter session set nls_date_format = 'YYYY/MM/DD';
--  접속한 session(창)에서 년도를 4자리로 바꿔준다. 창을 종료하면 다시 원래대로 돌아온다. 
select ename, birth, birth + (interval '50' year)
from emp18;