--평가 학습모듈 : sql 활용
-- 	문제 3개 각각 SQL파일을 PDF로 변환하여 파일첨부하세요 (작성자 쓰기)
-- 프린트하기에서 PDF 선택하면 됨 
--직접 작성해서 실행결과 확인하고 답안 제출하세요
-- tbl_product, tbl_member, tbl_buy를 기본으로 합니다.

-- 테이블명은 다릅니다. 테이블은 컬럼, 기본키, 외래키, 기본값 설정해서 생성합니다
-- 위에 3개 이외에 추가되는 테이블 추가 생성
-- 시퀀스 생성
-- 테이블 변경 : 컬럼 추가, 외래키 추가
ALTER TABLE 컬럼명 ADD 컬럼이름 NUMBER(5,0)
ALTER TABLE 테잉르병 ADD CONSTRAINT 태이블_fk FOREIGN KEY(컬럼명) REFERENCES 테이블명(컬럼명);

-- 데이터 insert : 기존 소스 참고 가능합니다.
-- DML : insert, update, delete, select 작성

-- create view
-- select
-- 1) 조회할 컬럼 선택
-- 2) where 조건, order BY 
-- 3) 서브쿼리
-- 4) 조인, 외부조인
-- 5) 통계함수
-- 6) group BY 
-- 7) 오라클 함수 : to_Char, TO_DATE(),DECODE(),nvl() 
SELECT to_char(sysdate,'YYYY') FROM dual;

-- 다음 평가 학습모듈 : 데이터 입출력 구현
--JDBC


CREATE OR REPLACE PROCEDURE procEmSal
(v_empno IN number)		--매개변수
IS 
	v_sal NUMBER;		--지역변수
BEGIN
	SELECT SALARY INTO v_sal 	-- v_sal = salary
	FROM employees
	WHERE EMPLOYEE_ID = v_empno;
	dbms_output.put_line(v_sal);
END;


--사원번호를 입력받아 이름과 급여 출력
CREATE OR REPLACE PROCEDURE pro
(v_empno IN NUMBER)
IS 	
	v_sal NUMBER;
	ename varchar2(100);
BEGIN
	SELECT e.EMAIL, e.SALARY INTO ename, v_sal
	FROM EMPLOYEES e 
	WHERE e.EMPLOYEE_ID = v_empno;
	dbms_output.put_line(ename||' '||v_sal)
END;





