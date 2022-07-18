--hr 스키마를 이용하여 join과 group by를 포함해서 select 문제를 10개 만들기
--group by 결과로도 조인을 할 수 있습니다. 예시 : 부서인원이 가장많은 부서는?
-- where > group > having > ORDER 


--1. pname 그룹화하고 가장 비싼값과 pname 출력? 
SELECT pname, MAX(price)
FROM TBL_PRODUCT 
GROUP BY pname;

--2. 코드별 제일 많이 산 고객의 물건코드와 구매수량 조회해라
SELECT PCODE,MAX(QUANTITY) 
FROM TBL_BUY tb
GROUP BY PCODE;

--3. 고객이 산 물건의 수량 중에서 가장 적게 팔린 물건의 개수와 고객의 id는?
SELECT CUSTOM_ID , MIN(QUANTITY)
FROM TBL_BUY tb
GROUP BY CUSTOM_ID;

--4. 코드별로 그룹화 후 각각의 제품이 처음 팔린 날 날짜출력 ? 
SELECT PCODE, MIN(BUY_DATE) 
FROM TBL_BUY 
GROUP BY PCODE;


 

--7. custom_id가 wonder인 고객의 나이는 ? 
SELECT AGE 
FROM TBL_CUSTOM tc 
WHERE CUSTOM_ID ='wonder';

--8. 구매일자가 2022-02-06인 사람중 제일 많은 양을 산 사람의 이름은?

--9. 고객 twice가 산 물건의 이름과 가격은 ? 
SELECT tp.PNAME , tp.PRICE 
FROM TBL_BUY tb, TBL_PRODUCT tp 
WHERE tb.PCODE = tp.PCODE 
AND tb.CUSTOM_ID ='twice';

--10. 상품별로 물건을 제일 많이 산 사람의id는?

 

