--���� custom_id 'mina012' �� ������ ���� ��ȸ : pcode ��ȸ�ϰ� pname�� �� �� ����
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID ='mina012';


--1. �������� (select �ȿ� select��)
SELECT pname FROM TBL_PRODUCT 		--�ܺ�����
WHERE pcode = (						--���ǽ��� = �����̹Ƿ� ���������� 1���� �� ����̿��� ��
SELECT pcode FROM TBL_BUY WHERE custom_id='mina012'
AND buy_date = '2022-2-6');

SELECT pname FROM TBL_PRODUCT 
WHERE pcode IN (					--���ǽ��� IN �����̹Ƿ� ���������� ������ �� ��� ������
SELECT pcode FROM TBL_BUY WHERE custom_id ='mina012');


-- �������� �׽�Ʈ
SELECT pcode 
FROM TBL_BUY  
WHERE CUSTOM_ID ='mina012'
AND BUY_DATE ='2022-2-6';

SELECT pcode FROM TBL_BUY WHERE CUSTOM_ID ='mina012';

--���������� ������ : �ܺ������� ���ǽ��� ����࿡ ���� �˻��ҋ�����
--				 ���������� ����ǹǷ� ó�� �ӵ��� ������ ����  -> ���̺��� ���� ���� ������� ������

--2. select�� ���̺� join : �� �̻��� ���̺�(�ַ� ���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
--		�������� : �� �̻��� ���̺��� ����� �÷��� ���� �� �÷����� "����(=)"�� �̿��Ͽ� join�մϴ�
--				-���� �� ����� ���� ���̺��� ��� �÷��� �������ϴ� ->�÷��� ��9��
--				-�ΰ��� ���� ���� �ุ �������ϴ�

--		����1 : select ~~ from ���̺�1 a, ���̺�2 b
--				WHERE a.�����÷�1 = b.�����÷�1;

--������ ���ؼ� ��ǰ �߰�
INSERT INTO TBL_PRODUCT values('GALAXYS22','A1','������s22',555600);

--join Ű���� ���� ����1
SELECT * 
FROM TBL_PRODUCT tp , TBL_BUY tb 		-- ������ ���̺� 2��
WHERE tp.PCODE = tb.PCODE ;				-- ��������, �����÷����� = �����

--joinŰ���带 ���� ��ɹ� ����2 (ANCI ǥ��)
SELECT * 
FROM TBL_PRODUCT tp 
JOIN TBL_BUY tb 
ON tp.PCODE =tb.PCODE;

--mina012�� ������ ��ǰ���� �����ΰ� ��ȸ�ϱ�
SELECT tp.PNAME  
FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE tp.PCODE = tb.PCODE AND tb.CUSTOM_ID = 'mina012';

SELECT tp.pname
FROM TBL_PRODUCT tp 
JOIN TBL_BUY tb 
ON tp.PCODE  = tb.PCODE AND custom_id = 'mina012';

--mina01�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT tp.PNAME  , tp.PRICE  
FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE tp.PCODE = tb.PCODE AND tb.CUSTOM_ID ='mina012';

SELECT tp.PNAME  , tp.PRICE  
FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE tp.PCODE = tb.PCODE 
AND tb.CUSTOM_ID ='mina012' AND buy_date ='2022-2-6';


-- ���� �׽�Ʈ : tbl_custom�� tbl_buy�� �����ϼ���
SELECT *
FROM TBL_CUSTOM tc , TBL_BUY tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID;

SELECT *
FROM TBL_CUSTOM tc 
JOIN TBL_BUY tb 
ON tc.CUSTOM_ID  = tb.CUSTOM_ID ;

--������ ������� Ư�� �÷��� ����
SELECT tc.CUSTOM_ID ,name, REG_DATE, pcode, quantity 
FROM TBL_CUSTOM tc , TBL_BUY tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ;

--�������� �ܿ� �ٸ� ������ �߰�
SELECT tc.CUSTOM_ID ,name, REG_DATE, pcode, quantity 
FROM TBL_CUSTOM tc , TBL_BUY tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID
AND tc.CUSTOM_ID ='mina012'; 

--������ ��, �̸��� ���� �÷��� ���̺���� �� �����ؾ� ��

-- 3���� ���̺��� ������ �� ������� ?
SELECT * FROM TBL_PRODUCT tp ,
	(SELECT tc.CUSTOM_ID cusid, name,email,age,REG_DATE, pcode, quantity,buy_date,buyno
	FROM TBL_CUSTOM tc,TBL_BUY tb) temp
WHERE tp.PCODE =temp.pcode;

SELECT * 
FROM TBL_BUY tb, TBL_CUSTOM tc, TBL_PRODUCT tp 
WHERE tb.CUSTOM_ID = tb.CUSTOM_ID AND tb.PCODE = tp.PCODE;

SELECT tb.CUSTOM_ID, tb.PCODE, name, age, pname
FROM TBL_BUY tb, TBL_CUSTOM tc, TBL_PRODUCT tp 
WHERE tb.CUSTOM_ID = tb.CUSTOM_ID AND tb.PCODE = tp.PCODE;


-- 3. �ܺ����� (outer join) : = ������ ����ϴ� �����̳� ���ʿ� ���°��� ���ΰ���� ������  

-- join Ű���� ���� ���� 1
SELECT * 
FROM TBL_PRODUCT tp , TBL_BUY tb 		
WHERE tp.PCODE = tb.PCODE(+);		
-- �ܺ����� tbl_buy ���̺� ��ġ�ϴ� pcode	 ���� ��� ����	
-- ���������� null�� �Ǵ� ���̺� �÷��� (+)ǥ��		

-- joinŰ���带 ���� ��ɹ� ����2 (ANCI ǥ��)
SELECT * 
FROM TBL_PRODUCT tp 
LEFT OUTER JOIN TBL_BUY tb ON tp.PCODE =tb.PCODE;	--tbl_product �� ���� ���̺��̸� �� ���� ��� �����Ͽ� ����

SELECT * 
FROM TBL_BUY tb 
RIGHT OUTER JOIN TBL_PRODUCT tp ON tb.PCODE  = tp.PCODE ;
		


