--���ڿ� Ÿ��
--	CHAR(����) : ��������, ������ ����Ʈ
--	VARCHAR(����) : ����Ŭ���� ���������� ������� ���� �����ڷ���
--  VARCHAR2(����) : ������ ���� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�
--					�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ忡�� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE TBL_string(
	acol char(10),		--10����Ʈ ��������
	bcol varchar2(10),	--10����Ʈ ��������
	ccol nchar(10),		--10�� ���ڰ��� �������� (���� 10�� �� ä���ߵ�)
	dcol nvarchar2(10)	--10�� ���� ��������
);


--char Ÿ��
INSERT INTO tbl_string(ACOL) VALUES ('abcdefghij');
INSERT INTO tbl_string(ACOL) VALUES ('abcdef');			--acol�� �������� Ÿ��  : ����4�� �߰�
INSERT INTO tbl_string(ACOL) VALUES ('abcdefghijklm');  --���� : ���� �ʰ�
--INSERT Ȯ��
SELECT * FROM tbl_string;
--�ѱ� Ȯ��
INSERT INTO tbl_string(acol) values('������');	--���� 1�� �߰�
INSERT INTO tbl_string(acol) values('�����ٶ�');	--���� ���� ���� �ʹ� ŭ(����:12, �ִ밪:10)
INSERT INTO tbl_string(acol) values('����');			--���� : ���� �ʰ�

-- varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT INTO tbl_string(bcol) VALUES('adcdefgjij');
INSERT INTO tbl_string(bcol) VALUES('adcdef');			--bcol�� ��������Ÿ��. �����߰�����
INSERT INTO tbl_string(bcol) VALUES('adbdefghijklm'); --���� �����ʰ�

--�ѱ�Ȯ��
INSERT INTO tbl_string(bcol) values('������');		--�����߰� ����
INSERT INTO tbl_string(bcol) values('�����ٶ�');
INSERT INTO tbl_string(bcol) values('����');


--char�� varchar2�� ����Ʈ ����. nchar�� nvarchar2�� ���ڰ�������(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ����)
--nchar Ÿ��
INSERT INTO tbl_string(CCOL) values('������');	--���� 7�� �߰�
INSERT INTO tbl_string(CCOL) values('�����ٶ�');	--���� 6�� �߰�
INSERT INTO tbl_string(CCOL) values('����');		--���� 8�� �߰�
SELECT * FROM tbl_string;

--nvarchar2 Ÿ��
INSERT INTO tbl_string(CCOL) values('������');	
INSERT INTO tbl_string(CCOL) values('�����ٶ�');	
INSERT INTO tbl_string(CCOL) values('����');		
INSERT INTO tbl_string(CCOL) values('�����ٶ󸶹ٻ������ī');	--���� : �����ʰ�		


