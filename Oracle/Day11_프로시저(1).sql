--�� �н���� : sql Ȱ��
-- 	���� 3�� ���� SQL������ PDF�� ��ȯ�Ͽ� ����÷���ϼ��� (�ۼ��� ����)
-- ����Ʈ�ϱ⿡�� PDF �����ϸ� �� 
--���� �ۼ��ؼ� ������ Ȯ���ϰ� ��� �����ϼ���
-- tbl_product, tbl_member, tbl_buy�� �⺻���� �մϴ�.

-- ���̺���� �ٸ��ϴ�. ���̺��� �÷�, �⺻Ű, �ܷ�Ű, �⺻�� �����ؼ� �����մϴ�
-- ���� 3�� �̿ܿ� �߰��Ǵ� ���̺� �߰� ����
-- ������ ����
-- ���̺� ���� : �÷� �߰�, �ܷ�Ű �߰�
ALTER TABLE �÷��� ADD �÷��̸� NUMBER(5,0)
ALTER TABLE ���׸��� ADD CONSTRAINT ���̺�_fk FOREIGN KEY(�÷���) REFERENCES ���̺��(�÷���);

-- ������ insert : ���� �ҽ� ���� �����մϴ�.
-- DML : insert, update, delete, select �ۼ�

-- create view
-- select
-- 1) ��ȸ�� �÷� ����
-- 2) where ����, order BY 
-- 3) ��������
-- 4) ����, �ܺ�����
-- 5) ����Լ�
-- 6) group BY 
-- 7) ����Ŭ �Լ� : to_Char, TO_DATE(),DECODE(),nvl() 
SELECT to_char(sysdate,'YYYY') FROM dual;

-- ���� �� �н���� : ������ ����� ����
--JDBC


CREATE OR REPLACE PROCEDURE procEmSal
(v_empno IN number)		--�Ű�����
IS 
	v_sal NUMBER;		--��������
BEGIN
	SELECT SALARY INTO v_sal 	-- v_sal = salary
	FROM employees
	WHERE EMPLOYEE_ID = v_empno;
	dbms_output.put_line(v_sal);
END;


--�����ȣ�� �Է¹޾� �̸��� �޿� ���
CREATE OR REPLACE PROCEDURE pro
(v_empno IN NUMBER)
IS 	
	v_sal NUMBER;
	ename varchar2(100);
BEGIN
	SELECT e.EMAIL, e.SALARY INTO ename, v_sal
	FROM EMPLOYEES e 
	WHERE e.EMPLOYEE_ID = v_empno;
	dbms_output.put_line(ename||' '||v_sal)
END;





