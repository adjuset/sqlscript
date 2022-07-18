
--다음과 같이 테이블을 생성하세요 (기본키는 주석 해당부분만 추가하세요)
--고객 테이블
CREATE TABLE tbl_custom(
	custom_id varchar2(20),	--기본키로 설정
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate --기본값 설정
);

ALTER TABLE tbl_custom ADD CONSTRAINT custom_pk PRIMARY KEY(custom_id);

--상품 테이블 : 카테고리 예시 A1:전자체품, B1:식품
CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,		--기본키
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price varchar2(9) NOT null
);

--구매 테이블 : 어느 고객이 무슨 상품을 구매했는가?
CREATE TABLE tbl_buy(
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL, --수량
	buy_date DATE DEFAULT sysdate
);

ALTER TABLE TBL_BUY ADD CONSTRAINT buy_fk2 FOREIGN KEY(pcode) REFERENCES tbl_product(pcode);

ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD hh24:mi:ss';

INSERT INTO TBL_CUSTOM VALUES ('mina012','김미나','kimm@gmail.com',20,to_date('2022-03-10 14:23:25','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_custom VALUES ('hongGD','홍길동','gil@korea.com',32,to_date('2021-10-21', 'YYYY-MM-DD'));
INSERT INTO tbl_custom VALUES ('twice','이나나','momo@daum.net',29,to_Date('2021-12-25','YYYY-MM-DD'));
INSERT INTO tbl_custom VALUES ('wonder','박모모','lee@naver.com',40,sysdate);

INSERT INTO tbl_product values('IPAD011','A1','아이패드10','880,000');
INSERT INTO tbl_product values('DOWON123a','B1','동원참지선물세트','54,000');
INSERT INTO tbl_product values('dk_143','A2','모선데스크','234,500');

INSERT INTO TBL_BUY values('mina012','IPAD011',1,TO_dATE('2022-02-06','YYYY-MM-DD'));
INSERT INTO TBL_BUY VALUES('hongGD','IPAD011',2,TO_dATE('2022-06-29 20:37:47','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_buy values('wonder','DOWON123a',3,to_date('2022-02-06','YYYY-MM-DD'));
INSERT INTO tbl_buy values('mina012','dk_143',1,sysdate);
INSERT INTO tbl_buy values('wonder','DOWON123a',3,to_date('2022-02-09 08:49:55','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_buy values('twice','DOWON123a',2,to_date('2022-02-06','YYYY-MM-DD'));


--tbl_buy에 buyNo 컬럼추가
ALTER TABLE tbl_buy ADD buyNo number(8);

--4. tbl_buy 테이블의 buyNo 컬럼값을 1001~1005의 값으로 다음과 같이 수정
SELECT * FROM TBL_BUY;

CREATE SEQUENCE tbl_buy1 START WITH 1000;
SELECT tbl_buy1.nextval FROM dual; 
SELECT tbl_buy1.currval FROM dual; 

SELECT * FROM TBL_BUY;

UPDATE tbl_buy SET BUYNO = tbl_buy1.nextval 
WHERE CUSTOM_ID ='mina012' AND PCODE='IPAD011' ;

SELECT * FROM TBL_BUY;

UPDATE tbl_buy SET BUYNO = tbl_buy1.nextval 
WHERE CUSTOM_ID ='hongGD' AND PCODE='IPAD011' ;

SELECT * FROM TBL_BUY;
UPDATE tbl_buy SET BUYNO = tbl_buy1.nextval 
WHERE CUSTOM_ID ='wonder' AND PCODE='DOWON123a' ;

SELECT * FROM TBL_BUY;
UPDATE tbl_buy SET BUYNO = tbl_buy1.nextval 
WHERE CUSTOM_ID ='mina012' AND PCODE='dk_143' ;

SELECT * FROM TBL_BUY;
UPDATE tbl_buy SET BUYNO = tbl_buy1.nextval 
WHERE CUSTOM_ID ='twice' AND PCODE='DOWON123a' ;


--5. buy테이블에 buyno를 기본키로 하는 제약조건 추가
ALTER TABLE tbl_buy ADD CONSTRAINT buy_pk PRIMARY key(buyno);


--6. custom_id에 외래키 설정
ALTER TABLE TBL_BUY ADD CONSTRAINT buy_fk FOREIGN KEY(custom_id) REFERENCES tbl_custom(custom_id); 

--7. tblbuy_seq 시퀀스 생성 시작값 1006
CREATE SEQUENCE tblbuy_seq START WITH 1006;

--8. 7번의 시퀀스 사용하여 INSERT 
INSERT INTO tbl_buy 
values('wonder','IPAD011',1,to_Date('2022-05-15','YYYY-MM-DD')
		,tblbuy_seq.nextval);

SELECT * FROM TBL_BUY tb ;


--9. 다음과 같은 조회을 위한 select 작성

--(1). age가 30세 이상 고객의 모든 컬럼 조회
SELECT * 
FROM TBL_CUSTOM tc 
WHERE age>=30;

--(2). custom_id 'twice'의 email 조회
SELECT email
FROM TBL_CUSTOM 
WHERE CUSTOM_ID ='twice';

--(3). category 'A2'의 PNAME조회
SELECT pname
FROM TBL_PRODUCT
WHERE CATEGORY ='A2';

--(4). 상품 PRICE의 최고값 조회
SELECT MAX(PRICE) FROM TBL_PRODUCT;

--(5).'IPAD011'총구매 수량 초회
SELECT SUM(QUANTITY) 
FROM TBL_BUY
WHERE PCODE ='IPAD011';

--(6). custom_id 'mina012'이 구매한 내용 조회
SELECT *
FROM TBL_BUY 
WHERE CUSTOM_ID ='mina012';

--(7). 구매 상품 중 pcode가 0이 포함된 것 조회
SELECT *
FROM TBL_BUY
WHERE PCODE LIKE '%0%';

--(8). 구매상품 중 pcode에 on이 포함하는 것 조회 (대소문자 구분x)
SELECT *
FROM TBL_BUY 
WHERE PCODE LIKE '%on%'
OR PCODE LIKE '%ON%';


SELECT * FROM TBL_BUY tb ;






























