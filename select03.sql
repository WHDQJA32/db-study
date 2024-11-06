--복수행 함수

COUNT(대상) 갯수

SELECT COUNT(*)
FROM emp;

SELECT COUNT(empno), COUNT(*)
FROM emp;

SELECT COUNT(JOB), COUNT(MGR), COUNT(HIREDATE), COUNT(COMM)--NULL는 적용안해줌.
FROM emp;

SELECT SUM(SAL), COUNT(*) --SUM 총합
FROM emp;

--10, 20번 부서 다니는 사람이 총 급여와 사원 수
SELECT COUNT(*), SUM(SAL)
FROM emp
WHERE DEPTNO IN (10, 20);

SELECT 
        AVG(HEIGHT), 
        MAX(HEIGHT), 
        MIN(HEIGHT), 
        STDDEV(HEIGHT), 
        VARIANCE(HEIGHT)
        --단일행 함수 XX
FROM student;

--STUDENT 평균 키!
--전체 평균키 X, 각 학년별 평균 키!

SELECT '1학년' , AVG(HEIGHT) 평균키
FROM student
WHERE GRADE=1
UNION ALL
SELECT '2학년' , AVG(HEIGHT)
FROM student
WHERE GRADE=2
UNION ALL
SELECT '3학년' ,AVG(HEIGHT)
FROM student
WHERE GRADE=3
UNION ALL
SELECT '4학년' ,AVG(HEIGHT)
FROM student
WHERE GRADE=4;

SELECT
FROM
WHERE
GROUP BY
ORDER BY;

--GROUP BY에 명시된 컬럼은 사용가능!!!
SELECT GRADE, AVG(HEIGHT) --GROUP BY 에 들어간 컬럼 GRADE 사용가능!
FROM STUDENT
GROUP BY GRADE; --GROUP BY 에 들어간 컬럼은 쓸수 있다!

SELECT STUDNO, AVG(HEIGHT) 
FROM STUDENT
GROUP BY STUDNO; --중복이 없어서 그룹을 지을순 없을 때, 전체 각자 출력된다.

SELECT GRADE, AVG(HEIGHT) HEIGHT
FROM STUDENT
WHERE GRADE IN(1,2,3)
GROUP BY GRADE
--ORDER BY 2 ; --컬럼 순서 숫자로 정렬가능
ORDER BY HEIGHT ; --컬럼 별칭으로 정렬 시켰다.

SELECT...
FROM...
WHERE...
GROUP BY
HAVING
ORDER BY;

SELECT deptno, AVG(SAL)
FROM emp
--WHERE AVG(SAL) >= 2000 --웨어 절에서 복수형 함수 사용못한다.
GROUP BY deptno
HAVING AVG(SAL) >= 2000 --복수형 함수 해빙써야한다.
;

1) 급여가 1500 이상인 직원들만 대상으로, 부서별 평균 급여

SELECT deptno, avg(sal)
FROM emp
where sal >= 1500
group by deptno
;

2) 부서별 평균 급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기

SELECT deptno, avg(sal)
FROM emp
group by deptno
having avg(sal) >= 1500
;

select *
from student;

select grade, avg(weight)
from student
group by grade
having avg(weight) >= 65
;

select grade, avg(weight)
from student
--where grade not in (4)
where grade <> 4
group by grade
having avg(weight) >= 65
;

SELECT deptno, job, ROUND(AVG(SAL), 1)
FROM emp
GROUP BY ROLLUP(deptno, job);

SELECT deptno, job, ROUND(AVG(SAL), 1)
FROM emp
GROUP BY deptno, job;

GROUP BY ROLLUP(deptno, job);
1) deptno, job 그룹화
2) deptno 그룹화 계
3) () 그룹화 계

GROUP BY ROLLUP( (deptno, job) );
1) deptno, job 그룹화
2) () 그룹화 계

GROUP BY ROLLUP(deptno, job, mgr);
1) deptno, job, mgr 그룹화
2) deptno ,job 계
3) deptno 계
4) ()계

GROUP BY ROLLUP(deptno, (job, mgr));
1) deptno, job, mgr 그룹화
2) deptno 계
3) ()계

SELECT deptno, job, mgr, ROUND(AVG(SAL), 1)
FROM emp
GROUP BY ROLLUP(deptno, job, mgr);

--RANK DENSE RANK

순위 RANK() OVER (ORDER BY 정렬기준)
그룹단위로 순위 RANK() OVER (PARTITION BY 기준 ORDER BY 정렬기준)
                             --GROUP BY
SELECT ename, sal, 
        rank()over (order by sal desc), --샐 기준으로 순위를 매긴다.
        DENSE_rank()over (order by sal desc)          
FROM emp;
--order by sal;

SELECT 
    name,
    height,
    RANK() OVER (order by height desc) 순위1,--공동순위 사람 숫자 만큼 차지하고 그다음 순위를 보여준다.
    DENSE_RANK() OVER (order by height desc) 순위2,
    GRADE,
    RANK() OVER (PARTITION BY GRADE order by height desc) 순위3,
    DENSE_RANK() OVER (PARTITION BY GRADE order by height desc) 순위4
FROM student
ORDER BY GRADE, HEIGHT DESC;
