--   ������ �����ϱ�
create sequence seq1 
increment by 1  --> 1�� ����
start with 1    --> 1���� ���� 
maxvalue 100    --> 100�� ������ ���� 
nocycle        --> ��ȯ����, cycle�� ��� 1~100 ���� ������ �ٽ� 1������ ���� 
cache 20;      --> 20���� ��ȣ�� �̸� oracle �޸𸮿� �÷����ڴ�. 
							--> cache�� �� �� ��� no cache��� ���� �ȴ�. 

-- �ֹ� ���̺��� �����մϴ�.
create table cuppang_order
(order_num   number(10),
order_name varchar2(20),
address   varchar2(30) );

-- cuppang_order  ���̺� �����͸� �Է��մϴ�.
insert  into   cuppang_order
values( seq1.nextval, '��Ʈ��', '����� ���ı�');
insert  into   cuppang_order
values( seq1.nextval, '���� ���콺', '����� ������');

select  * from  cuppang_order;

-- �������� �����ϴµ� ������ �̸��� seq2 �� �ϰ� ���� ���ڴ� 1�� �ϰ� �ִ밪�� 200���� �ϰ� 
-- nocycle , cache 20���� �����Ͻÿ�. 
create sequence seq2 
start with 1
increment by 1 
maxvalue 200 
nocycle 
cache 20; 

-- seq2 �� ���� ������ ���� Ȯ���Ͻÿ� !
select seq2.currval
from dual;
-- seq2 �� ���� ������ ���� ���� Ȯ���Ͻÿ�. 
select seq2.nextval
from dual; 

-- seq2 ��  �������� ��� �Ǿ��ִ��� Ȯ���Ͻÿ� !
select * 
from user_sequences;

-- seq2 �� maxvalue ���� 400���� �ø��ÿ� !
alter sequence seq2 
maxvalue 400;

-- seq2�� ����ġ�� 1�� �ƴ϶� 10���� �����Ͻÿ�. 
alter sequence seq2 
increment by 10; 

-- seq3 �������� �����ϴµ� ���۰��� 1�� �ϰ� �ִ밪�� 100000, cycle�� �ϰ� cache�� 20���� 
-- �༭ �������� �����Ͻÿ�. ����ġ�� 1�� �Ͻÿ�. (minvalue �� default ���� 1) 
create sequence seq3 
start with 1 
increment by 1 
maxvalue 100000
cycle 
cache 20; 

-- seq2 ��������  ���۰��� 1�� �ƴ�  5�� �����Ͻÿ�.
alter sequence seq3 
start with 5; 
-- �������� ���۰��� alter ��ɾ ����ؼ� ������ �� �����ϴ�.

-- seq3 �������� drop �Ͻÿ� !
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

-- ������ ocp ���蹮�� ȯ���� �� db �� �����Ͻÿ�.
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