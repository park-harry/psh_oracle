※ 휴지통 속에 있는 테이블을 복구하는 명령어 
예제 1. 휴지통 비우기 
purge recyclebin;

문제 1-1. 사원 테이블에 월급에 인덱스를 생성하시오. 
create index emp_sal 
on emp(sal);

문제 1-2. emp 테이블을 drop 하시오. 
drop table emp;

문제 1-3. 휴지통을 확인한다. 
show recyclebin;

문제 1-4. 휴지통에서 emp 테이블을 복구한다. 
flashback table emp to before drop;

문제 1-5. 테이블 이름 확인하는 방법 
select table_name 
from user_tables;

문제 1-6. emp을 drop 하고 flashback으로 살린 후에 emp_sal index도 다시 살아났는지 확인하시오. 
select index_name 
from user_indexes
where table_name = 'EMP';

문제 1-7. BIN$RL5iBzqrRKeHKP6exvkjmQ==$1 을 emp_sal로 변경하시오. 
alter index "BIN$RL5iBzqrRKeHKP6exvkjmQ==$1" rename to emp_sal;