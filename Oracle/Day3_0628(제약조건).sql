-- 제약조건 설정은 create table, alter table 에서 합니다
-- 제약조건 1) not null : col2 컬럼은 반드시 값을 지정해야 함
CREATE TABLE tbl#(
	col1 VARCHAR2(10),
	col2 number(3) NOT null
);

INSERT INTO tbl#(col2) VALUES(98);
INSERT INTO tbl#(col1) VALUES('korean');--오류 : NOT NULL 
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);

-- 확인
SELECT * FROM tbl#;

-- 새로운 제약조건을 갖는 2) UNIQUE를 갖는 col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;		--유일한 값이어야 합니다

-- 다음 insert중에서 오류가 발생하는 것은 ?:
INSERT INTO tbl#(col1) VALUES('engilsh');			--오류
INSERT INTO tbl#(col2) VALUES(77);
INSERT INTO tbl#(col3) VALUES('english');			--오류
INSERT INTO tbl#(col1, col2)VALUES ('english',88);	
INSERT INTO tbl#(col2, col3)VALUES (88, 'science');
INSERT INTO tbl#(col1, col3)VALUES ('science',88)	--오류
INSERT INTO tbl#(col1, col2, col3) VALUES ('english',89,'science');
--오류 : 무결성 제약 조건에 위배
INSERT INTO tbl#(col1, col2, col3) VALUES ('english',89,'math');
--체크사항 : unique 컬럼에는 null 허용됩니다

--제약조건 3) 기본 키(primary key)는 not null과 unique 제약조건입니다.
CREATE TABLE tbl2#(
	tno NUMBER(3) PRIMARY KEY,
	tid number(3) UNIQUE
);

INSERT INTO tbl2#(tno) values(123);
SELECT * FROM tbl2#;
-- 무결성 제약 조건(pk 기본키 컬럼)에 위배됩니다
INSERT INTO tbl2#(tno) values(123);	
INSERT INTO tbl2#(tid) values(123);

-- 제약조건 4) check : 컬럼값의 범위를 설정 -> age 컬럼값은 16 ~ 80
ALTER TABLE TBL2# ADD age number(3) CHECK(age BETWEEN 16 AND 80);
INSERT INTO tbl2#(tno,tid,age) VALUES (222,123,20);
INSERT INTO tbl2#(tno,tid,age) VALUES (223,124,90);

ALTER TABLE TBL2# ADD gender char(1) check(gender IN('M','F'));
INSERT INTO "TBL2#" (tno, gender) values(224,'F');
INSERT INTO "TBL2#" (tno, gender) values(225,'M');
INSERT INTO "TBL2#" (tno, gender) values(225,'m');

--성별 gender 컬럼의 제약조건 변경은 삭제(DROP) 후 추가(ADD)해야 함
ALTER TABLE "TBL2#" DROP CONSTRAINTS "TBL2_chk_gender";
ALTER TABLE "TBL2#" ADD CONSTRAINTS tbl2_chk_gender2
CHECK(gender IN('m','f','F','M'));

INSERT INTO "TBL2#"(tno, gender) VALUES (226,'m');
-- 현재 gender 컬럼의 제약조건만 변경하는 경우는 다른 명령어를 써야함
INSERT INTO TBL2# (tno,gender) values(227,'f');









