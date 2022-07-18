-- ���� : ���� �׷�ȭ�ϰ� �׷��Լ��� ����մϴ�.  ����ϴ� ������ �Ʒ�ó�� �մϴ�.
-- select �� �׷��Լ� from ���̺� �̸�
--		[WHERE]  �׷�ȭ �ϱ� ���� ����� ���ǽ�
--		group by �׷�ȭ�� ����� �÷���
--		[HAVING] �׷�ȭ ����� ���� ���ǽ�  
--		[order by] �׷�ȭ ��� ������ �÷���� ���



SELECT PCODE, count(*) 
FROM TBL_BUY tb 
GROUP BY pcode;

SELECT PCODE, count(*), sum(QUANTITY) 
FROM TBL_BUY tb 
GROUP BY 2;		-- ��ȸ�� �÷��� ��ġ

SELECT PCODE, count(*) cnt, sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP BY PCODE		-- ��ȸ�� �÷��� ��ġ
ORDER BY cnt;		

-- �׷�ȭ �Ŀ� �����հ谡 3�̻� ��ȸ
SELECT PCODE, count(*) cnt, sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP BY PCODE			-- ��ȸ�� �÷��� ��ġ
HAVING SUM(QUANTITY) >= 3 
ORDER BY cnt;

--���ų�¥�� 2022-04-01 ������ �͸� ũ��ȭ�Ͽ� ���
SELECT PCODE, count(*) cnt, SUM(QUANTITY) total 
FROM TBL_BUY tb
WHERE BUY_DATE >='2022-04-01'
GROUP BY PCODE
ORDER BY cnt;




