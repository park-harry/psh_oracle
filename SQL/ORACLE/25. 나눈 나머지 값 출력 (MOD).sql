select mod(10,3)
from dual;

-- �츮�� ���̺��� �̸�, ���̸� ����ϴµ� ���̰� ¦���� ����� ����Ͻÿ�.
select ename, trunc((sysdate-birth)/365) as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0; 
-- ���� ���� ������ mod �Լ� �ȿ� 'age'�� �־ ������ ������ �ʴ´�. 

-- �츮�� ���̺��� ���̰� ¦���� �л����� �̸��� ���̸� ����ϴµ� ���̰� ���� 
-- �л����� ����Ͻÿ�. 
select ename, trunc((sysdate-birth)/365) as age
from emp18
where mod(trunc((sysdate-birth)/365),2) =0
order by age desc;