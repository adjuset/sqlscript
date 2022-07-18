--DDL : CREATE, ALTER, DROP , TRUNCATE  
--		(대상은 user, table,sequence,view, .. 단 truncate는 테이블만 사용)
--CML : INSERT, UPDATE, DELETE	   -> 트랜잭션으로 관리됨		   

DROP TABLE students0;		--오류 : students0 테이블을 먼저 삭제해야함 
							--원인 : 외래키에 의해 참조되는 고유/기본키가 테이블에 있다
DROP TABLE SCORES;


--UPDATE 테이블명 SET 컬럼명 = 값, 컬럼명 = 값, 컬럼명 = 값 ..
--	WHERE 조건컬럼 관계식
--DELETE FROM 테이블명 WHERE 조건컬럼관계식
--주의할점 : UPDATE와 DELETE는 WHERE 없이 사용하는 것은 위험한 동작
--		  truncate는 실행을 취소(rollback)할 수 없기 때문에 DDL에 해당
SELECT * FROM STUDENTS s ;

--update, delete, select에서 where 의 컬럼이 기본키 컬럼으로 동등조건이면
--실행되는 결과 반영되는 행은 몇개일까요? 최대 1개
-- 기본키의 목적은 테이블의 여러행들을 구분(식별)
UPDATE STUDENTS SET age = 17 WHERE num =2021001;

--rollback, commit테스트 (데이터베이스 메뉴에서 트랜젝션 모드를 manual로 변경합니다 ->None으로 변경됨)
UPDATE STUDENTS SET address='성북구', age =16 WHERE num = 2021001;
ROLLBACK;			--위의 update실행을 취소
UPDATE STUDENTS SET address='성북구', age =16 WHERE num = 2021001;
COMMIT;				--이미 commit이 된 명령어는 rollback 못함				
SELECT * FROM STUDENTS ;
ROLLBACK;
----------------------------------------------------------------
--트랜잭션 관리명령  : rollback, commit
DELETE FROM SCORES;
ROLLBACK;
DELETE FROM SCORES  WHERE num=2019019;
ROLLBACK;
SELECT * FROM SCORES;
-- 이 편집기는 트랜잭션 수동 모드이고 같은 창에서 SELECT 결과가 2019019가 없습니다.
-- 다른 편집기는 다른 클라이언트 이므로 이전 상태(최종 커밋한 상태)로 보여짐

----------------------------------------------------------------
--TRUNCATE TABLE SCORES ;		--모든 데니터를 지웁니다, ROLLBACK 안됨

-- 모든데이터를 지울 것이 확실하면 다른 것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 하기

/*	INSERT
 * 	DELETE
 * 	COMMIT;		(1) insert, delete
 * 	UPDATE
 * 	DELETE
 * 	ROLLBACK;	(2) update, delete
 * 	INSERT
 * 	INSERT
 * 	ROLLBACK;	(3) insert 2개 
 * 	INSERT
 * 	DELDTE
 * 	COMMIT;		(4) insert, delete
 * 
 */
 */














