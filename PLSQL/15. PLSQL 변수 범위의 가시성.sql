���� 1. �Ʒ��� �ڵ带 �����ϼ���.
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

=>  �ƺ��� ���ް� �Ƶ��� ������ ���� �߸� ��µǰ� �ִ�.
 
Father's job: engineer
Father's Salary: 30000
Child's job: teacher
Child's Salary: 80000 

���� 2. ���� ����� ����� ��µ� �� �ֵ��� <<outer>> ���̺��� �̿��ؼ� �ڵ带 �����Ͻÿ� !
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

���� 1. �Ʒ��� �ڵ尡 ������� �ʴ� ������ �����ϼ���
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

=> ���� ������ �ܺ� block���� ����Ǿ����Ƿ� ���� �ڵ�� ������� �ʴ´�. 