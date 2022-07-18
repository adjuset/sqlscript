--데이터 가져오기
--		제공되는 csv 형식의 파일을 테이블로 변환할 수 있는 기능
--		csv 파일은 데이터 항목을, 구분하여 저장한 텍스트 파일 (엘셀 또는 메모장에서 열기가능)
--		주의사항 : 자동으로 생성되는 테이블 컬럼의 크기가 데이터보다 작지 않게 또는 적정한 타입으로 설정해야 함

-- Tables 우클릭(데이터 가져오기) > csv 가져오기 > 해당 파일 선택 > 데이터 타입 적절히 변경(컬럼) > TARGET이름 변경(테이블이름) 

--ANIMAL_INS 테이블 행이 많으면 SQL쿼리 실행속도 차이를 확인할 수 있음
--		예를 들면 서브쿼리와 조인의 SQL 실행시간 비교가능
SELECT * FROM ANIMAL_INS;

--데이터 내보내기 (export)
--		현재 데이터베이스의 테이블 구조와 행(값)들을 파일로 내보내기 합니다
--		DDL 테이블, 시퀀스 생성 명령문과 INSERT 명령들을 만들어서 .sql 파일 만듬

SELECT * FROM TBL_CUSTOM; 

SELECT * FROM TBL_CUSTOM WHERE CUSTOM_ID = ?;

INSERT INTO TBL_CUSTOM VALUES(?,?,?,?,?)

DELETE FROM TBL_CUSTOM WHERE CUSTOM_ID =?