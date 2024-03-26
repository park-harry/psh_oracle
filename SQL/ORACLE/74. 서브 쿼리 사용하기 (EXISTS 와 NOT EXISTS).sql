-- minus를 이용해서 부서 테이블에는 존재하는데 사원 테이블에는 존재하지 않는 부서번호를 출력하시오. 
select deptno from dept 
minus
select deptno from emp;

-- exists문을 이용해서 dept 테이블의 부서번호를 출력하는데 emp 테이블에 존재하는 부서번호들만 출력하시오.
select deptno 
from dept d
where exists( select 'X' from emp e 
            where e.deptno = d.deptno);
            
--departments 테이블에는 존재하는 department_id인데 employees 테이블에는 존재하지 않는 department_id를 출력하시오. 
select department_id 
from departments d
where not exists(select 'X' from employees e where e.department_id = d.department_id);

-- telecom_table에 데이터 삽입 
insert into telecom_table values('알뜰lg',15000,11);
insert into telecom_table values('알뜰sk',16000,9);

-- telecom_table에서 통신사를 출력하는데 우리반 테이블에 존재하는 통신사만 출력하시오.
select telecom
from telecom_table t
where exists(select 'X' from emp18 e where e.telecom = t.telecom);

-- telecom_table에는 존재하는 통신사인데 emp18에는 존재하지 않는 통신사를 출력하시오. 
select telecom
from telecom_table t
where not exists(select 'X' from emp18 e where e.telecom = t.telecom);
