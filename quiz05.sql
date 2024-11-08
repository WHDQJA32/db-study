SELECT *
FROM PANMAE;

SELECT *
FROM PRODUCT;

SELECT *
FROM GIFT;

SELECT 
        --P.P_DATE 판매일자,
        TO_CHAR(TO_DATE(P.P_DATE), 'YYYY-MM-DD') 판매일자, --P.P_DATE를 데이트형식으로 바꾸고 그 다음 문자형식으로 출력한다.
        --SUBSTR(P.P_DATE, 1, 4)||'-'||SUBSTR(P.P_DATE, 5, 2)||'-'||SUBSTR(P.P_DATE, 7, 2)
        P.P_CODE 상품코드, 
        P1.P_NAME 상품명, 
        TO_CHAR(P1.P_PRICE,'9,999') 상품가, 
        P.P_QTY 구매수량, 
        TO_CHAR(P.P_TOTAL, '9,999') 총금액, 
        TO_CHAR(P.P_TOTAL*100, '999,999') 적립포인트,
        /*CASE
            TO_CHAR(TO_DATE(P.P_DATE), 'MMDD')
            WHEN '0101' THEN '새해첫날이벤트'
            ELSE '이벤트아님'
        END,*/
        TO_CHAR(DECODE(SUBSTR(P.P_DATE, 5, 4), '0101', P.P_TOTAL*200, P.P_TOTAL*100), '9,999,999') 새해2배적립포인트,--TO_CHAR 걸었다.
        G.GNAME 사은품명,
        TO_CHAR(G.G_START, '999,999') 포인트START,
        TO_CHAR(G.G_END, '999,999') 포인트END
FROM PANMAE P, PRODUCT P1, GIFT G
WHERE P.P_CODE = P1.P_CODE
    AND DECODE(SUBSTR(P.P_DATE, 5, 4), '0101', P.P_TOTAL*200, P.P_TOTAL*100) BETWEEN G.G_START AND G.G_END
    ORDER BY P.P_DATE
;