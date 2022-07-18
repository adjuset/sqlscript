
--������ ���� ���̺��� �����ϼ��� (�⺻Ű�� �ּ� �ش�κи� �߰��ϼ���)
--�� ���̺�
CREATE TABLE tbl_custom(
	custom_id varchar2(20),	--�⺻Ű�� ����
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate --�⺻�� ����
);

ALTER TABLE tbl_custom ADD CONSTRAINT custom_pk PRIMARY KEY(custom_id);

--��ǰ ���̺� : ī�װ� ���� A1:����üǰ, B1:��ǰ
CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,		--�⺻Ű
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price varchar2(9) NOT null
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ߴ°�?
CREATE TABLE tbl_buy(
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL, --����
	buy_date DATE DEFAULT sysdate
);

ALTER TABLE TBL_BUY ADD CONSTRAINT buy_fk2 FOREIGN KEY(pcode) REFERENCES tbl_product(pcode);

ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD hh24:mi:ss';

INSERT INTO TBL_CUSTOM VALUES ('mina012','��̳�','kimm@gmail.com',20,to_date('2022-03-10 14:23:25','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_custom VALUES ('hongGD','ȫ�浿','gil@korea.com',32,to_date('2021-10-21', 'YYYY-MM-DD'));
INSERT INTO tbl_custom VALUES ('twice','�̳���','momo@daum.net',29,to_Date('2021-12-25','YYYY-MM-DD'));
INSERT INTO tbl_custom VALUES ('wonder','�ڸ��','lee@naver.com',40,sysdate);

INSERT INTO tbl_product values('IPAD011','A1','�����е�10','880,000');
INSERT INTO tbl_product values('DOWON123a','B1','��������������Ʈ','54,000');
INSERT INTO tbl_product values('dk_143','A2','�𼱵���ũ','234,500');

INSERT INTO TBL_BUY values('mina012','IPAD011',1,TO_dATE('2022-02-06','YYYY-MM-DD'));
INSERT INTO TBL_BUY VALUES('hongGD','IPAD011',2,TO_dATE('2022-06-29 20:37:47','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_buy values('wonder','DOWON123a',3,to_date('2022-02-06','YYYY-MM-DD'));
INSERT INTO tbl_buy values('mina012','dk_143',1,sysdate);
INSERT INTO tbl_buy values('wonder','DOWON123a',3,to_date('2022-02-09 08:49:55','YYYY-MM-DD hh24:mi:ss'));
INSERT INTO tbl_buy values('twice','DOWON123a',2,to_date('2022-02-06','YYYY-MM-DD'));


--tbl_buy�� buyNo �÷��߰�
ALTER TABLE tbl_buy ADD buyNo number(8);

--4. tbl_buy ���̺��� buyNo �÷����� 1001~1005�� ������ ������ ���� ����
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


--5. buy���̺� buyno�� �⺻Ű�� �ϴ� �������� �߰�
ALTER TABLE tbl_buy ADD CONSTRAINT buy_pk PRIMARY key(buyno);


--6. custom_id�� �ܷ�Ű ����
ALTER TABLE TBL_BUY ADD CONSTRAINT buy_fk FOREIGN KEY(custom_id) REFERENCES tbl_custom(custom_id); 

--7. tblbuy_seq ������ ���� ���۰� 1006
CREATE SEQUENCE tblbuy_seq START WITH 1006;

--8. 7���� ������ ����Ͽ� INSERT 
INSERT INTO tbl_buy 
values('wonder','IPAD011',1,to_Date('2022-05-15','YYYY-MM-DD')
		,tblbuy_seq.nextval);

SELECT * FROM TBL_BUY tb ;


--9. ������ ���� ��ȸ�� ���� select �ۼ�

--(1). age�� 30�� �̻� ���� ��� �÷� ��ȸ
SELECT * 
FROM TBL_CUSTOM tc 
WHERE age>=30;

--(2). custom_id 'twice'�� email ��ȸ
SELECT email
FROM TBL_CUSTOM 
WHERE CUSTOM_ID ='twice';

--(3). category 'A2'�� PNAME��ȸ
SELECT pname
FROM TBL_PRODUCT
WHERE CATEGORY ='A2';

--(4). ��ǰ PRICE�� �ְ� ��ȸ
SELECT MAX(PRICE) FROM TBL_PRODUCT;

--(5).'IPAD011'�ѱ��� ���� ��ȸ
SELECT SUM(QUANTITY) 
FROM TBL_BUY
WHERE PCODE ='IPAD011';

--(6). custom_id 'mina012'�� ������ ���� ��ȸ
SELECT *
FROM TBL_BUY 
WHERE CUSTOM_ID ='mina012';

--(7). ���� ��ǰ �� pcode�� 0�� ���Ե� �� ��ȸ
SELECT *
FROM TBL_BUY
WHERE PCODE LIKE '%0%';

--(8). ���Ż�ǰ �� pcode�� on�� �����ϴ� �� ��ȸ (��ҹ��� ����x)
SELECT *
FROM TBL_BUY 
WHERE PCODE LIKE '%on%'
OR PCODE LIKE '%ON%';


SELECT * FROM TBL_BUY tb ;






























