SELECT * FROM TBL_CUSTOM tc ;

--tbl_custom �����ϴ� �ܷ�Ű ����
--custom_id�� �����Ϸ��� ���ų������� �����ؾߵ�
ALTER TABLE TBL_BUY DROP CONSTRAINT BUY_FK;


ALTER TABLE TBL_BUY ADD CONSTRAINT fk_custom_id
	FOREIGN KEY (custom_id) REFERENCES TBL_CUSTOM(CUSTOM_ID) ON DELETE CASCADE;



--1��
Insert into tbl_book values('B1102','��ũ����Ʈ ������','��ö��','KBO','2020-11-10');

--2�� :  return_Date �ݳ�����, exp_date �ݳ����� ��¥,
UPDATE TBL_BOOKRENT 
SET DELAY_DAYS = (RETURN_DATE- EXP_DATE)
WHERE RETURN_DATE > EXP_DATE ;

UPDATE TBL_BOOKRENT  
SET DELAY_DAYS =RETURN_DATE -EXP_DATE 
WHERE RETURN_DATE IS NULL;

--3�� : ���� ��ü���� ȸ���� �̸�, ��ȭ��ȣ �˻�
SELECT bm.NAME ,bm.TEL 
FROM TBL_BOOKRENT tb,BOOK_MEMBER bm 
WHERE tb.MEM_IDX = bm.MEM_IDX  
AND RETURN_DATE IS NULL;
--AND SYSDATE - EXP_DATE > 0 ;

SELECT name, tel FROM BOOK_MEMBER bm
JOIN TBL_BOOKRENT tb ON bm.MEM_IDX =tb.MEM_IDX 
AND SYSDATE >exp_date AND RETURN_date IS NULL;

--4��. ���� �������� ������ �������ڵ�� ������ �˻�
-- ���� �������� ��ü���� �� : �ݳ����� < ���糯¥
SELECT BCODE, TITLE 
FROM TBL_BOOK 
WHERE BCODE IN(SELECT BCODE FROM TBL_BOOKRENT WHERE return_date IS NULL);

SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE =tb2.BCODE AND return_date IS NULL;

--5. ���� ������ �뿩�� ȸ���� idx�� ȸ���̸��� �˻�
SELECT MEM_IDX,NAME 
FROM BOOK_MEMBER 
WHERE MEM_IDX IN(SELECT MEM_IDX FROM TBL_BOOKRENT WHERE return_date IS NULL);

SELECT bm.MEM_IDX, bm.NAME 
FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--6. �������� ������ ȸ���̸�, ������, �ݳ����� �˻���
SELECT MEM_IDX, BCODE, EXP_DATE
FROM TBL_BOOKRENT
WHERE SYSDATE >EXP_DATE;

SELECT bm.NAME, tb.TITLE, tb2.EXP_DATE 
FROM BOOK_MEMBER bm, TBL_BOOK tb, TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

------------------------------------------------------------------------
--[�����뿩 ó������]
-- 1. ȸ���� �� 1���� å�� �뿩�� �� �� �ִ�.

-- 9) ȸ��  IDX '10002'�� ���� ������ �������� ���ν����� �ۼ��մϴ�.
--rcnt�� 0 �϶��� �뿩����
DECLARE
	vcnt NUMBER;
BEGIN
		--coun���� ���� vcnt�� ����
	
	SELECT COUNT(*) INTO vcnt
	FROM TBL_BOOKRENT 
	WHERE MEM_IDX =10001 AND RETURN_DATE IS NULL;
	if(vcnt = 0) THEN 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�');
	ELSE 
		DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END;


	--�Ű�����
	CREATE OR REPLACE PROCEDURE check_member(
		arg_mem IN book_member.MEM_IDX%TYPE,	--���ν��� �����Ҷ� ���� ���� �Ű�����
		isOk OUT varchar2	--�ڹ��� ���ϰ��� �ش��ϴ� ���
	)
	IS
		vcnt NUMBER;
	BEGIN
		SELECT COUNT(*) INTO vcnt
		FROM TBL_BOOKRENT 
		WHERE MEM_IDX =10001 AND RETURN_DATE IS NULL;
		if(vcnt = 0) THEN 
			DBMS_OUTPUT.put_line('å �뿩 �����մϴ�');
			isOK := '����';
		ELSE 
			DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� �����մϴ�.');
			isOK :='�Ұ���';
		END IF;
	END;

	--���ν��� �����ϱ�
	DECLARE 
		vresult varchar2(20);
	BEGIN
		check_member(1002, vresult);
		DBMS_OUTPUT.put_line('��� :'||vresult);
	END;




-- 10)������ '�׽�Ʈ' ��� ������ ������ �������� ���ν����� �ۼ��մϴ�.
DECLARE 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE INTO v_bcode 
	FROM TBL_BOOK tb 
	WHERE TITLE='�佺Ʈ';

	SELECT COUNT(*) INTO v_cnt 
	FROM TBL_BOOKRENT 
	WHERE BCODE = v_bcode AND return_date IS NULL;

	IF (v_cnt = 1) THEN
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�');
	ELSE 
		DBMS_OUTPUT.put_line('�뿩 �Ұ����Ϻ��');
	END IF;
END;




SELECT  * FROM BOOK_MEMBER ;
SELECT  * FROM TBL_BOOK ;
SELECT * FROM TBL_BOOKRENT;

-- 11)9�� 10�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.














