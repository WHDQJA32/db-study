--EMP테이블에 있는 사번, 이름, 상사의 사번, 상사의 이름 출력하기!

SELECT *
FROM EMP;

SELECT E.EMPNO 사번, E.ENAME 이름, E1.EMPNO 상사사번, E1.ENAME 상사이름
FROM EMP E, EMP E1
WHERE E.MGR = E1.EMPNO
ORDER BY 사번;


1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 
학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

SELECT *
FROM STUDENT;

SELECT *
FROM DEPARTMENT;


SELECT S.NAME, S.DEPTNO1, D.DNAME 
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
ORDER BY S.DEPTNO1
;

2. emp2 테이블과 p_grade 테이블을 조회하여 현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과 상한 금액을 아래 결과 화면과 같이 출력하세요.

SELECT *
FROM EMP2;

SELECT *
FROM P_GRADE;

SELECT E.NAME, E.POSITION , E.PAY, P.S_PAY, P.E_PAY
FROM EMP2 E,P_GRADE P
WHERE E.POSITION IS NOT NULL AND
     E.POSITION = P.POSITION(+)
;

3. Emp2 테이블과 p_grade 테이블을 조회하여
사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.

SELECT *
FROM EMP2;

SELECT *
FROM P_GRADE;

--날짜 - 날짜 계산하는법
SELECT BIRTHDAY,  
    '2010-05-30',
    TO_CHAR(BIRTHDAY, 'YYYY'),
    SUBSTR('2010-05-30', 1, 4),
    2010-TO_CHAR(BIRTHDAY, 'YYYY')+1 한국나이,
    --DATE - DATE 
    TRUNC((TO_DATE('2010-05-30') - BIRTHDAY)/365, 0)+1
FROM EMP2
;

SELECT *
FROM EMP2;

SELECT *
FROM P_GRADE;

--정답

SELECT  E.NAME,
        2010-TO_CHAR(BIRTHDAY, 'YYYY') +1 한국나이,
        --TRUNC((TO_DATE('2010-05-30') - BIRTHDAY)/365, 0)+1 한국나이
        E.POSITION 지금포지션,
        P.POSITION 지금나이에맞는포지션
FROM EMP2 E, P_GRADE P
WHERE 2010-TO_CHAR(BIRTHDAY, 'YYYY')+1 BETWEEN P.S_AGE AND P.E_AGE
ORDER BY 2010-TO_CHAR(BIRTHDAY, 'YYYY')+1
;

4 . customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 
한가지를 선택할 수 있다고 할 때 Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.

SELECT *
FROM CUSTOMER;

SELECT *
FROM GIFT;

--정답
SELECT C.GNAME, C.POINT POINT, G.GNAME
FROM CUSTOMER C, GIFT G
WHERE 
    C.POINT > G.G_START --포인트 값이 스타트보다 크면 전체 다 불러온다.
    AND G.GNO = 7;  --그 중에서 GNO 가 7인걸 불러온다.
    --G.GNAME = 'Notebook';

--리터널 값 그냥 넣어서 완료.
SELECT C.GNAME, C.POINT POINT, 'Notebook' GNAME_1
FROM CUSTOMER C, GIFT G
WHERE   C.POINT > 600000 
        AND C.POINT BETWEEN G.G_START AND G.G_END
        --AND SUBSTR(C.JUMIN, 1, 1)
ORDER BY C.GNO;

5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요. 
단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

--RANK 사용 !!

SELECT *
FROM PROFESSOR;

SELECT 
        PROFNO, 
        NAME, 
        HIREDATE,
        RANK() OVER (ORDER BY HIREDATE)-1 COUNT
FROM PROFESSOR;

--JOIN 사용 !! 정답 !!

SELECT *
FROM PROFESSOR;

SELECT P1.PROFNO, P1.NAME, P1.HIREDATE, COUNT(P2.PROFNO)COUNT --특정 컬럼을 넣으면 NULL을 세지않는다!!!
FROM PROFESSOR P1, PROFESSOR P2
WHERE P1.HIREDATE > P2.HIREDATE(+) --비교할 값이 없어도 안사라지게 (+)
GROUP BY P1.PROFNO, P1.NAME, P1.HIREDATE
ORDER BY P1.HIREDATE
;


6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요.
단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

SELECT *
FROM EMP;

--랭크사용

SELECT 
        EMPNO,
        ENAME,
        HIREDATE,
        RANK()OVER (ORDER BY HIREDATE)-1 COUNT
FROM EMP
ORDER BY HIREDATE;

--조인사용

SELECT E1.EMPNO, E1.ENAME, E1.HIREDATE, COUNT(E2.EMPNO) COUNT
FROM EMP E1, EMP E2
WHERE E1.HIREDATE > E2.HIREDATE(+)
GROUP BY E1.EMPNO, E1.ENAME, E1.HIREDATE
ORDER BY E1.HIREDATE;
