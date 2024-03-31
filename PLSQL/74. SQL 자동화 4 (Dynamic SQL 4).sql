���� SQL�� �Ϲ������� ������ ���� ��Ȳ���� ���ȴ�.
1. ���̺� �̸� �Ǵ� �� �̸��� ��Ÿ�ӿ� �����Ǵ� ���:
=> SQL ������ ����� �Ǵ� ���̺��̳� �� �̸��� ��Ÿ�ӿ� �����Ǵ� ��쿡�� ���� SQL�� �ʿ��ϴ�.
=> "��Ÿ��" �� ����  ���α׷��� ���� ���� �ð��� ����Ų��.
	 ���� SQL�� ����ϴ� ��Ȳ���� "��Ÿ��"�� ���α׷��� ���� ���� ��, �� �ڵ尡 ����ǰ� 
	 �����ͺ��̽��� ��ȣ�ۿ� �� ���� �ǹ��Ѵ�.
	 
2.������ ���̺� ���� �Ǵ� ��Ű�� ����:
=> DDL��: create, alter ,drop ,truncate, rename
=> PL/SQL ������ DDL ������ �����ϴ� ��� execute immediate�� ����Ѵ�.
=> �����ͺ��̽� ��ü�� ����, ���� �Ǵ� �����ؾ� �ϴ� ��� ���� SQL�� �ʿ� �մϴ�.

3. �������� �������� �����ؾ� �ϴ� ���:
=> ���̺� �ԷµǾ� �ִ� �����Ϳ� ���� �������� ��Ÿ�ӽÿ� �������� �����Ǿ�� �Ҷ� �ʿ��ϴ�.

����. ���̺� �̸� �Ǵ� �� �̸��� ��Ÿ�ӿ� �����Ǵ� ���:
CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables) LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('���̺� ' || table_rec.table_name || '�� ���ڵ� ��: ' || v_result);
    END LOOP;
END;
/

exec dynamic_table_query;

���� 1. ���� ������ �����Ͽ� ���̺� �̸��� E �� �����ϴ� ���̺�鸸 ����� ��µǰ� �ڵ带 
�����Ͻÿ�.

CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables where table_name like 'E%') LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('���̺� ' || table_rec.table_name || '�� ���ڵ� ��: ' 
														|| v_result);
    END LOOP;
END;
/

exec dynamic_table_query;

���� 2. ���� ����� �ٽ� ����ϴµ� ���̺��� �Ǽ��� ���� �ͺ��� ��µǰ� �Ͻÿ�. 
(E�� �����ϴ°� ���� ��ü ���̺�) 
����: ���̺� �̸� �Ǵ� �� �̸��� ��Ÿ�ӿ� �����Ǵ� ���:
CREATE OR REPLACE PROCEDURE dynamic_table_query
IS
    v_result NUMBER;
    v_sql VARCHAR2(200);
BEGIN
    FOR table_rec IN (SELECT table_name FROM user_tables order by num_rows desc) LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || table_rec.table_name;
        EXECUTE IMMEDIATE v_sql INTO v_result;
        DBMS_OUTPUT.PUT_LINE('���̺� ' || table_rec.table_name || '�� ���ڵ� ��: ' || v_result);
    END LOOP;
END;
/

exec dynamic_table_query;