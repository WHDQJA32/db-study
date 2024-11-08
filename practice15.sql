1.
student, department 테이블 활용
학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.

--1) JOIN

SELECT D.DNAME, S.HEIGHT MAX_HEIGHT, S.NAME, S.HEIGHT
FROM STUDENT S, DEPARTMENT D
WHERE (S.DEPTNO1, S.HEIGHT) IN (SELECT DEPTNO1, MAX(HEIGHT)
                            FROM STUDENT
                            GROUP BY DEPTNO1)
AND S.DEPTNO1 = D.DEPTNO                            
;

--2)서브쿼리

SELECT (SELECT DNAME
        FROM DEPARTMENT
        WHERE DEPTNO = DEPTNO1) DNMAE,
        HEIGHT MAX_HEIGHT, NAME, HEIGHT
FROM STUDENT
WHERE (DEPTNO1, HEIGHT) IN (SELECT DEPTNO1, MAX(HEIGHT)
                            FROM STUDENT
                            GROUP BY DEPTNO1);

--3)인라인뷰
SELECT D.DNAME, T.MAX_HEIGHT, S.NAME, S.HEIGHT
FROM(SELECT DEPTNO1, MAX(HEIGHT)MAX_HEIGHT
        FROM STUDENT
        GROUP BY DEPTNO1) T, STUDENT S, DEPARTMENT D
WHERE T.DEPTNO1 = S.DEPTNO1
AND T.MAX_HEIGHT = S.HEIGHT
AND S.DEPTNO1 = D.DEPTNO
;


2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
;(학년 컬럼으로 오름차순 정렬해서 출력하세요)


SELECT S.GRADE, S.NAME, S.HEIGHT, T.AVG_HEIGHT
FROM
    (SELECT GRADE, AVG(HEIGHT)AVG_HEIGHT
    FROM STUDENT
    GROUP BY GRADE) T, STUDENT S
WHERE T.GRADE = S.GRADE
AND T.AVG_HEIGHT < S.HEIGHT
ORDER BY S.GRADE;




SELECT  S.GRADE,
        S.NAME, 
        S.HEIGHT,   --내가 속한 학년의 평균 키
        (SELECT AVG(T.HEIGHT)
            FROM STUDENT T
            WHERE T.GRADE = S.GRADE)AVG_HEIGHT        
FROM STUDENT S
WHERE S.HEIGHT > (SELECT AVG(T.HEIGHT)--내 학년 평균 키
                    FROM STUDENT T
                    WHERE T.GRADE = S.GRADE
                    )
ORDER BY GRADE;





-------------------------------------------------


SELECT GRADE, NAME, HEIGHT
FROM STUDENT
WHERE (GRADE, HEIGHT) IN (SELECT GRADE, AVG(HEIGHT)
                            FROM STUDENT
                            GROUP BY GRADE)
ORDER BY GRADE;


SELECT *
FROM STUDENT
WHERE HEIGHT > (SELECT AVG(HEIGHT)
                    FROM STUDENT
                    GROUP BY GRADE;
                    
SELECT GRADE, AVG(HEIGHT)
FROM STUDENT
GROUP BY GRADE;