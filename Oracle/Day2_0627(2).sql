--문자열 타입
--	CHAR(길이) : 고정길이, 단위는 바이트
--	VARCHAR(길이) : 오라클에서 존재하지만 사용하지 않은 에비자료형
--  VARCHAR2(길이) : 가변형 길이 단위 바이트, 길이는 최대길이이고 실제로 메모리는 데이터크기만큼 사용합니다
--					최대 2000바이트입니다. UTF-8 인코드에서 한글은 3바이트, 영문/숫자/기호는 1바이트

CREATE TABLE TBL_string(
	acol char(10),		--10바이트 고정길이
	bcol varchar2(10),	--10바이트 가변길이
	ccol nchar(10),		--10개 문자개수 고정길이 (문자 10개 꼭 채워야됨)
	dcol nvarchar2(10)	--10개 문자 가변길이
);


--char 타입
INSERT INTO tbl_string(ACOL) VALUES ('abcdefghij');
INSERT INTO tbl_string(ACOL) VALUES ('abcdef');			--acol은 고정길이 타입  : 공백4개 추가
INSERT INTO tbl_string(ACOL) VALUES ('abcdefghijklm');  --오류 : 길이 초과
--INSERT 확인
SELECT * FROM tbl_string;
--한글 확인
INSERT INTO tbl_string(acol) values('가나다');	--공백 1개 추가
INSERT INTO tbl_string(acol) values('가나다라');	--열에 대한 값이 너무 큼(실제:12, 최대값:10)
INSERT INTO tbl_string(acol) values('가나');			--오류 : 길이 초과

-- varchar2 타입 : bcol은 가변길이 10바이트
INSERT INTO tbl_string(bcol) VALUES('adcdefgjij');
INSERT INTO tbl_string(bcol) VALUES('adcdef');			--bcol은 가변길이타입. 공백추가없음
INSERT INTO tbl_string(bcol) VALUES('adbdefghijklm'); --오류 길이초과

--한글확인
INSERT INTO tbl_string(bcol) values('가나다');		--공백추가 없음
INSERT INTO tbl_string(bcol) values('가나다라');
INSERT INTO tbl_string(bcol) values('가나');


--char과 varchar2는 바이트 단위. nchar과 nvarchar2는 문자개수단위(다국어 문자가 많이 포함되는 컬럼에 적용)
--nchar 타입
INSERT INTO tbl_string(CCOL) values('가나다');	--공백 7개 추가
INSERT INTO tbl_string(CCOL) values('가나다라');	--공백 6개 추가
INSERT INTO tbl_string(CCOL) values('가나');		--공백 8개 추가
SELECT * FROM tbl_string;

--nvarchar2 타입
INSERT INTO tbl_string(CCOL) values('가나다');	
INSERT INTO tbl_string(CCOL) values('가나다라');	
INSERT INTO tbl_string(CCOL) values('가나');		
INSERT INTO tbl_string(CCOL) values('가나다라마바사아자차카');	--오류 : 길이초과		


