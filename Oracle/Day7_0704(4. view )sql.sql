-- view : ���� ���̺�(���������� �������� �ʰ� �������� ������� ���̺�)
--          �� �������� ���̺��� �̿��ؼ� �����մϴ�.
--			�� �����(������)�� ���̺�ó�� select �� ��ȸ�� �Ҽ� �ִ� ���̺�
--			   ���� ���Ǵ� join���� �̸� view �����ؼ� ����մϴ�.
--			�� grant resource,connect to idev;   -> resource �� view ������ �����Դϴ�.


--grant create view to c##idev;  -> ���� �ο�

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


