--�л����̺� �߰�
CREATE TABLE students(
	num varchar2(10) PRIMARY KEY,
	name varchar2(10) NOT NULL,
	age NUMBER,
	address varchar2(10)
);

INSERT INTO students values(2021001,'����',16,'���ʱ�');
INSERT INTO students values(20190119,'������',18,'������');


CREATE TABLE scores(
	num varchar2(10),
	subject varchar2(10),
	score number(3) NOT NULL,
	teacher varchar2(10) NOT NULL,
	semester varchar2(10) NOT NULL,
	PRIMARY key(num, subject),		--�⺻ Ű ����(not num + unique)
	FOREIGN KEY(num) REFERENCES students(num)
	--�ܷ�Ű���� refernces(����) Ű���� �ڿ� �������̺�(�����÷�)
	--�ܷ�Ű �÷��� foreign key Ű���� �ڿ� �ۼ�
	-- �����÷��� ������ ? �⺻Ű �Ǵ� unique �������� �÷��� ��
);


INSERT INTO scores values(2021001,'����',89,'�̳���','2022_1');
INSERT INTO scores values(2021001,'����',78,'��浿','2022_1');
INSERT INTO scores values(2021001,'����',67,'�ڼ���','2022_2');
INSERT INTO scores values(20190119,'����',92,'�̳���','2019_2');
INSERT INTO scores values(20190119,'����',85,'������','2019_2');
INSERT INTO scores values(20190119,'����',88,'�ڼ���','2020_1');

SELECT * FROM SCORES;


CREATE TABLE tbl_scores(
	num varchar2(10),
	subject varchar2(10),
	score number(3) NOT NULL,
	teacher varchar2(10) NOT NULL,
	semester varchar2(10) NOT NULL
);
--alter table ~ add constraints ~
ALTER TABLE tbl_scores 
ADD CONSTRAINTS  pk_scores PRIMARY KEY(num,subject);

ALTER TABLE tbl_scores
	ADD CONSTRAINTS fk_score FOREIGN KEY(num)
	REFERENCES students(num);










