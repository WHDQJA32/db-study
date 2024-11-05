단일행 함수

임시로 사용하는 테이블 dual --from에 사용하는 임시 테이블

SELECT ename, INITCAP('ABCDE'), INITCAP(ename) --첫글자만 대문자 뒤는 소문자
from emp;

SELECT LOWER(name), UPPER(name) --소문자 , 대문자
FROM student;

SELECT LENGTH('abcdefg'), LENGTHB('abcdefg'),
    LENGTH('점심'), LENGTHB('점심')
FROM dual; -- 임시로 사용하는 테이블

SELECT *
FROM emp 
WHERE LENGTH(ename) >= 5 ; --ename이(네임) 5글자 이상인 사람들

SELECT '아침' || '점심' , CONCAT('아침', '점심')
FROM dual;

SELECT '아침' || '점심' ||'저녁' ,
        CONCAT( CONCAT ('아침', '점심'), '저녁') --CONCAT 3개 변수 넣는법
FROM dual;

--SUBSTR(대상, 시작지점, 자리수)
SELECT 
    SUBSTR('abcdefg', 1, 3), --b에서 3자리수를 자르겠다.
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -5, 2) -- -는 뒷자리부터 시작한다.
FROM dual;

SELECT name, SUBSTR(jumin, 3, 4) Birthday,
        SUBSTR(jumin, 3, 4) - 1 "Birthday - 1" --띄워 쓰기 하려면 큰 따옴표!! ""
FROM student
where deptno1 = 101;

--INSTR(대상, 찾는, 시작, 몇번째[1])
SELECT
    INSTR('2024/11/04 10/45/45', '/',  1), --1번째 자리부터 /찾기
    INSTR('2024/11/04 10/45/45', '/',  6), --6번째 자리부터 /찾기
    INSTR('2024/11/04 10/45/45', '/',  1, 4), --1번째 자리부터 /의 4번째 찾기
    INSTR('2024/11/04 10/45/45', '/',  6, 2), --6번째 자리부터 /의 2번째 찾기
    INSTR('2024/11/04 10/45/45', '/',  1, 5),
    INSTR('2024/11/04 10/45/45', '/',  16, 2)
FROM dual;

SELECT name, tel, INSTR(tel, ')') --TEL 컬럼에서 )가 몇번째인지 나오게하는 쿼리
FROM student
WHERE deptno1 =201;

-------------------
SELECT 
    ROUND(1.66, 1), --1.7
    TRUNC(1.4567, 2), --1.45
    TRUNC(1.4567, 0), -- 1
    TRUNC(123.4567, -1), -- 120
    MOD(15,4), --3 나머지구하는 함수
    CEIL(123.133), --124
    FLOOR(123.1333), --123
    POWER(3,5) --243
FROM dual;

SELECT 
    ROWNUM, --행 번호
    CEIL(ROWNUM/3), --3명을 한팀으로 하겠다.
    CEIL(ROWNUM/4), --4명을 한팀으로 하겠다.
    EMPNO,
    ENAME
FROM emp;
--WHERE deptno = 30;

SELECT 
    null,
    SYSDATE, --현재날짜시간
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'), --앞에날짜 - 뒤에날짜(월로환산)
    MONTHS_BETWEEN('2024-03-05', '2024-01-05'),
    ADD_MONTHS(SYSDATE, 3), --11/4 -> 3개월 수
    LAST_DAY(SYSDATE), --28, 31, 30일 월마다 다르기때문에 존재
    NEXT_DAY(SYSDATE, '수'), --현재날짜 기준으로 다음 수요일이 언제인지 알려준다.
    NEXT_DAY(SYSDATE, '토')
FROM dual;


SELECT 
    ROUND(SYSDATE), -- 24/11/04 15:48:SS 12:00 넘으니까 반올림.
    TRUNC(SYSDATE),
    TRUNC(123.113, 1),
    TRUNC(SYSDATE, 'MM'), --YEAR MONTH DAY --월 기준으로 뒤에 다 버림.
    TRUNC(SYSDATE, 'YY'), --년 기준으로 뒤에 다 버려버림.
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE - 3,
    SYSDATE + 7,
    --다음달의 첫날
    TRUNC(ADD_MONTHS(SYSDATE,1), 'MM'), --한달 더하고 월 기준으로 다 버리는 방법
    LAST_DAY(SYSDATE)+1, --마지막 날의 다음날이 다음달의 첫날
    TRUNC(SYSDATE, 'MM') -1,
    LAST_DAY(ADD_MONTHS(SYSDATE, -1))
FROM dual;




-------------
SELECT 2+ '2' --자동형변환
FROM dual;

SELECT 2 || '123a' 
FROM dual;

SELECT 
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(502.23),
    SYSDATE,
    TO_CHAR(SYSDATE), --날짜 -> 문자
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT
    TO_CHAR(1234, '999999'),
    TO_CHAR(1234, '099999'),
    TO_CHAR(1234, '$99999'),
    '$' ||1234,
    TO_CHAR(1234, '99999.99'),
    TO_CHAR(1234, '99.999')
FROM dual;

--문자 -> 날짜 TO_DATE
SELECT 
    TO_DATE('2024-06-02') + 3, 
    TO_DATE('2024/06/02') + 3, 
    TO_DATE('24/06/02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02') + 3,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024,01,05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YY')
FROM dual;

--NVL

SELECT 
    sal,
    comm,
    sal*12+comm, -- 숫자*12 + null null포함되면 연산 안됨.
    sal*12+ NVL(comm, 0)
FROM emp;

SELECT
    NVL(NULL, 10),
    NVL2(123, '있다' , '없다'),
    NVL2(NULL, '있다' , '널이다')
FROM dual;

--DECODE

SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 20, '같다'), --NULL 생략가능
    DECODE(10, 20, '같다', NULL),
    DECODE(50, 30, '30이다', 40, '40이다', 50, '50이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60,'60이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60,'60이다', NULL),
    DECODE(40, 30, '30이다', 40, '40이다', 50, '50이다', 60,'60이다')--NULL 생략
FROM dual;


SELECT deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', '다른학과'),
    DECODE(deptno, 101, '컴퓨터공학', 'ETC'),
    DECODE(deptno, 101, '컴퓨터공학')
FROM professor;

SELECT DEPTNO, NAME, 
    DECODE(DEPTNO, 101, 'Computer Engineering', 102, 'Multimedia', 103, 'Software', 'ETC') DNAME
FROM professor;
--조건? 참:거짓 조건? 참:거짓 조건? 참:(조건? 참:거짓)


--CASE

--grade 학년
-- 1 1학년 2 2학년 3 3학년 4 4학년

SELECT grade || '학년'
FROM STUDENT;

-- 1 저학년 2 저학년 3 고학년 4 고학년

SELECT 
        grade,
        DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년') 학생구분,
        CASE grade
            WHEN 1 THEN '저학년'
            WHEN 2 THEN '저학년'
            WHEN 3 THEN '고학년'
            WHEN 4 THEN '고학년'
        END "학년구분",
        
        CASE
            WHEN grade in (1,2) THEN '저학년'
            WHEN grade BETWEEN 3 AND 4 THEN '고학년'
        END 학년구분
        
FROM STUDENT;


