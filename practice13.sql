
1.
emp2 테이블 활용
직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.

SELECT *
FROM EMP2;


SELECT PAY
FROM EMP2
WHERE POSITION = 'Section head';

SELECT NAME, POSITION, PAY
FROM EMP2
WHERE PAY >ANY (SELECT PAY
                FROM EMP2
                WHERE POSITION = 'Section head');


2.
Student 테이블.
전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적네 나가는 학생보다
몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력

SELECT *
FROM STUDENT;

SELECT WEIGHT
FROM STUDENT
WHERE GRADE = 2;

SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT < (SELECT MIN(WEIGHT) --51
                    FROM STUDENT
                    WHERE GRADE = 2);

SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT <ALL (SELECT WEIGHT
                    FROM STUDENT
                    WHERE GRADE = 2);
                    
 3.
emp2, dept2 활용
각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
부서명, 직원명, 연봉 출력하세요.

SELECT *
FROM EMP2;

SELECT *
FROM DEPT2;

SELECT *
FROM EMP2
WHERE PAY < ALL ( SELECT AVG(PAY)
                FROM EMP2
                GROUP BY DEPTNO);

SELECT DEPTNO, AVG(PAY)
FROM EMP2
GROUP BY DEPTNO;

SELECT *
FROM DEPT2;


--------------

SELECT *
FROM EMP2;

SELECT *
FROM DEPT2;

SELECT *
FROM EMP2;

SELECT D.DNAME ,AVG(E.PAY)
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO = D.DCODE
GROUP BY DNAME
;

SELECT D.DNAME, E.NAME, E.PAY SALARY
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO = D.DCODE
      AND E.PAY <ALL (SELECT AVG(E.PAY)
                        FROM EMP2 E, DEPT2 D
                        GROUP BY DEPTNO);
                        
---------------------------------------


SELECT *
FROM STUDENT
WHERE (GRADE, WEIGHT) IN (SELECT GRADE, MAX(WEIGHT)
                            FROM STUDENT
                            GROUP BY GRADE);
















