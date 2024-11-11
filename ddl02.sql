--ddl02 제약조건

CREATE TABLE tt01
( 
    no NUMBER(3) UNIQUE , --중복값을 못 넣는다.
    name VARCHAR2(10) NOT NULL,
    hiredate DATE 
);

SELECT *
FROM tt01;

INSERT INTO tt01
VALUES (1, '이름1', SYSDATE);

INSERT INTO tt01
VALUES (2, '이름2', SYSDATE);

INSERT INTO tt01
VALUES (3, null, SYSDATE);

CREATE TABLE tt03
(
    no NUMBER(3)
        CONSTRAINT tt03_no__uk UNIQUE,
    name VARCHAR2(10)
        CONSTRAINT tt03_name_nn NOT NULL,
    --score NUMBER(3) CHECK (score BETWEEN 0 AND 100)
    score NUMBER(3)
        CONSTRAINT tt03_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT tt03_pass_ch CHECK (pass IN ('Y', 'N'))
);

--Oracle DB 숫자/문자/날짜 boolean X True/False

1:ture 0:false
Y:ture N:false
T:ture F:false
true:true false:false

SELECT * FROM tt03;

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y');

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y'); --중복 UNIQUE

INSERT INTO tt03
VALUES (2, NULL, 50, 'Y'); --NULL 오류

INSERT INTO tt03
VALUES (2, '이름2', 500, 'Y'); --SCORE 범위오류

INSERT INTO tt03
VALUES (2, '이름2', 50, 'T'); --PASS 'Y' OR 'N' 가능

SELECT *
FROM DEPARTMENT;