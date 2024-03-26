-- employees 와 departments 테이블을 서로 조인해서 last_name, department_id, department_name을 출력하시오.
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d 
on(e.department_id= d.department_id);