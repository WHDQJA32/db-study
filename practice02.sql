SELECT *
FROM student
;

SELECT BIRTHDAY
FROM student
;

SELECT NAME 이름,
    SUBSTR(BIRTHDAY, 1, 2) 년도, 
    SUBSTR(BIRTHDAY, 4, 2) 월,
    SUBSTR(BIRTHDAY, 7, 2) 일
FROM student
;

SELECT NAME, tel, INSTR(TEL, ')')괄호위치
FROM student
where deptno1 = 201
;

SELECT NAME, tel, INSTR(TEL, '3')괄호위치
FROM student
where deptno1 = 101
;

SELECT NAME, tel, SUBSTR(TEL, 1, INSTR(TEL, ')', 1, 1)-1)지역번호
FROM student
where deptno1 = 201
;