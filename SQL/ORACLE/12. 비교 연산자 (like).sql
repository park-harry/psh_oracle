-- ��� ���̺��� �̸��� S�� �����ϴ� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename like 'S%';

-- ��� ���̺��� �̸��� �� ö�ڰ� T�� ������ ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename like '%T';

-- �츮�� ���̺��� ������ �达�� �л����� �̸��� �ּҸ� ����Ͻÿ�. 
select ename, address 
from emp18 
where ename like '��%';

-- �츮�� ���̺��� ������ �达�� �ƴ� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address 
from emp18 
where ename not like '��%'; 

-- �츮�� ���̺��� ����(major)�� '�濵'�� �����ϰ� �ִ� �л����� 
-- �̸��� ������ ����Ͻÿ�. 
select ename, major 
from emp18 
where major like '%�濵%';
-- �����ϰ� �ִٴ� �����̱� ������ % �� �� ���� �ٿ��ش�. 

-- �츮�� ���̺��� naver ������ ����ϴ� �л����� �̸��� �̸����� ����Ͻÿ�.
select ename, email 
from emp18 
where email like '%naver%'; 

--��� ���̺��� �̸��� 2��° ö�ڱ� %�� ������� �̸��� ������ ����Ͻÿ�. 
select ename 
from emp 
where ename like '_m%%' escape 'm';
-- m �ٷ� ������ ������ % �� Ư������ %

--��� ���̺��� �̸��� 2��° ö�ڰ� M�� ������� �̸��� ����Ͻÿ�. 
select ename 
from emp 
where ename like '_M%';

--��� ���̺��� �̸��� 3��° ö�ڰ� L�� ������� �̸��� ����Ͻÿ�. 
select ename 
from emp 
where ename like '__L%';

-- �̸��� 2��° ö�ڿ� 3��° ö�ڰ� %�� ����� �̸��� ����Ͻÿ�.
select ename 
from emp 
where ename like '_m%m%%' escape 'm'; 

-- �츮�� ���̺��� ����ÿ��� �����ϴ� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address
from emp18 
where address like '����%'; 

-- �츮�� ���̺��� ������ 11�� ���� �л����� �̸��� ������ ����Ͻÿ�.
select ename, birth 
from emp18 
where birth like '%/11/%'; 


-- ��� ���̺��� �̸��� 'S'�ڸ� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� �Ի����� 
-- �ֱٿ� �Ի��� ������� ����Ͻÿ�.
select ename, hiredate 
from emp 
where ename like '%S%'
order by hiredate desc;