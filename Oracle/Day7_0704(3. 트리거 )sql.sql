--�����ͺ��̽� Ʈ���� : insert, update, delete �� �� �����ϴ� ���ν���
--		Ư�� ���̺� �����ִ� ��ü

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom			--Ʈ���� �����ϴ� ���̺�, SQL�� ����
BEGIN
	IF TO_CHAR(SYSDATE, 'HH24:MI') BETWEEN '13:00' AND '15:00' THEN 
	raise_applivation_error(-20000,'���� ���� 1��~3�ô� �۾��� �� �����ϴ�');
	END IF;	
END;

DELETE FROM tbl_custom WHERE CUSTOM_ID ='twice';

-- Ʈ���ſ� �ʿ��� ���̺� ������ ����
CREATE TABLE TBL_TEMP 
AS
SELECT * FROM tbl_buy WHERE CUSTOM_ID ='0';

CREATE OR REPLACE TRIGGER backup_custom
AFTER DELETE ON tbl_custom
BEGIN 
	-- ȸ�� Ż���� ������ tbl_temp �ӽ����̺� INSERT 
	
END;























