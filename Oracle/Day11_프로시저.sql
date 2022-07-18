--���ν��� �����ϱ�
	CREATE OR REPLACE PROCEDURE checkmember(
		arg_book IN tbl_book.title%TYPE,	--���ν��� �����Ҷ� ���� ���� �Ű�����
		isOk OUT varchar2	--�ڹ��� ���ϰ��� �ش��ϴ� ���
	)
	IS
		vbcode varchar2(100);
		vcnt NUMBER;
	BEGIN
		SELECT BCODE INTO vbcode
		FROM TBL_BOOK tb WHERE TITLE =arg_book;
		SELECT COUNT(*) INTO vcnt
		FROM TBL_BOOKRENT 
		WHERE BCODE =vbcode AND RETURN_DATE IS NULL;
		if(vcnt = 1) THEN 
			DBMS_OUTPUT.put_line('�뿩���� å �Դϴ�');
			isOK := 'false';
		ELSE 
			DBMS_OUTPUT.put_line('å�뿩 �����Ϻ��.');
			isOK :='true';
		END IF;
		EXCEPTION 
		WHEN no_date_found THEN
		DBMS_OUTPUT.put_line('ã�� å�� �����ϴ�');
		isOK:='no match';
END;

	--���ν��� �����ϱ�
DECLARE 
	vresult varchar2(100);
BEGIN
	checkmember('�佺Ʈ', vresult);
	DBMS_OUTPUT.put_line('��� :'||vresult);
END;


--2��
CREATE OR REPLACE PROCEDURE CHECK_MEMBER(
			arg_mem IN book_member.MEM_IDX%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
			vcnt NUMBER;
			vname varchar2(100);
	 BEGIN 
		 -- �Է¸Ű������� ���� ȸ���ΰ��� Ȯ���ϴ� sql�� exception ó��. arg_mem���� ȸ�����̺��� name��ȸ
		 --		������ exception ó��
		 	 SELECT name INTO vname			-- ������ ����. 
		 		FROM BOOK_MEMBER bm WHERE MEM_IDX = arg_mem;
		 
			  SELECT count(*) INTO vcnt
			  FROM TBL_BOOKRENT tb 
			  WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;		--vcnt �� 0�϶��� �뿩����
			  IF (vcnt = 0) THEN 
				DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
				isOK := '����';
			  ELSE 
				DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
				isOK := '�Ұ���';
			  END IF;
			 EXCEPTION 
			 WHEN no_data_found THEN   
				DBMS_OUTPUT.PUT_LINE('ȸ���� �ƴմϴ�.');
				isOK :='no match';
	END;
