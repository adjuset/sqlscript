-- 주제 : 행을 그룹화하고 그룹함수를 사용합니다.  사용하는 순서는 아래처럼 합니다.
-- select 문 그룹함수 from 테이블 이름
--		[WHERE]  그룹화 하기 전에 사용할 조건식
--		group by 그룹화에 사용할 컬럼명
--		[HAVING] 그룹화 결과에 대한 조건식  
--		[order by] 그룹화 결과 정렬할 컬럼명과 방식



SELECT PCODE, count(*) 
FROM TBL_BUY tb 
GROUP BY pcode;

SELECT PCODE, count(*), sum(QUANTITY) 
FROM TBL_BUY tb 
GROUP BY 2;		-- 조회된 컬럼의 위치

SELECT PCODE, count(*) cnt, sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP BY PCODE		-- 조회된 컬럼의 위치
ORDER BY cnt;		

-- 그룹화 후에 수량합계가 3이상만 조회
SELECT PCODE, count(*) cnt, sum(QUANTITY) total
FROM TBL_BUY tb 
GROUP BY PCODE			-- 조회된 컬럼의 위치
HAVING SUM(QUANTITY) >= 3 
ORDER BY cnt;

--구매날짜가 2022-04-01 이후인 것만 크룹화하여 출력
SELECT PCODE, count(*) cnt, SUM(QUANTITY) total 
FROM TBL_BUY tb
WHERE BUY_DATE >='2022-04-01'
GROUP BY PCODE
ORDER BY cnt;




