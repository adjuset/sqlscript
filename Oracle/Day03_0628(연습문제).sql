--학생테이블 추가
CREATE TABLE students(
	num varchar2(10) PRIMARY KEY,
	name varchar2(10) NOT NULL,
	age NUMBER,
	address varchar2(10)
);

INSERT INTO students values(2021001,'김모모',16,'서초구');
INSERT INTO students values(20190119,'강다현',18,'강남구');


CREATE TABLE scores(
	num varchar2(10),
	subject varchar2(10),
	score number(3) NOT NULL,
	teacher varchar2(10) NOT NULL,
	semester varchar2(10) NOT NULL,
	PRIMARY key(num, subject),		--기본 키 설정(not num + unique)
	FOREIGN KEY(num) REFERENCES students(num)
	--외래키설정 refernces(참조) 키워드 뒤에 참조테이블(참조컬럼)
	--외래키 컬럼은 foreign key 키워드 뒤에 작성
	-- 참조컬럼의 조건은 ? 기본키 또는 unique 제약조건 컬럼만 됨
);


INSERT INTO scores values(2021001,'국어',89,'이나연','2022_1');
INSERT INTO scores values(2021001,'영어',78,'김길동','2022_1');
INSERT INTO scores values(2021001,'과학',67,'박세리','2022_2');
INSERT INTO scores values(20190119,'국어',92,'이나연','2019_2');
INSERT INTO scores values(20190119,'영어',85,'박지성','2019_2');
INSERT INTO scores values(20190119,'과학',88,'박세리','2020_1');

SELECT * FROM SCORES;


CREATE TABLE tbl_scores(
	num varchar2(10),
	subject varchar2(10),
	score number(3) NOT NULL,
	teacher varchar2(10) NOT NULL,
	semester varchar2(10) NOT NULL
);
--alter table ~ add constraints ~
ALTER TABLE tbl_scores 
ADD CONSTRAINTS  pk_scores PRIMARY KEY(num,subject);

ALTER TABLE tbl_scores
	ADD CONSTRAINTS fk_score FOREIGN KEY(num)
	REFERENCES students(num);










