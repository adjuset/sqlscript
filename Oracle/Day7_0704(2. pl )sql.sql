-- PL/SQL : Procedure(����,����) Language , ������ �ܼ��� SQL�� Ȯ��� ���(SQL�� ����� ���α׷�)
--			����,���(if,�ݺ���)�� ����Ͽ� ���α׷��־��� ���� sql ������ �帧�� ����

--���ǻ��� : ������ ���ν����� ����� ����� ����

DECLARE   -- ���������  
	--vcustomid varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;
BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT name, age 
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM TBL_CUSTOM 
	--from "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='hongGD';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
									-- ������ �� ��ȸ�ɶ��� �ٸ� cursor �ʿ�.
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('�����̵� : ' || vname);		-- ||�� ������ ����
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. ���� : no_data_found 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;



-- ����Ŭ ��ü ���ν��� �����ϱ� : �˻��� ���� �Ű������� �����ϱ�
REATE OR REPLACE PROCEDURE search_custom(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE		-- �Ű����� IN 
)
IS 
	-- �Ϲ� ���� ����
	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name,age 
	INTO vname , vage	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);  
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
END;

--���ν��� ����
BEGIN
	search_custom('wonder');
END;


----------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE search_custom2(	--���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE, 	--�Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE 		--���ϰ� ��� OUT 
)

IS 	--�Ϲݺ��� ����
--	vname tbl_custom.name %TYPE;	
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name
	FROM TBL_CUSTOM 
	WHERE CUSTOM_ID = c_id;	
	
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || c_name);		
	EXCEPTION		
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
		c_name := 'no match';		--���Թ� := ��ȣ
END;


--���(���ϰ�)�� �ִ� ���ν��� ���� : ��°� ������ ���� �����ʿ�
DECLARE	
	vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('mina012',vname);	--vname�� ���ν��� �����Ҷ� out���� ����
	DBMS_OUTPUT.PUT_LINE('���̸� :'||vname);
END;


--Begin ~ end ���� �ϳ��� Ʈ������� �����ϴ� DML (insert, update, delete ���� ) ��ɵ�� ����
-- ������ �����  Exception ���� rollback ������ �������� commit

--���ν����� �� �� �ִ� ��� sql
--������ ������ ���� ���̺� �����
CREATE TABLE tbl_temp
AS
SELECT * FROM tbl_custom WHERE CUSTOM_ID ='0';

INSERT INTO tbl_temp(SELECT * FROM TBL_CUSTOM WHERE custom_id ='wonder');

SELECT * FROM TBL_TEMP;


--Function ����Ŭ ��ü�� ��
-- ����Ŭ �Լ� :upper, lower, decode, round, to_date, to_char ...
-- Function�� ����� �Լ��� ������. ���̺��� ������� �ϴ°��� �ƴ϶� Ư�������͸� �����ϴ� ����








