-- ��� ���̺� �Ʒ��� �����͸� �Է��Ͻÿ�. 
-- �����ȣ: 9321, ����̸�: JANE, ����, 4000, �Ի���: 2023/12/7
insert into emp(empno, ename, sal, hiredate) 
values(9231,'JANE',4000,to_date('2023/12/7','rrrr/mm/dd'));

-- �����ȣ: 9422, ����̸�: JACK, ����, 5000, �Ի���: ����
insert into emp(empno, ename, sal, hiredate) 
values(9422,'JACK',5000,sysdate);

-- �μ� ���̺� �Ʒ��� �����͸� �Է��Ͻÿ� 
-- �μ���ȣ: 50, �μ���: dba team, �μ���ġ: SEOUL 
insert into dept (deptno, dname, loc) 
values (50,'dba team','SEOUL');

--�츮 �� ���̺� �Ʒ��� �����͸� �Է��Ͻÿ�. 
-- �л���ȣ: 31, �л��̸�: ����ȣ, ����: 33, ����: 1991/11/04, �ּ�: ����� ������ ��Ż�: sk, ����: �� 
insert into emp18(empno, ename, age, birth, address, telecom, gender) 
values (31,'����ȣ',33, to_date('1991/11/04','rrrr/mm/dd'),'����� ������', 'sk', '��');

-- null �� ����� �Է� 
insert into emp(empno, ename, sal) 
values(7234,null, 4000);

insert into emp(empno, ename, sal) 
values(7456,'', 5000);

-- null �� �Ͻ��� �Է� 
insert into emp(empno, ename, sal) 
values(3933,'ANDY',5000);

-- �̸��� null�� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename is null;

-- �Ʒ��� ���� ������̺��� �̸��� ������ �Է��Ͻÿ�.
insert into emp(empno, ename, sal) 
values(4956, '   ', 6000);

-- �̸��� null�� �ƴ� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename is not null;

-- ���� ����� �ٽ� ����ϴµ� �̸��� ������ ����� �����ϰ� ��µǰ� �Ͻÿ�. 
select ename, sal 
from emp 
where ename is not null and ename not like '% %';