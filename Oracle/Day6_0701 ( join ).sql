-- select �⺻����
-- select �÷�1, �÷�2 ..from ���̺�� where �˻����ǽ� 
-- order by �����÷� (�⺻�� ���� : ASC, ����:DESC) 

SELECT * FROM tbl_buy tb; 		--insert�� ������ ������
SELECT * FROM TBL_CUSTOM tc ; 
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID;
SELECT * FROM TBL_BUY WHERE CUSTOM_ID ='mina012';

SELECT * FROM TBL_BUY 
WHERE CUSTOM_ID ='mina012'
ORDER BY BUY_DATE DESC ;
-- �ֱ� ��¥�� ���� ������ �� : DESC
-- WHERE > ORDER BY ������


-- ��ȸ�� �÷� ������ �� distinct Ű���� : �ߺ����� 1���� ������ 
SELECT custom_id FROM TBL_BUY tb ;			--���Ű� id��ȸ
SELECT DISTINCT custom_id FROM TBL_BUY tb ;




