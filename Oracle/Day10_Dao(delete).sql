SELECT * FROM TBL_CUSTOM tc ;

--tbl_custom 참조하는 외래키 삭제
--custom_id를 삭제하려면 구매내역부터 삭제해야됨
ALTER TABLE TBL_BUY DROP CONSTRAINT BUY_FK;


ALTER TABLE TBL_BUY ADD CONSTRAINT fk_custom_id
	FOREIGN KEY (custom_id) REFERENCES TBL_CUSTOM(CUSTOM_ID) ON DELETE CASCADE;



--1번
Insert into tbl_book values('B1102','스크라이트 던지기','박철순','KBO','2020-11-10');

--2번 :  return_Date 반납날자, exp_date 반납기한 날짜,
UPDATE TBL_BOOKRENT 
SET DELAY_DAYS = (RETURN_DATE- EXP_DATE)
WHERE RETURN_DATE > EXP_DATE ;

UPDATE TBL_BOOKRENT  
SET DELAY_DAYS =RETURN_DATE -EXP_DATE 
WHERE RETURN_DATE IS NULL;

--3번 : 현재 연체중인 회원의 이름, 전화번호 검색
SELECT bm.NAME ,bm.TEL 
FROM TBL_BOOKRENT tb,BOOK_MEMBER bm 
WHERE tb.MEM_IDX = bm.MEM_IDX  
AND RETURN_DATE IS NULL;
--AND SYSDATE - EXP_DATE > 0 ;

SELECT name, tel FROM BOOK_MEMBER bm
JOIN TBL_BOOKRENT tb ON bm.MEM_IDX =tb.MEM_IDX 
AND SYSDATE >exp_date AND RETURN_date IS NULL;

--4번. 현재 대출중인 도서의 도서명코드와 도서명 검색
-- 현재 기준으로 연체중인 것 : 반납기한 < 현재날짜
SELECT BCODE, TITLE 
FROM TBL_BOOK 
WHERE BCODE IN(SELECT BCODE FROM TBL_BOOKRENT WHERE return_date IS NULL);

SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE =tb2.BCODE AND return_date IS NULL;

--5. 현재 도서를 대여한 회원의 idx와 회원이름을 검색
SELECT MEM_IDX,NAME 
FROM BOOK_MEMBER 
WHERE MEM_IDX IN(SELECT MEM_IDX FROM TBL_BOOKRENT WHERE return_date IS NULL);

SELECT bm.MEM_IDX, bm.NAME 
FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--6. 대출중인 도서의 회원이름, 도서명, 반납기한 검색함
SELECT MEM_IDX, BCODE, EXP_DATE
FROM TBL_BOOKRENT
WHERE SYSDATE >EXP_DATE;

SELECT bm.NAME, tb.TITLE, tb2.EXP_DATE 
FROM BOOK_MEMBER bm, TBL_BOOK tb, TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

------------------------------------------------------------------------
--[도서대여 처리사항]
-- 1. 회원은 총 1권의 책만 대여중 일 수 있다.

-- 9) 회원  IDX '10002'는 도서 대출이 가능한지 프로시저를 작성합니다.
--rcnt가 0 일때만 대여가능
DECLARE
	vcnt NUMBER;
BEGIN
		--coun값을 변수 vcnt에 넣음
	
	SELECT COUNT(*) INTO vcnt
	FROM TBL_BOOKRENT 
	WHERE MEM_IDX =10001 AND RETURN_DATE IS NULL;
	if(vcnt = 0) THEN 
		DBMS_OUTPUT.put_line('책 대여 가능합니다');
	ELSE 
		DBMS_OUTPUT.put_line('대여중인 책을 반납해야 가능합니다.');
	END IF;
END;


	--매개변수
	CREATE OR REPLACE PROCEDURE check_member(
		arg_mem IN book_member.MEM_IDX%TYPE,	--프로시저 실행할때 값을 받을 매개변수
		isOk OUT varchar2	--자바의 리턴값에 해당하는 기분
	)
	IS
		vcnt NUMBER;
	BEGIN
		SELECT COUNT(*) INTO vcnt
		FROM TBL_BOOKRENT 
		WHERE MEM_IDX =10001 AND RETURN_DATE IS NULL;
		if(vcnt = 0) THEN 
			DBMS_OUTPUT.put_line('책 대여 가능합니다');
			isOK := '가능';
		ELSE 
			DBMS_OUTPUT.put_line('대여중인 책을 반납해야 가능합니다.');
			isOK :='불가능';
		END IF;
	END;

	--프로시저 실행하기
	DECLARE 
		vresult varchar2(20);
	BEGIN
		check_member(1002, vresult);
		DBMS_OUTPUT.put_line('결과 :'||vresult);
	END;




-- 10)도서명에 '테스트' 라는 도서가 대출이 가능한지 프로시저를 작성합니다.
DECLARE 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE INTO v_bcode 
	FROM TBL_BOOK tb 
	WHERE TITLE='페스트';

	SELECT COUNT(*) INTO v_cnt 
	FROM TBL_BOOKRENT 
	WHERE BCODE = v_bcode AND return_date IS NULL;

	IF (v_cnt = 1) THEN
		DBMS_OUTPUT.put_line('책 대여 가능합니다');
	ELSE 
		DBMS_OUTPUT.put_line('대여 불가능하빈다');
	END IF;
END;




SELECT  * FROM BOOK_MEMBER ;
SELECT  * FROM TBL_BOOK ;
SELECT * FROM TBL_BOOKRENT;

-- 11)9과 10을 이용해서 insert 를 하는 프로시저를 작성합니다.














