--hr ��Ű���� �̿��Ͽ� join�� group by�� �����ؼ� select ������ 10�� �����
--group by ����ε� ������ �� �� �ֽ��ϴ�. ���� : �μ��ο��� ���帹�� �μ���?
-- where > group > having > ORDER 


--1) min_salary �÷��� 10000�̻��� job_title��ȸ
SELECT job_title
FROM jobs
WHERE min_salary >=10000;
--2)job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
SELECT *
FROM JOBS j 
WHERE UPPER(JOB_TITLE)  ='PROGRAMMER';

--3) max salary �ʵ尪�� �÷��� �ִ밪 ��ȸ
SELECT MAX(MAX_SALARY) 
FROM JOBS j ;


-- location Ȱ��
--1) city �÷��� Lodon�� postal_code��ȸ
SELECT postal_code
FROM location
WHERE city = 'Lodon';

--3)lcation_id�÷��� 1700,2700,2500�� �ƴϰ� city �÷��� Tokyo��
-- ��� �÷� ��ȸ
SELECT *
FROM LOCATIONS l 
WHERE location_id NOT IN (1700,2700,2500)
AND city ='Tokyo';


--Jonation Taylor�� �ٹ� �̷� Ȯ���ϱ�
SELECT *
FROM EMPLOYEES e , JOB_HISTORY jh 
WHERE e.EMPLOYEE_ID =jh.EMPLOYEE_ID 
AND FIRST_NAME ='Jonathon' AND LAST_NAME ='Taylor'; 

--����Լ�(�����Լ�) employees ���̺�
SELECT COUNT(*)
FROM EMPLOYEES e ;

SELECT COUNT(*) 
FROM EMPLOYEES e 
WHERE JOB_ID ='HR_REP'

SELECT AVG(SALARY) 
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';

--IT_PROG�� ���� ���� ����
SELECT MIN(SALARY) 
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';


--�����Լ�
SELECT COUNT(*) 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID =d.DEPARTMENT_ID ;

--�μ��� Sales�� ������ �ο��� ��ȸ�ϱ�
SELECT COUNT(*) 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID=d.DEPARTMENT_ID 
AND eDEPARTMENT_ID='Sales';

--�׷��Լ��� �ݵ�� SELECT ������ ����
--jobs���̺� :min_salary�� ��պ��� ���� jb�� ���� ����
SELECT JOB_ID, JOB_TITLE , MIN_SALARY  
FROM JOBS j 
WHERE min_salary < (
	SELECT AVG(MIN_SALARY) FROM JOBS 
);

--�ּұ޿��� �޴� ����� first_name, last_name�÷���ȸ�ϱ�
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES e 
WHERE SALARY =(
	SELECT min(salary) FROM EMPLOYEES WHERE JOB_ID ='IT_PROG');

--rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ����
SELECT rownum, tcnt.* FROM 
(SELECT DEPARTMENT_ID ,COUNT(*) cnt FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;


--�μ��� ��ձݿ��� ��ȸ�ϰ� ������ ��ձ޿� ������������ �μ�_id,�μ���,��ձ޿�(�Ҽ���2�ڸ��� �ݿø�)
-- round(�ݿø�), trunc(����), ceil(����)

-- �׷��Լ� ��ȸ�� �� group by�� ��� ���g���̿� �� �÷��� select�� ��ȸ�� �� ����
-- 	group by �÷��ܿ��� select�� ��������  ->join, ��������
--1�ܰ� : ����� �׷��Լ�
SELECT DEPARTMENT_ID, AVG(SALARY)  
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

--2�ܰ� : �����ϱ� (�׷���� ������� �ؼ�)
SELECT * FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id;


--3�ܰ� : �÷� �����ϱ�
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, ROUND(tavg.cavg,1)  FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg desc;


--4�ܰ� : ������ ����� Ư�� ��ġ ����
-- first n�� ���� n���� ��ȸ
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, ROUND(tavg.cavg,1)  FROM DEPARTMENTS d,
(SELECT DEPARTMENT_ID, AVG(SALARY) cavg FROM EMPLOYEES GROUP BY DEPARTMENT_ID) tavg
WHERE d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC
FETCH FIRST 5 ROWS ONLY;



--�ٸ� ����
SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME , e.cnt
FROM DEPARTMENTS d , 
	(SELECT DEPARTMENT_ID, COUNT(*) cnt FROM EMPLOYEES e
	GROUP BY DEPARTMENT_ID) e
	WHERE d.DEPARTMENT_ID =e.DEPARTMENT_ID 
	ORDER BY cnt DESC 	
FETCH FIRST 1 ROWS ONLY;
--fetch�� 12c��������


--����Ŭ�� rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�
--			�����÷� ����� ���� join�� �� �� �� �ʿ���

SELECT rownum, tcnt.*
FROM (SELECT department_id,COUNT(*) cnt FROM EMPLOYEES 
	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum < 5;

-- rownum ����� �� ���Ȯ���� �ȵǴ� ���� : rownum 1���� �����ؼ� ã�ư��� �ִ� ���ǽĸ� ����
--WHERE rownum =3;
--WHERE rownum >5;

SELECT * FROM 
	(SELECT rownum rn, tcnt.* FROM (SELECT DEPARTMENT_ID, COUNT(*) cnt FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt)
WHERE rn BETWEEN 5 AND 9;




--�ƴ� �� ǥ���ҋ�
SELECT MIN(salary) FROM EMPLOYEES e WHERE NOT JOB_ID ='IT_PROG';  
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID <>'IT_PROG';  
 

