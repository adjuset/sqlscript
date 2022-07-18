-- 테이블 만드는 create table, 데이터 형식 테스트

CREATE TABLE tbl_memeber(
	mno number,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE			--날짜 년-월-일, 시간 시:분:초
);

--모든 컬럼에 데이터를 저장하는 형식(컬럼명 생략)
INSERT INTO tbl_memeber values(1,'김모모','momo@naver.com','2022-03-02');
INSERT INTO tbl_memeber(mno, name)		--테이터 저장될 컬럼명 나열
values(1,'이나나');

INSERT INTO tbl_memeber 
values(3,'최다현','danly@naver.com','2022-03-04 16:47');	-- 오류 : 날짜형식은 자동변환 못함

--오라클의 to_date함수는 문자열을 날짜형식으로 변환(두번쨰 인자는 패턴)
INSERT INTO TBL_MEMEBER 
values(3,'최다현','danly@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));

--현재 시스템의 날짜와 시간 : SYSDATE 함수
INSERT INTO TBL_MEMEBER values(4,'쯔위','aaa@gmail.com',sysdate);

SELECT * FROM TBL_MEMEBER;

-- 처음 만든 테이블 구조 중 mno컬럼을 정밀도 5로 축소 변경
--		축소 변경할 떄는 mno 컬럼에 값이 없어야 함
ALTER TABLE "C##IDEV".TBL_MEMEBER MODIFY MNO NUMBER(5,0);

--to_char 함수 : 날짜형식에서 문자열로 변경합니다. 두 번째 안자는 패턴
SELECT to_char(join_date,'YYYY') FROM TBL_MEMEBER;

------------------------------------------------------------------------
--1. DML : INSERT 형식
-- 모든 컬렉션 데이터를 저장하는 형식(컬럼명, 생략), 날짜는 DATE 자동ㅂ변환

INSERT INTO tbl_memeber values(1,'김모모','momo@naver.com','2022-03-02');
INSERT INTO tbl_memeber(mno, name)		--테이터 저장될 컬럼명 나열
values(1,'이나나');

--------------------------------------------------------------
--2. DML : SELECT 형식(데이터 row행 조회)
-- select 조회할 컬럼 목록 from 테이블이름 [where 조건식];  모든컬럼은 *로 대체
SELECT name FROM TBL_MEMEBER;
SELECT name, join_date FROM TBL_MEMEBER;
SELECT * FROM TBL_MEMEBER;
SELECT * FROM TBL_MEMEBER 
WHERE name = '최다현';
SELECT * FROM TBL_MEMEBER WHERE JOIN_DATE > '2022-03-03';
SELECT NAME, EMAIL FROM TBL_MEMEBER WHERE JOIN_DATE >'2022-03-03';

--null값 조회
SELECT * FROM TBL_MEMEBER WHERE EMAIL IS NULL ;
SELECT * FROM TBL_MEMEBER WHERE EMAIL IS NOT NULL ;

-- 문자열의 부분검색
SELECT * FROM TBL_MEMEBER 
WHERE name LIKE '%다현';
SELECT * FROM TBL_MEMEBER 
WHERE LIKE '다현%';
SELECT * FROM TBL_MEMEBER 
WHERE name LIKE '%다현%';

--or 연산 : mno값이 1 또는 2 또는 4인 값
SELECT * FROM TBL_MEMEBER WHERE mno =1 OR mno= 2 OR mno= 4;

--		오라클의 or 대체 연산자 : IN (동일컬럼에 대한 조건식일떄)
SELECT * FROM TBL_MEMEBER WHERE mno IN (1,2,4);
SELECT * FROM TBL_MEMEBER WHERE mno NOT IN (1,2,4);
SELECT * FROM TBL_MEMEBER WHERE name IN ('최다현','김모모');












