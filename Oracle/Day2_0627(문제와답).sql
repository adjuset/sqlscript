--���� ���̺�
--	���� ID, �̸� ��, �̸���, ����ȣ, �������, ����_ID, �޿�, �Ŵ���ID, �μ�ID

--1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���
SELECT first_name,last_name,email FROM EMPLOYEES 
WHERE HIRE_DATE <'2006-01-01';

--2. lastname�� 'Jones' �� ������ ��� �÷�
SELECT * FROM EMPLOYEES 
WHERE LAST_NAME ='Jones';

--3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ
SELECT first_name, last_name, job_id
FROM EMPLOYEES
WHERE salary >= 5000;

--4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ
SELECT first_name, last_name, salary
FROM EMPLOYEES 
WHERE JOB_ID LIKE '%ACCOUNT%';

--5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
SELECT EMPLOYEE_ID, first_name, last_name 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN(50,60,80,90);