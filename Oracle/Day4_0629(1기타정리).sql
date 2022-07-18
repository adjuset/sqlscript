--DDL : CREATE, ALTER, DROP , TRUNCATE  
--		(����� user, table,sequence,view, .. �� truncate�� ���̺� ���)
--CML : INSERT, UPDATE, DELETE	   -> Ʈ��������� ������		   

DROP TABLE students0;		--���� : students0 ���̺��� ���� �����ؾ��� 
							--���� : �ܷ�Ű�� ���� �����Ǵ� ����/�⺻Ű�� ���̺� �ִ�
DROP TABLE SCORES;


--UPDATE ���̺�� SET �÷��� = ��, �÷��� = ��, �÷��� = �� ..
--	WHERE �����÷� �����
--DELETE FROM ���̺�� WHERE �����÷������
--�������� : UPDATE�� DELETE�� WHERE ���� ����ϴ� ���� ������ ����
--		  truncate�� ������ ���(rollback)�� �� ���� ������ DDL�� �ش�
SELECT * FROM STUDENTS s ;

--update, delete, select���� where �� �÷��� �⺻Ű �÷����� ���������̸�
--����Ǵ� ��� �ݿ��Ǵ� ���� ��ϱ��? �ִ� 1��
-- �⺻Ű�� ������ ���̺��� ��������� ����(�ĺ�)
UPDATE STUDENTS SET age = 17 WHERE num =2021001;

--rollback, commit�׽�Ʈ (�����ͺ��̽� �޴����� Ʈ������ ��带 manual�� �����մϴ� ->None���� �����)
UPDATE STUDENTS SET address='���ϱ�', age =16 WHERE num = 2021001;
ROLLBACK;			--���� update������ ���
UPDATE STUDENTS SET address='���ϱ�', age =16 WHERE num = 2021001;
COMMIT;				--�̹� commit�� �� ��ɾ�� rollback ����				
SELECT * FROM STUDENTS ;
ROLLBACK;
----------------------------------------------------------------
--Ʈ����� �������  : rollback, commit
DELETE FROM SCORES;
ROLLBACK;
DELETE FROM SCORES  WHERE num=2019019;
ROLLBACK;
SELECT * FROM SCORES;
-- �� ������� Ʈ����� ���� ����̰� ���� â���� SELECT ����� 2019019�� �����ϴ�.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ� ���� ����(���� Ŀ���� ����)�� ������

----------------------------------------------------------------
--TRUNCATE TABLE SCORES ;		--��� �����͸� ����ϴ�, ROLLBACK �ȵ�

-- ��絥���͸� ���� ���� Ȯ���ϸ� �ٸ� �͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ϱ�

/*	INSERT
 * 	DELETE
 * 	COMMIT;		(1) insert, delete
 * 	UPDATE
 * 	DELETE
 * 	ROLLBACK;	(2) update, delete
 * 	INSERT
 * 	INSERT
 * 	ROLLBACK;	(3) insert 2�� 
 * 	INSERT
 * 	DELDTE
 * 	COMMIT;		(4) insert, delete
 * 
 */
 */














