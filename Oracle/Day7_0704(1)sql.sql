--hr 스키마를 이용하여 join과 group by를 포함해서 select 문제를 10개 만들기
--group by 결과로도 조인을 할 수 있습니다. 예시 : 부서인원이 가장많은 부서는?
-- where > group > having > ORDER 


--1) min_salary 컬럼이 10000이상인 job_title조회
SELECT job_title
FROM jobs
WHERE min_salary >=10000;
--2)job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
SELECT *
FROM JOBS j 
WHERE UPPER(JOB_TITLE)  ='PROGRAMMER';

--3) max salary 필드값의 컬럼의 최대값 조회
SELECT MAX(MAX_SALARY) 
FROM JOBS j ;


-- location 활용
--1) city 컬럼이 Lodon인 postal_code조회
SELECT postal_code
FROM location
WHERE city = 'Lodon';

--3)lcation_id컬럼이 1700,2700,2500이 아니고 city 컬럼이 Tokyo인
-- 모든 컬럼 조회
SELECT *
FROM LOCATIONS l 
WHERE location_id NOT IN (1700,2700,2500)
AND city ='Tokyo';


--Jonation Taylor의 근무 이력 확인하기
SELECT *
FROM EMPLOYEES e , JOB_HISTORY jh 
WHERE e.EMPLOYEE_ID =jh.EMPLOYEE_ID 
AND FIRST_NAME ='Jonathon' AND LAST_NAME ='Taylor'; 

--통계함수(집계함수) employees 테이블
SELECT COUNT(*)
FROM EMPLOYEES e ;

SELECT COUNT(*) 
FROM EMPLOYEES e 
WHERE JOB_ID ='HR_REP'

SELECT AVG(SALARY) 
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';

--IT_PROG중 제일 작은 봉급
SELECT MIN(SALARY) 
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';


--조인함수
SELECT COUNT(*) 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID =d.DEPARTMENT_ID ;

--부서명 Sales의 직원들 인원수 조회하기
SELECT COUNT(*) 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID=d.DEPARTMENT_ID 
AND eDEPARTMENT_ID='Sales';

--그룹함수는 반드시 SELECT 문으로 사용됨
--jobs테이블 :min_salary가 평균보다 작은 jb에 대한 정보
SELECT JOB_ID, JOB_TITLE , MIN_SALARY  
FROM JOBS j 
WHERE min_salary < (
	SELECT AVG(MIN_SALARY) FROM JOBS 
);

--최소급여를 받는 사람의 first_name, last_name컬럼조회하기
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES e 
WHERE SALARY =(
	SELECT min(salary) FROM EMPLOYEES WHERE JOB_ID ='IT_PROG');

--rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값임
SELECT rownum, tcnt.* FROM 
(SELECT DEPARTMENT_ID ,COUNT(*) cnt FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;


--부서별 평균금여를 조회하고 정렬은 평균급여 내림차순으로 부서_id,부서명,평균급여(소수점2자리로 반올림)
-- round(반올림), trunc(버림), ceil(내림)

-- 그룹함수 조회할 때 group by를 써야 그훕바이에 쓴 컬럼을 select로 조회할 수 있음
-- 	group by 컬럼외에는 select에 쓸수없음  ->join, 서브쿼리
--1단계 : 사용할 그룹함수
SELECT DEPARTMENT_ID, AVG(SALARY)  
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

--2단계 : 조인하기 (그룹명을 보여줘야 해서)
SELECT * FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id;


--3단계 : 컬럼 지정하기
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, ROUND(tavg.cavg,1)  FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg desc;


--4단계 : 정렬한 결과로 특정 위치 지정
-- first n은 상위 n개를 조회
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, ROUND(tavg.cavg,1)  FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC
FETCH FIRST 5 ROWS ONLY;



--다른 예시
SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME , e.cnt
FROM DEPARTMENTS d , 
	(SELECT DEPARTMENT_ID, COUNT(*) cnt FROM EMPLOYEES e
	GROUP BY DEPARTMENT_ID) e
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	ORDER BY cnt DESC 	
FETCH FIRST 1 ROWS ONLY;
--fetch는 12c버전부터


--오라클은 rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값입니다
--			가상ㅋ컬럼 사용을 위해 join이 한 번 더 필요함

SELECT rownum, tcnt.*
FROM (SELECT department_id,COUNT(*) cnt FROM EMPLOYEES 
	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum < 5;

-- rownum 사용할 때 결과확인이 안되는 예시 : rownum 1부터 시작해서 찾아갈수 있는 조건식만 가능
--WHERE rownum =3;
--WHERE rownum >5;

SELECT * FROM 
	(SELECT rownum rn, tcnt.* FROM (SELECT DEPARTMENT_ID, COUNT(*) cnt FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt)
WHERE rn BETWEEN 5 AND 9;




--아닌 것 표시할떄
SELECT MIN(salary) FROM EMPLOYEES e WHERE NOT JOB_ID ='IT_PROG';  
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID <>'IT_PROG';  
 

