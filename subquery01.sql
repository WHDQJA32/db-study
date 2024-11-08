--subquery

SELECT *
FROM EMP;

--사번이 7844인 사원과 같은 부서 사람들 조회

SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE EMPNO = 7844);


SELECT DEPTNO
FROM EMP
WHERE EMPNO = 7844;



SELECT * FROM EMP2;

SELECT * FROM DEPT2;

SELECT *
FROM DEPT2 
WHERE AREA = 'Pohang Main Office';

SELECT *
FROM EMP2
WHERE DEPTNO IN (SELECT DCODE
                FROM DEPT2  
                WHERE AREA = 'Pohang Main Office');


SELECT *
FROM EMP2
WHERE DEPTNO = &DNO; --입력을 받아서 처리하겠다.

SELECT *
FROM EMP2
WHERE DEPTNO = :DNO; --입력을 받은 값이 남아있다.

SELECT *
FROM EMP2
WHERE DEPTNO IN (SELECT DCODE
                FROM DEPT2  
                WHERE AREA = 'Pohang Main Office');
                
SELECT *
FROM DEPT2 
WHERE AREA = 'Pohang Main Office' 
AND DCODE = 1003;

SELECT *
FROM EMP2
WHERE EXISTS (SELECT DCODE
                FROM DEPT2  
                WHERE AREA = 'Pohang Main Office'
                AND DCODE = DEPTNO);

SELECT E1.NAME, E1.POSITION, E1.PAY
FROM EMP2 E1
WHERE E1.PAY >= (SELECT AVG(E2.PAY)
             FROM EMP2 E2
                WHERE E2.POSITION = E1.POSITION);
                
SELECT *
FROM EMP2;

SELECT *
FROM DEPT2;

--JOIN
SELECT E.NAME, D.DNAME
FROM EMP2 E,  DEPT2 D
WHERE E.DEPTNO = D.DCODE;


--SUBQUERY
SELECT DNAME
FROM DEPT2
WHERE DCODE = 1006;

SELECT NAME, (SELECT DNAME --한개의 컬럼
                FROM DEPT2 
                WHERE DCODE = DEPTNO) DNAME --다중행결과 불가
FROM EMP2;

                --PAY 컬럼들의 평균값
SELECT MIN(ABC) --페이지에 관련된 부분을 또 뽑을수 있다.
FROM (SELECT DEPTNO, AVG(PAY) ABC --컬럼명 AVG(PAY)
        FROM EMP2
        GROUP BY DEPTNO);
        
        
SELECT 1+2+3 RESULT FROM DUAL;

EMP테이블과 DEPT테이블을 조회하여 부서번호와 부서별 최대급여 및 부서명을 출력하세요

--GROUP BY 집계 -> JOIN
SELECT E.DEPTNO, E.MAX_SAL, D.DNAME
FROM(SELECT DEPTNO, MAX(SAL) MAX_SAL
        FROM EMP
        GROUP BY DEPTNO)E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--JOIN -> GROUP BY
SELECT DEPTNO, MAX(SAL), DNAME 
FROM(SELECT E.SAL, E.DEPTNO, D.DNAME 
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO)
GROUP BY DEPTNO, DNAME;