예제 1. 아래의 코드를 실행하세요.
DECLARE
		v_father_job    VARCHAR2(20) := 'engineer';
		v_job_sal    NUMBER := 80000;
BEGIN
				DECLARE
						v_child_job     VARCHAR2(20) := 'teacher';
						v_job_sal  NUMBER := 30000;
				BEGIN
						dbms_output.put_line('Father''s job: ' || v_father_job);
						dbms_output.put_line('Father''s Salary: ' || v_job_sal );
						dbms_output.put_line('Child''s job: ' || v_child_job );
				END;
		dbms_output.put_line('Child''s Salary: ' || v_job_sal );
END;
/

=>  아빠의 월급과 아들의 월급이 서로 잘못 출력되고 있다.
 
Father's job: engineer
Father's Salary: 30000
Child's job: teacher
Child's Salary: 80000 

예제 2. 위의 결과가 제대로 출력될 수 있도록 <<outer>> 레이블을 이용해서 코드를 수정하시오 !
begin  <<outer>>
DECLARE
		v_father_job    VARCHAR2(20) := 'engineer';
		v_job_sal    NUMBER := 80000;
BEGIN
				DECLARE
						v_child_job     VARCHAR2(20) := 'teacher';
						v_job_sal  NUMBER := 30000;
				BEGIN
						dbms_output.put_line('Father''s job: ' || v_father_job);
						dbms_output.put_line('Father''s Salary: ' || outer.v_job_sal );
						dbms_output.put_line('Child''s job: ' || v_child_job );
						dbms_output.put_line('Child''s Salary: ' || v_job_sal );
				END;
END;
end outer;
/

Father's job: engineer
Father's Salary: 80000
Child's job: teacher
Child's Salary: 30000 

문제 1. 아래의 코드가 실행되지 않는 이유를 설명하세요
begin  <<outer>>
DECLARE
		v_father_job    VARCHAR2(20) := 'engineer';
		v_job_sal    NUMBER := 80000;
BEGIN
			DECLARE
			v_child_job     VARCHAR2(20) := 'teacher';
			v_job_sal  NUMBER := 30000;
			BEGIN
			dbms_output.put_line('Father''s job: ' || v_father_job);
			END;
	dbms_output.put_line('Father''s job: ' || v_child_job);
	END;
end outer;
/

=> 내부 변수가 외부 block에서 실행되었으므로 위의 코드는 실행되지 않는다. 