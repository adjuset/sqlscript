--프로시저 실행하기
	CREATE OR REPLACE PROCEDURE checkmember(
		arg_book IN tbl_book.title%TYPE,	--프로시저 실행할때 값을 받을 매개변수
		isOk OUT varchar2	--자바의 리턴값에 해당하는 기분
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
			DBMS_OUTPUT.put_line('대여중인 책 입니다');
			isOK := 'false';
		ELSE 
			DBMS_OUTPUT.put_line('책대여 가능하빈다.');
			isOK :='true';
		END IF;
		EXCEPTION 
		WHEN no_date_found THEN
		DBMS_OUTPUT.put_line('찾는 책이 없습니다');
		isOK:='no match';
END;

	--프로시저 실행하기
DECLARE 
	vresult varchar2(100);
BEGIN
	checkmember('페스트', vresult);
	DBMS_OUTPUT.put_line('결과 :'||vresult);
END;


--2번
CREATE OR REPLACE PROCEDURE CHECK_MEMBER(
			arg_mem IN book_member.MEM_IDX%TYPE,	-- 프로시저 실행할때 값을 받을 매개변수
			isOK OUT varchar2		-- 자바의 리턴값에 해당하는 부분.
	)
	IS 
			vcnt NUMBER;
			vname varchar2(100);
	 BEGIN 
		 -- 입력매개변수가 없는 회원인가를 확인하는 sql과 exception 처리. arg_mem으로 회원테이블에서 name조회
		 --		없으면 exception 처리
		 	 SELECT name INTO vname			-- 변수에 저장. 
		 		FROM BOOK_MEMBER bm WHERE MEM_IDX = arg_mem;
		 
			  SELECT count(*) INTO vcnt
			  FROM TBL_BOOKRENT tb 
			  WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;		--vcnt 가 0일때만 대여가능
			  IF (vcnt = 0) THEN 
				DBMS_OUTPUT.put_line('책 대여 가능합니다.');
				isOK := '가능';
			  ELSE 
				DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
				isOK := '불가능';
			  END IF;
			 EXCEPTION 
			 WHEN no_data_found THEN   
				DBMS_OUTPUT.PUT_LINE('회원이 아닙니다.');
				isOK :='no match';
	END;
