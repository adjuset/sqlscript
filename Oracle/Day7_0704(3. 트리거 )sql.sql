--데이터베이스 트리거 : insert, update, delete 할 떄 동작하는 프로시저
--		특정 테이블에 속해있는 객체

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom			--트리거 동작하는 테이블, SQL과 시점
BEGIN
	IF TO_CHAR(SYSDATE, 'HH24:MI') BETWEEN '13:00' AND '15:00' THEN 
	raise_applivation_error(-20000,'지금 오후 1시~3시는 작업할 수 없습니다');
	END IF;	
END;

DELETE FROM tbl_custom WHERE CUSTOM_ID ='twice';

-- 트리거에 필요한 테이블 사전에 생성
CREATE TABLE TBL_TEMP 
AS
SELECT * FROM tbl_buy WHERE CUSTOM_ID ='0';

CREATE OR REPLACE TRIGGER backup_custom
AFTER DELETE ON tbl_custom
BEGIN 
	-- 회원 탈퇴한 데이터 tbl_temp 임시테이블에 INSERT 
	
END;























