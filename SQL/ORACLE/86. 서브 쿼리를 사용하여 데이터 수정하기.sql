-- SCOTT �� ���� ������ ���� ������� ������ 8000���� �����Ͻÿ�. 
update emp 
set sal = 8000
where job = (select job from emp where ename = 'SCOTT');

-- ALLEN ���� �ʰ� �Ի��� ������� commission �� 9000���� �����Ͻÿ�. 
update emp 
set comm = 9000 
where hiredate > (select hiredate from emp where ename = 'ALLEN');

-- KING�� ������ ALLEN�� �������� �����Ͻÿ�. 
update emp 
set sal = (select sal from emp where ename = 'ALLEN') 
where ename = 'KING';

-- KING�� �μ���ȣ�� JAMES�� �μ���ȣ�� �����Ͻÿ�. 
update emp 
set deptno = (select sal from emp where ename = 'JAMES') 
where ename = 'KING';

-- emp�� dept�� �����ؼ� �̸�, ��� ���̺��� �μ���ġ, �μ� ���̺��� �μ���ġ��
-- ����Ͻÿ�. 
select e.ename, e.loc as emp_loc, d.loc as dept_loc
from emp e, dept d 
where e.deptno = d.deptno;

-- update ���� ���� ������ �̿��ؼ� dept_loc�� �÷��� emp_loc �÷��� �����Ͻÿ�. 
update (select e.ename, e.loc as emp_loc, d.loc as dept_loc
from emp e, dept d 
where e.deptno = d.deptno) 
set emp_loc = dept_loc;

-- emp18 ���̺� t_price �÷��� �����͸� null�� �����ϰ� commit �Ͻÿ�. 
update emp18 
set t_price = null;

commit;

-- emp18 ���̺�� telecom_table�� �����ؼ� �̸�, emp18 ���̺��� t_price, telecom_table�� t_price ����Ͻÿ�. 
select e.ename, e.t_price, t.t_price
from emp18 e, telecom_table t
where e.telecom = t.telecom;

-- update ���� ���� ������ �̿��ؼ� TELECOM_t_price�� �÷��� EMP_t_price �÷��� �����Ͻÿ�. 
update (select e.ename, e.t_price as emp_tprice, t.t_price as telecom_tprice
from emp18 e, telecom_table t
where e.telecom = t.telecom)
set emp_tprice = telecom_tprice;

-- sales200�� date_id�� ���� �����ϴµ� time2�� date_id�� ���� �����Ͻÿ�. 
-- (merge ���̳� update ���� �̿��� ���������� �ϸ� �ȴ�.) 
update (select s.date_id as s_date_id, t.date_id as t_date_id 
from sales200 s, time2 t 
where s.rn = t.rn)
set s_date_id = t_date_id;