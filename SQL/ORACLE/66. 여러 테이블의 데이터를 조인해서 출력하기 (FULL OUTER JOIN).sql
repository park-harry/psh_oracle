-- employees �� departments ���̺��� ���� �����ؼ� last_name, department_id, department_name�� ����Ͻÿ�.
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d 
on(e.department_id= d.department_id);