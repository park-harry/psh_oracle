-- �츮 �� ���̺��� �̸����� ����ϰ� �̸��Ͽ��� @�� �ڸ���ȣ�� ����Ͻÿ�. 
select email, instr(email, '@') 
from emp18; 

-- �츮 �� ���̺��� �̸� ����ϰ� �� ���� �̸��� '��'�ڰ� �� ��° �ڸ��� �ִ��� ����Ͻÿ�. 
select ename, instr(ename, '��')
from emp18;
-- �̸��� '��' �ڰ� ������ 0���� ��� 

-- �츮 �� ���̺��� �̸��� '��'�ڸ� �����ϰ� �ִ� �л����� �̸��� ����Ͻÿ�.
select ename
from emp18
where instr(ename, '��') != 0 ; 

-- �츮 �� ���̺��� �̸����� ����ϰ�, �̸��Ͽ��� @ �տ� ö�ڸ� ����Ͻÿ�. 
select ename, substr(email, 1, instr(email,'@')-1)
from emp18; 

-- �츮 �� ���̺��� �̸����� ����ϴµ� �̸��� �̸��� �����θ� ����Ͻÿ�. 
-- ex) �ڼ�ȯ gmail 
select ename, substr(email, instr(email,'@')+1, instr(email,'.')-instr(email,'@')-1) 
from emp18;

-- �츮 �� ���̺��� �̸��� �������� ����ϰ� �̸��� ������ �� �Ǽ��� ����ϴµ� �Ǽ��� 
-- ���� �ͺ��� ����Ͻÿ�. 
select substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1), count(*) 
from emp18
group by substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1)
order by count(*) desc;
