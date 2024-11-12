--dml02 merge


--신발가게 날짜별 매출
DROP TABLE SHOE_M;
DROP TABLE CLOT_M;
DROP TABLE COMP_M;

CREATE TABLE SHOE_M
(
    w_date DATE,
    s_code number(3), --매장고유코드
    sales number(10)
);

--옷가게 날짜별 매출
CREATE TABLE CLOT_M
(
    w_date DATE,
    s_code number(3), --매장고유코드
    sales number(10)
);

--본사 전체 매출

CREATE TABLE COMP_M
(
    w_date DATE,
    s_code number(3), --매장고유코드
    sales number(10)
);

DROP TABLE COMP_M;
CREATE TABLE COMP_M
(
    w_date DATE,
    s_code number(3), --매장고유코드
    sales number(10),
    type VARCHAR2(2) -- 가게 구분 코드 'C'옷가게 , 'S' 신발가게
);



--하나의 가게
--날짜별 여러가게
--날짜구분 코드

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 1, 5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 1, 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 1, 20000)
SELECT * FROM dual;

UPDATE SHOE_M -- 데이터 값 수정
SET SALES = 9000
WHERE W_DATE = '2024-11-02';

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 50, 9000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 50, 13000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 50, 95000)
SELECT * FROM dual;

UPDATE CLOT_M -- 데이터 값 수정
SET SALES = 94000
WHERE W_DATE = '2024-11-06';


SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

DELETE FROM COMP_M; -- 컬럼은 남기고 데이터 전체 삭제

INSERT INTO COMP_M -- 복사
SELECT * FROM SHOE_M;

INSERT INTO COMP_M -- 복사
SELECT * FROM CLOT_M;

SELECT S_CODE, SUM(SALES)
FROM COMP_M
GROUP BY S_CODE;

SELECT SUM(SALES)
FROM COMP_M
WHERE TO_CHAR(W_DATE, 'MM') = 11;

--MERGE 사용법!!
--하나의 가게 + 날짜 중복 X
MERGE INTO COMP_M M
USING SHOE_M S
ON (M.W_DATE = S.W_DATE)
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES);
    
MERGE INTO COMP_M M
USING CLOT_M S
ON (M.W_DATE = S.W_DATE)
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES);
    
SELECT * FROM COMP_M;

--날짜별 여러가게

MERGE INTO COMP_M M
USING SHOE_M S
ON (M.W_DATE = S.W_DATE AND M.S_CODE = S.S_CODE) --날짜 컬럼과 가게코드 컬럼까지 기준으로 잡는다.
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES);
    
MERGE INTO COMP_M M
USING CLOT_M S
ON (M.W_DATE = S.W_DATE AND M.S_CODE = S.S_CODE)
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES);

--날짜별 데이터 추가

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 2, 15000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 2, 20000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 2, 80000)
SELECT * FROM dual;

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 60, 19000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 60, 33000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 60, 62000)
SELECT * FROM dual;

SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

SELECT S_CODE, SUM(SALES)
FROM COMP_M
GROUP BY S_CODE;

SELECT W_DATE, SUM(SALES)
FROM COMP_M
GROUP BY W_DATE
ORDER BY W_DATE;

SELECT SUM(SALES)
FROM COMP_M
WHERE TO_CHAR(W_DATE, 'MM') = 11;

--가게구분 코드

SELECT *
FROM COMP_M;        --신발가게 매출만 OR 옷가게 매출


MERGE INTO COMP_M M
USING SHOE_M S
ON (M.W_DATE = S.W_DATE AND M.S_CODE = S.S_CODE) 
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES, 'S'); --'S' 가 마지막 컬럼에 들어가게
    
MERGE INTO COMP_M M
USING CLOT_M S
ON (M.W_DATE = S.W_DATE AND M.S_CODE = S.S_CODE)
WHEN MATCHED THEN --조건이 일치하면 가져와서 보여주겠다.
    UPDATE SET M.SALES = S.SALES    
WHEN NOT MATCHED THEN --조건이 일치하지 않으면 복사해서 보여주겠다.
    INSERT VALUES (S.W_DATE, S.S_CODE, S.SALES, 'C');
    
SELECT TYPE, S_CODE, SUM(SALES)
FROM COMP_M
GROUP BY TYPE, S_CODE;
