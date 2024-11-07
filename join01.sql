--join 01

select *
from emp;

select *
from dept;

--조인기준 deptno가 같은

--앞에 별칭으로 붙여주는게 좋다.
select e.empno, e.ename, d.dname, d.loc, e.deptno, d.deptno
--select *
from emp e, dept d
where e.deptno = d.deptno
;

--ANSI 타입
select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno
;

SELECT *
FROM emp e, dept d;


SELECT *
FROM student;

SELECT COUNT(*)
FROM student;

SELECT *
FROM professor;

SELECT s.name, p.name
FROM student s INNER JOIN professor p
ON s.profno = p.profno;


SELECT s.name, p.name
FROM student s INNER JOIN professor p
ON s.profno = p.profno
;

--INNER JOIN(null삭제)VS OUTER JOIN(null 포함)

SELECT s.name, p.name
FROM student s, professor p
WHERE s.profno = p.profno(+); --외부에서 들어오는쪽 (적은쪽)
--WHERE s.profno(+) = p.profno;

SELECT s.name STU_NAME, p.name PROF_NAME
FROM student s LEFT OUTER JOIN professor p  --왼쪽기준
--FROM student s RIGHT OUTER JOIN professor p --오른쪽기준
ON s.profno = p.profno;

select *
from student;

select *
from professor;

select *
from department;

SELECT s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
FROM student s, professor p, department d 
where   s.profno = p.profno and --웨얼 조건을 앤드로 해서 각각 다른 조건을 걸어준다.
        s.deptno1 = d.deptno;   --스튜던트테이블을 기준으로 각 중복된 다른 컬럼으로 엮어서!
        
SELECT s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
FROM student s 
    INNER JOIN professor p 
    ON s.profno = p.profno 
    INNER JOIN department d
    ON s.deptno1 = d.deptno
    ;

SELECT s.name STU_NAME, d.dname DEPT_NAME, p.name PROF_NAME
FROM student s, professor p, department d 
where   s.profno = p.profno and 
        p.deptno = d.deptno;       --professor 학과번호 = department 학과번호

--교수학과 이름, 학생학과이름

SELECT 
    S.NAME,
    S.DEPTNO1,
    D.DNAME,
    S.PROFNO,
    P.PROFNO,
    P.NAME,
    P.DEPTNO,
    D2.DNAME
FROM student s, professor p, department d, department d2
WHERE S.PROFNO = P.PROFNO AND
        S.DEPTNO1 = D.DEPTNO AND
        P.DEPTNO = D2.DEPTNO
        ;
        
SELECT *
FROM CUSTOMER;

SELECT *
FROM GIFT;

SELECT C.GNAME, C.POINT, G.GNAME
FROM CUSTOMER C, GIFT G
WHERE C.POINT BETWEEN G.G_START AND G.G_END; --C테이블 포인트를 G테이블 스타트 와 엔드 컬럼사이로 넣겠다.

--INNER JOIN
--INNER JOIN(null삭제)VS OUTER JOIN(null 포함)

SELECT *
FROM STUDENT S, PROFESSOR p
WHERE S.profno = P.profno;

--뒤에 붙는 테이블이나 컬럼에 (+)!!!!!!!!!!!!!
--OUTER JOIN
--INNER JOIN(null삭제)VS OUTER JOIN(null 포함)

SELECT *
FROM STUDENT S, PROFESSOR p
WHERE S.profno = P.profno(+);

SELECT *
FROM STUDENT S, PROFESSOR p
WHERE P.profno = S.profno(+);

--EMP테이블에 있는 사번, 이름, 상사의 사번, 상사의 이름 출력하기!

SELECT *
FROM EMP;

SELECT E.EMPNO 사번, E.ENAME 이름, E1.EMPNO 상사사번, E1.ENAME 상사이름
FROM EMP E, EMP E1
WHERE E.MGR = E1.EMPNO
ORDER BY 사번;

