--   시퀀스 생성하기
create sequence seq1 
increment by 1  --> 1씩 증가
start with 1    --> 1부터 시작 
maxvalue 100    --> 100이 마지막 숫자 
nocycle        --> 순환여부, cycle일 경우 1~100 나온 다음에 다시 1번부터 시작 
cache 20;      --> 20개의 번호를 미리 oracle 메모리에 올려놓겠다. 
							--> cache를 안 쓸 경우 no cache라고 쓰면 된다. 

-- 주문 테이블을 생성합니다.
create table cuppang_order
(order_num   number(10),
order_name varchar2(20),
address   varchar2(30) );

-- cuppang_order  테이블에 데이터를 입력합니다.
insert  into   cuppang_order
values( seq1.nextval, '노트북', '서울시 송파구');
insert  into   cuppang_order
values( seq1.nextval, '무선 마우스', '서울시 강남구');

select  * from  cuppang_order;

-- 시퀀스를 생성하는데 시퀀스 이름은 seq2 로 하고 시작 숫자는 1로 하고 최대값은 200으로 하고 
-- nocycle , cache 20으로 생성하시오. 
create sequence seq2 
start with 1
increment by 1 
maxvalue 200 
nocycle 
cache 20; 

-- seq2 의 현재 시퀀스 값을 확인하시오 !
select seq2.currval
from dual;
-- seq2 의 다음 시퀀스 예상 값을 확인하시오. 
select seq2.nextval
from dual; 

-- seq2 의  설정값이 어떻게 되어있는지 확인하시오 !
select * 
from user_sequences;

-- seq2 의 maxvalue 값을 400으로 늘리시오 !
alter sequence seq2 
maxvalue 400;

-- seq2의 증가치를 1이 아니라 10으로 변경하시오. 
alter sequence seq2 
increment by 10; 

-- seq3 시퀀스를 생성하는데 시작값은 1로 하고 최대값은 100000, cycle로 하고 cache는 20으로 
-- 줘서 시퀀스를 생성하시오. 증가치는 1로 하시오. (minvalue 의 default 값은 1) 
create sequence seq3 
start with 1 
increment by 1 
maxvalue 100000
cycle 
cache 20; 

-- seq2 시퀀스의  시작값을 1이 아닌  5로 변경하시오.
alter sequence seq3 
start with 5; 
-- 시퀀스의 시작값은 alter 명령어를 사용해서 수정할 수 없습니다.

-- seq3 시퀀스를 drop 하시오 !
drop sequence seq3;

create sequence seq7 
start with 1 
increment by 1 
maxvalue 100 
nocycle 
cache 20;

select seq7.nextval 
from dual;
select seq7.nextval 
from dual;

select seq7.nextval from dual;

-- 시퀀스 ocp 시험문제 환경을 내 db 에 구성하시오.
create sequence ord_seq
increment by 1 
start with 1 
maxvalue 100000 
cycle 
cache 5000;

create table ord_items(
ord_no   number(4) default ord_seq.nextval not null,
item_no  number(3),
qty      number(3),
expiry_date date, 
constraint it_pk primary key(ord_no, item_no));

insert into ord_items(item_no, qty, expiry_date)
values(22,300,sysdate);

select * from ord_items;