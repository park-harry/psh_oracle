-- ������ 1000 �̻��̰� ������ SALESMAN�� ������� �̸�, ����,������ ����Ͻÿ�. 
select ename, sal, job 
	from emp 
	where sal >= 1000 and job = 'SALESMAN'; 

-- ������ 1000 �̻��̰ų� ������ SALESMAN�� ������� �̸�, ����,������ ����Ͻÿ�.
select ename, sal, job 
	from emp 
	where sal >= 1000 or job = 'SALESMAN';  

-- �츮�� ���̺��� ����ÿ� ��⵵���� �����ϴ� �л����� �̸�, �ּҸ� ����Ͻÿ�. 
select ename, address 
    from emp18 
    where address like '%����%' or address like '%���%';

-- �츮�� ���̺��� �̸����� naver �Ǵ� gmail�� ����ϴ� �л����� �̸��� �̸����� ����Ͻÿ�. 
select ename, email 
    from emp18 
    where email like '%@naver%' or email like '%@gmail%';

-- �츮�� ���̺��� ��Ż簡 kt �� �л����� �̸��� ��Ż縦 ����Ͻÿ�.
select ename, telecom 
    from emp18 
    where telecom = 'kt' or telecom = 'KT'; 

-- �츮�� ���̺��� ��Ż簡 sk�� �л����� �̸��� ��Ż縦 ����Ͻÿ�.
select ename, telecom 
    from emp18 
    where telecom like 'sk%' or telecom like 'SK%';