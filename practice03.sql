SELECT 
    REPLACE('abcde', 'c', '*'), -- C를 별표로 바꾸겠다.
    REPLACE('2024-11-04', '-', '/') -- -를 /로 바꾸겠다.
FROM dual;

SELECT *
FROM emp;

SELECT 
    ename, 
    REPLACE(ename, SUBSTR(ename, 3, 2), '--') REPLACE
FROM emp
WHERE DEPTNO = 20;

SELECT *
FROM student;

SELECT 
    name,
    REPLACE(jumin, SUBSTR(jumin, 7, 7), '-/-/-/-') 주민뒷자리숨김
    --SUBSTR(jumin, 1, 6) || '-/-/-/-' 주민뒷자리숨김 또 하나의 방법
FROM student
WHERE deptno1 = 101;

SELECT 
    name, tel,
    REPLACE(tel, SUBSTR(tel, 5, 3), '***') REPLACE
FROM student
WHERE deptno1 = 102;

++Option
응용) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
       3자리 -> ***
       4자리 -> ****
       
SELECT 
    name, 
    tel,
    INSTR(tel, ')') 괄호위치 ,
    INSTR(tel, '-') 빼기위치 ,
    INSTR(tel, '-') - INSTR(tel, ')') - 1 가운데자리수갯수,
    SUBSTR(tel, INSTR(tel, ')')+1 , (INSTR(tel, '-') - INSTR(tel, ')') - 1 ) ) 가운데자리
    ,
    SUBSTR(tel, 1, INSTR(tel, ')')) 
    || LPAD('*',(INSTR(tel, '-') - INSTR(tel, ')') - 1) , '*') 
    || SUBSTR(tel, -5, 5) 응용
FROM student;

SELECT LPAD('*', 가운데자리수갯수, '*')
FROM dual;

SELECT 
    name, tel,
    REPLACE(tel, SUBSTR(tel, 9, 4), '****') REPLACE
    --SUBSTR(tel, 1, 8) || '****' REPLACE
FROM student
WHERE deptno1 = 101;

