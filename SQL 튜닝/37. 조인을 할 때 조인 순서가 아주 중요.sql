���� 1. emp �� dept�� �����ؼ� �̸��� �μ���ġ�� ����Ͻÿ�. 
@demo 
select ename, loc 
from emp e, dept d
where e.deptno = d.deptno; 
@p 

=> dept �� emp ���� ���� ������ ���� buffer ���� 14�� 

���� 2. �̹����� ���μ����� emp -> dept ���� �ǰ� �Ͻÿ�. 
select /*+ ordered */ ename, loc 
from emp e, dept d 
where e.deptno = d.deptno; 

select  /*+ leading(e  d)  */  e.ename,  d.loc
from  emp  e,  dept   d
where   e.deptno = d.deptno; 
@p

���� 1.emp �� salgrade ���̺��� �����ؼ�  �̸��� ���ް� �޿������ ����ϴµ�
���� ������  salgrade -> emp ���� �ǰ��Ͻÿ� !

select  /*+ leading(s,e)  */ e.ename,  e.sal,  s.grade
from  emp   e,  salgrade   s
where  e.sal  between  s.losal   and  s.hisal;
@p

���� 2.���� ���μ����� emp -> salgrade ���� �ǰ��Ͻÿ�.
select  /*+ leading(e,s)  */ e.ename,  e.sal,  s.grade
from  emp   e,  salgrade   s
where  e.sal  between  s.losal   and  s.hisal;
@p