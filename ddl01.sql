---ddl

CREATE TABLE new_table
(
    no NUMBER(3),
    name VARCHAR2(10),
    birth DATE
);

SELECT *
FROM new_table;

desc new_table;

SELECT SYSDATE FROM DUAL;

CREATE TABLE tt02
( 
    no NUMBER(3,1) DEFAULT 0,
    NAME VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
);

SELECT *
FROM tt02;


--테이블 복사
CREATE TABLE dept3
as
SELECT * FROM DEPT2;  ---구조 + 데이터 전체 복사

CREATE TABLE dept4
as
SELECT DCODE, AREA FROM DEPT2; ---컬럼 2개 + 데이터 복사

CREATE TABLE dept5 --컬럼구조만 복사(데이터X)
as
SELECT *
FROM DEPT2
WHERE 1=2; --거짓 조건

SELECT *
FROM DEPT4;

SELECT *
FROM DEPT5;

--테이블 변경 (컬럼추가)
ALTER TABLE dept4
ADD (location VARCHAR2(10));

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');

--임시부서 여부를 체크 컬럼명 temp_code 'Y'임시부터, 'N'정식부서

ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');

SELECT * 
FROM DEPT4;

--컬럼 삭제

ALTER TABLE dept4 
DROP COLUMN LOCATION;

SELECT * 
FROM DEPT4;

SELECT * FROM DEPT4;

SELECT * FROM DEPT6;

SELECT * FROM DEPT5;

CREATE TABLE DEPT6
AS
SELECT * FROM DEPT4;

--테이블 삭제(ROLLBACK 불가 / 자동 COMMIT O)

DROP TABLE DEPT5; --테이블 자체를 삭제

TRUNCATE TABLE DEPT6; --컬럼은 놔두고 데이터값을 전체삭제 

