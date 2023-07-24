-- 타입명칭 
-- 오라클 varchar2(30) -> varchar(30)
-- 오라클 number(10) -> int(10) // int(최대자리수)
-- 오라클 date -> timestamp
-- 오라클 sequence -> auto_increment

-- 제약조건 동일
-- 기본 CRUD문 동일
-- ansi조인 문 동일
-- 서브쿼리절 반드시 서브쿼리절 테이블엘리어스가 반드시 붙음
-- 함수는 찾아서

SELECT @@autocommit; #오토커밋
SET @@autocommit = FALSE;
SET @@autocommit = TRUE;

CREATE TABLE SCORE (
		num int primary key auto_increment, # 자동증가 값
        name varchar(30) not null,
        kor varchar(30),
        eng varchar(30)
);

SELECT * FROM SCORE;
INSERT INTO SCORE(NAME, KOR, ENG) VALUES('홍길동','100','100');

UPDATE SCORE SET KOR = '120' WHERE NUM = 1;

DELETE FROM SCORE WHERE NUM = 1; 
COMMIT;
