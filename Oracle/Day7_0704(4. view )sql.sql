-- view : 가상 테이블(물리적으로 존재하지 않고 논리적으로 만들어진 테이블)
--          ㄴ 물리적인 테이블을 이용해서 생성합니다.
--			ㄴ 사용자(개발자)가 테이블처럼 select 를 조회를 할수 있는 테이블
--			   자주 사용되는 join등을 미리 view 생성해서 사용합니다.
--			ㄴ grant resource,connect to idev;   -> resource 에 view 생성은 제외입니다.


--grant create view to c##idev;  -> 권한 부여

CREATE VIEW v_buy
AS
SELECT tb.CUSTOM_ID ,tb.PCODE , tc.EMAIL ,tb.QUANTITY 
FROM TBL_BUY tb , TBL_CUSTOM tc 
WHERE tb.CUSTOM_ID = tc.CUSTOM_ID ;


--------------------------------------------------------------------

CREATE VIEW v_dept
AS 
SELECT d.DEPARTMENT_ID , DEPARTMENT_NAME , e.EMPLOYEE_ID ,e.FIRST_NAME ,e.HIRE_DATE ,e.JOB_ID 
FROM DEPARTMENTS d , EMPLOYEES e 
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID ;

SELECT * FROM v_dept WHERE job_id ='ST_CLERK';

SELECT * FROM TBL_CUSTOM tc ;


INSERT INTO TBL_CUSTOM(custom_id, name, EMAIL) VALUES();

ALTER TRIGGER secure_custom disable;
UPDATE TBL_CUSTOM SET EMAIL ='test@gmail.com' WHERE CUSTOM_ID ='twice';


SELECT * FROM TBL_CUSTOM tc ;

DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID = 'sowon';
ROLLBACK;


