--hr ��Ű���� �̿��Ͽ� join�� group by�� �����ؼ� select ������ 10�� �����
--group by ����ε� ������ �� �� �ֽ��ϴ�. ���� : �μ��ο��� ���帹�� �μ���?
-- where > group > having > ORDER 


--1. pname �׷�ȭ�ϰ� ���� ��Ѱ��� pname ���? 
SELECT pname, MAX(price)
FROM TBL_PRODUCT 
GROUP BY pname;

--2. �ڵ庰 ���� ���� �� ���� �����ڵ�� ���ż��� ��ȸ�ض�
SELECT PCODE,MAX(QUANTITY) 
FROM TBL_BUY tb
GROUP BY PCODE;

--3. ���� �� ������ ���� �߿��� ���� ���� �ȸ� ������ ������ ���� id��?
SELECT CUSTOM_ID , MIN(QUANTITY)
FROM TBL_BUY tb
GROUP BY CUSTOM_ID;

--4. �ڵ庰�� �׷�ȭ �� ������ ��ǰ�� ó�� �ȸ� �� ��¥��� ? 
SELECT PCODE, MIN(BUY_DATE) 
FROM TBL_BUY 
GROUP BY PCODE;


 

--7. custom_id�� wonder�� ���� ���̴� ? 
SELECT AGE 
FROM TBL_CUSTOM tc 
WHERE CUSTOM_ID ='wonder';

--8. �������ڰ� 2022-02-06�� ����� ���� ���� ���� �� ����� �̸���?

--9. �� twice�� �� ������ �̸��� ������ ? 
SELECT tp.PNAME , tp.PRICE 
FROM TBL_BUY tb, TBL_PRODUCT tp 
WHERE tb.PCODE = tp.PCODE 
AND tb.CUSTOM_ID ='twice';

--10. ��ǰ���� ������ ���� ���� �� �����id��?

 

