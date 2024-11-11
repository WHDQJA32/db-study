'AL Pacino'와 "같은 지역"에서
근무하는 직원들의 평균 연봉보다
많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.

SELECT *
FROM EMP2;

SELECT AREA
FROM DEPT2
WHERE DCODE = (SELECT DEPTNO
                FROM EMP2
                WHERE NAME ='AL Pacino');

SELECT DEPTNO
FROM EMP2
WHERE NAME ='AL Pacino';

SELECT DCODE
FROM DEPT2
WHERE AREA = (SELECT AREA
                FROM DEPT2  
                WHERE DCODE = (SELECT DEPTNO
                                  FROM EMP2
                                    WHERE NAME ='AL Pacino'));
        
SELECT *
FROM EMP2
WHERE DEPTNO IN (SELECT DCODE
                FROM DEPT2
                WHERE DCODE = (SELECT AREA
                                 FROM DEPT2  
                                 WHERE DCODE = (SELECT DEPTNO
                                                    FROM EMP2
                                                    WHERE NAME ='AL Pacino')));
                                                    
SELECT E.EMPNO, E.NAME, E.DEPTNO, 
D.DNAME,
D.AREA,
E.PAY
FROM EMP2 E, DEPT2 D
WHERE PAY > (SELECT AVG(PAY)
                FROM EMP2
                WHERE DEPTNO IN (SELECT DCODE
                                    FROM DEPT2
                                    WHERE AREA = (SELECT AREA
                                                    FROM DEPT2  
                                                    WHERE DCODE = (SELECT DEPTNO
                                                                    FROM EMP2
                                                                    WHERE NAME ='AL Pacino'))))
AND E.DEPTNO = D.DCODE;
------------------------------------------

SELECT 
        E.EMPNO, 
        E.NAME,
        E.DEPTNO,
        D.DNAME,
        D.AREA,
        E.PAY
FROM EMP2 E, DEPT2 D
WHERE D.DCODE = E.DEPTNO
AND E.PAY > SELECT AVG(PAY) 
                FROM EMP2 E, DEPT2 D
                WHERE AREA = (SELECT D.AREA
                        FROM EMP2 E, DEPT2 D
                        WHERE D.DCODE = E.DEPTNO and
                        NAME = 'AL Pacino');

SELECT D.AREA
FROM EMP2 E, DEPT2 D
WHERE D.DCODE = E.DEPTNO and
NAME = 'AL Pacino';



SELECT D.AREA, AVG(PAY)
FROM EMP2 E, DEPT2 D
WHERE D.DCODE = E.DEPTNO
GROUP BY D.AREA;


