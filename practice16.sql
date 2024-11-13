SELECT *
FROM DEPT2;

1. Dept2 테이블에 아래와 같은내용으로새로운부서정보를입력하세요.
* 부서번호 : 9010
* 부서명 : temp_10
* 상위부서 : 1006
* 지역 : temp area

INSERT INTO DEPT2
VALUES(9010, 'temp_10', 1006, 'temp area');


2. Dept2 테이블에 아래와 같은 내용으로 특정컬럼에만정보를입력하세요
* 부서번호 : 9020
* 부서명 : temp_20
* 상위부서 : Business Department ( 1006 번 부서 )


INSERT INTO DEPT2
VALUES(9020, 'temp_20', 1006, null);

3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서
professor4 테이블에 한꺼번에 입력하는 쿼리를 쓰세요. ( ITAS 방법을 사용하세요 )

CREATE TABLE PROFESSOR4
(
    PROFNO number(4),
    NAME varchar2(20),
    PAY number(3,0)
);

CREATE TABLE PROFESSOR4  --테이블을 만들고 바로 컬럼과 데이터 복사하는 방법!!
AS
SELECT PROFNO, NAME, PAY 
FROM PROFESSOR
WHERE PROFNO <= 3000;

SELECT * FROM PROFESSOR4;

CREATE TABLE PROFESSOR5 --테이블 만들고 컬럼만 복사하는 방법
AS
SELECT PROFNO, NAME, PAY
FROM PROFESSOR
WHERE 1=2;

INSERT INTO PROFESSOR5 --데이터 복사
SELECT PROFNO, NAME, PAY 
FROM PROFESSOR
WHERE PROFNO <= 3000;

DROP TABLE PROFESSOR4;
SELECT * FROM PROFESSOR5;

4. Professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

UPDATE PROFESSOR
SET BONUS = NULL
WHERE NAME = 'Sharon Stone';

SELECT *
FROM PROFESSOR;