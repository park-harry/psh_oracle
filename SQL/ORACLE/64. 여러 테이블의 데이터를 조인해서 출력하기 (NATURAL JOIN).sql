-- 이름, 부서위치를 출력하는데 natural join을 수행하시오. 
select e.ename, d.loc 
from emp e natural join dept d;