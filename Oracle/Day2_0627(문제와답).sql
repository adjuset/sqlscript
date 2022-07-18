--직원 테이블
--	직원 ID, 이름 성, 이메일, 폰번호, 고용일자, 업무_ID, 급여, 매니저ID, 부서ID

--1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일
SELECT first_name,last_name,email FROM EMPLOYEES 
WHERE HIRE_DATE <'2006-01-01';

--2. lastname이 'Jones' 인 직원의 모든 컬럼
SELECT * FROM EMPLOYEES 
WHERE LAST_NAME ='Jones';

--3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회
SELECT first_name, last_name, job_id
FROM EMPLOYEES
WHERE salary >= 5000;

--4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회
SELECT first_name, last_name, salary
FROM EMPLOYEES 
WHERE JOB_ID LIKE '%ACCOUNT%';

--5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회
SELECT EMPLOYEE_ID, first_name, last_name 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN(50,60,80,90);