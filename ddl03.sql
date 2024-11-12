--ddl03


--외래키 참조하는 테이블에 존재하는 값만 저장 가능!! (+NULL 가능)
--외래키 설정된 테이블에서 자신을 참조하는 데이터가 존재(자식)하는 경우 삭제 불가능. 

--외래키 삭제조건
ON DELETE CASCADE; --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; --부모 데이터 삭제시, 참조하는 자식 데이터를 NULL로 변경


DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    id number(3) primary key,
    name VARCHAR2(30),
    club_id REFERENCES T_CLUB(id) ON DELETE CASCADE --T_CLUB 테이블에 있는 ID 컬럼을 참조하겠다.  
)
;

CREATE TABLE T_CLUB
(
    id number(3) primary key,
    name VARCHAR2(30)
)
;

SELECT *
FROM T_CLUB;

INSERT INTO T_CLUB
VALUES (1, '독서');

INSERT INTO T_CLUB
VALUES (2, '등산');

INSERT INTO T_CLUB
VALUES (3, '낚시');

INSERT INTO T_MEMBER
VALUES (1, '가이름', 3);

SELECT * FROM T_MEMBER;

SELECT *
FROM T_MEMBER M, T_CLUB C
WHERE M.CLUB_ID = C.ID;

INSERT INTO T_MEMBER
VALUES (2, '나이름', 2);

INSERT INTO T_MEMBER
VALUES (3, '다이름', 1);

INSERT INTO T_MEMBER
VALUES (4, '라이름', NULL);

SELECT * FROM T_CLUB;

SELECT * FROM T_MEMBER;

SELECT *
--DELETE
FROM T_CLUB
WHERE ID=3;

UPDATE T_MEMBER
SET CLUB_ID = NULL
WHERE ID = 1;

-- 데이터 딕셔너리
-- USER_ / DBA_ / ALL_
-- INDEXES / CONSTRAINTS / TABLES / SEQUENCES / SYNONYMS
-- VIEWS / ROLES 

SELECT *
FROM USER_TABLES;

SELECT *
FROM TAB; --테이블 이름 정보


SELECT *  --테이블 이름 찾기
FROM TAB
WHERE TNAME LIKE '%STU%';

-----
CREATE TABLE tt05
( 
    id number,
    no number,
    age number,
        CONSTRAINT tt05_pk PRIMARY KEY (id, no) --PK를 두 컬럼을 묶어서 설정하는 방법(PK 1개)
);
