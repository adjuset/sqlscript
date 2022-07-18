-- ���̺� ����� create table, ������ ���� �׽�Ʈ

CREATE TABLE tbl_memeber(
	mno number,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE			--��¥ ��-��-��, �ð� ��:��:��
);

--��� �÷��� �����͸� �����ϴ� ����(�÷��� ����)
INSERT INTO tbl_memeber values(1,'����','momo@naver.com','2022-03-02');
INSERT INTO tbl_memeber(mno, name)		--������ ����� �÷��� ����
values(1,'�̳���');

INSERT INTO tbl_memeber 
values(3,'�ִ���','danly@naver.com','2022-03-04 16:47');	-- ���� : ��¥������ �ڵ���ȯ ����

--����Ŭ�� to_date�Լ��� ���ڿ��� ��¥�������� ��ȯ(�ι��� ���ڴ� ����)
INSERT INTO TBL_MEMEBER 
values(3,'�ִ���','danly@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));

--���� �ý����� ��¥�� �ð� : SYSDATE �Լ�
INSERT INTO TBL_MEMEBER values(4,'����','aaa@gmail.com',sysdate);

SELECT * FROM TBL_MEMEBER;

-- ó�� ���� ���̺� ���� �� mno�÷��� ���е� 5�� ��� ����
--		��� ������ ���� mno �÷��� ���� ����� ��
ALTER TABLE "C##IDEV".TBL_MEMEBER MODIFY MNO NUMBER(5,0);

--to_char �Լ� : ��¥���Ŀ��� ���ڿ��� �����մϴ�. �� ��° ���ڴ� ����
SELECT to_char(join_date,'YYYY') FROM TBL_MEMEBER;

------------------------------------------------------------------------
--1. DML : INSERT ����
-- ��� �÷��� �����͸� �����ϴ� ����(�÷���, ����), ��¥�� DATE �ڵ�����ȯ

INSERT INTO tbl_memeber values(1,'����','momo@naver.com','2022-03-02');
INSERT INTO tbl_memeber(mno, name)		--������ ����� �÷��� ����
values(1,'�̳���');

--------------------------------------------------------------
--2. DML : SELECT ����(������ row�� ��ȸ)
-- select ��ȸ�� �÷� ��� from ���̺��̸� [where ���ǽ�];  ����÷��� *�� ��ü
SELECT name FROM TBL_MEMEBER;
SELECT name, join_date FROM TBL_MEMEBER;
SELECT * FROM TBL_MEMEBER;
SELECT * FROM TBL_MEMEBER 
WHERE name = '�ִ���';
SELECT * FROM TBL_MEMEBER WHERE JOIN_DATE > '2022-03-03';
SELECT NAME, EMAIL FROM TBL_MEMEBER WHERE JOIN_DATE >'2022-03-03';

--null�� ��ȸ
SELECT * FROM TBL_MEMEBER WHERE EMAIL IS NULL ;
SELECT * FROM TBL_MEMEBER WHERE EMAIL IS NOT NULL ;

-- ���ڿ��� �κа˻�
SELECT * FROM TBL_MEMEBER 
WHERE name LIKE '%����';
SELECT * FROM TBL_MEMEBER 
WHERE LIKE '����%';
SELECT * FROM TBL_MEMEBER 
WHERE name LIKE '%����%';

--or ���� : mno���� 1 �Ǵ� 2 �Ǵ� 4�� ��
SELECT * FROM TBL_MEMEBER WHERE mno =1 OR mno= 2 OR mno= 4;

--		����Ŭ�� or ��ü ������ : IN (�����÷��� ���� ���ǽ��ϋ�)
SELECT * FROM TBL_MEMEBER WHERE mno IN (1,2,4);
SELECT * FROM TBL_MEMEBER WHERE mno NOT IN (1,2,4);
SELECT * FROM TBL_MEMEBER WHERE name IN ('�ִ���','����');












