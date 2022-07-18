-- �������� ������ create table, alter table ���� �մϴ�
-- �������� 1) not null : col2 �÷��� �ݵ�� ���� �����ؾ� ��
CREATE TABLE tbl#(
	col1 VARCHAR2(10),
	col2 number(3) NOT null
);

INSERT INTO tbl#(col2) VALUES(98);
INSERT INTO tbl#(col1) VALUES('korean');--���� : NOT NULL 
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);

-- Ȯ��
SELECT * FROM tbl#;

-- ���ο� ���������� ���� 2) UNIQUE�� ���� col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;		--������ ���̾�� �մϴ�

-- ���� insert�߿��� ������ �߻��ϴ� ���� ?:
INSERT INTO tbl#(col1) VALUES('engilsh');			--����
INSERT INTO tbl#(col2) VALUES(77);
INSERT INTO tbl#(col3) VALUES('english');			--����
INSERT INTO tbl#(col1, col2)VALUES ('english',88);	
INSERT INTO tbl#(col2, col3)VALUES (88, 'science');
INSERT INTO tbl#(col1, col3)VALUES ('science',88)	--����
INSERT INTO tbl#(col1, col2, col3) VALUES ('english',89,'science');
--���� : ���Ἲ ���� ���ǿ� ����
INSERT INTO tbl#(col1, col2, col3) VALUES ('english',89,'math');
--üũ���� : unique �÷����� null ���˴ϴ�

--�������� 3) �⺻ Ű(primary key)�� not null�� unique ���������Դϴ�.
CREATE TABLE tbl2#(
	tno NUMBER(3) PRIMARY KEY,
	tid number(3) UNIQUE
);

INSERT INTO tbl2#(tno) values(123);
SELECT * FROM tbl2#;
-- ���Ἲ ���� ����(pk �⺻Ű �÷�)�� ����˴ϴ�
INSERT INTO tbl2#(tno) values(123);	
INSERT INTO tbl2#(tid) values(123);

-- �������� 4) check : �÷����� ������ ���� -> age �÷����� 16 ~ 80
ALTER TABLE TBL2# ADD age number(3) CHECK(age BETWEEN 16 AND 80);
INSERT INTO tbl2#(tno,tid,age) VALUES (222,123,20);
INSERT INTO tbl2#(tno,tid,age) VALUES (223,124,90);

ALTER TABLE TBL2# ADD gender char(1) check(gender IN('M','F'));
INSERT INTO "TBL2#" (tno, gender) values(224,'F');
INSERT INTO "TBL2#" (tno, gender) values(225,'M');
INSERT INTO "TBL2#" (tno, gender) values(225,'m');

--���� gender �÷��� �������� ������ ����(DROP) �� �߰�(ADD)�ؾ� ��
ALTER TABLE "TBL2#" DROP CONSTRAINTS "TBL2_chk_gender";
ALTER TABLE "TBL2#" ADD CONSTRAINTS tbl2_chk_gender2
CHECK(gender IN('m','f','F','M'));

INSERT INTO "TBL2#"(tno, gender) VALUES (226,'m');
-- ���� gender �÷��� �������Ǹ� �����ϴ� ���� �ٸ� ��ɾ �����
INSERT INTO TBL2# (tno,gender) values(227,'f');









