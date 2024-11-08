1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
교수번호화 이름, 학과명을 출력하세요
(입사일 순으로 오름차순 정렬)

SELECT DEPTNO, MIN(HIREDATE)
FROM PROFESSOR
GROUP BY DEPTNO;

SELECT P.PROFNO, P.NAME, D.DNAME, P.HIREDATE
FROM PROFESSOR P, DEPARTMENT D
WHERE (P.DEPTNO, D.HIREDATE) IN (SELECT DEPTNO, MIN(HIREDATE)
                                FROM PROFESSOR
                                GROUP BY DEPTNO)
        AND P.DEPTNO = D.DEPTNO                                
ORDER BY P.HIREDATE
;

2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
(연봉순으로 오름차순 정렬);


SELECT NAME, POSITION,
TO_CHAR(PAY, '$999,999,999') PAY
FROM EMP2
WHERE (POSITION, PAY) IN (SELECT POSITION, MAX(PAY)
                            FROM EMP2
                            GROUP BY POSITION)
ORDER BY PAY
;
