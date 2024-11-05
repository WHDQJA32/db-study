SELECT 
    STUDNO 번호,
    NAME 이름,
    ID 아이디
FROM student
WHERE HEIGHT between 160 and 175
UNION ALL
SELECT 
    PROFNO,
    NAME,
    ID
FROM professor
WHERE DEPTNO IN (101, 102, 103, 201) AND
    BONUS is null;
    
SELECT 
    '이름:'||NAME 이름,
    '아이디:'||ID 아이디,
    '주민번호:'||SUBSTR(JUMIN, 1, 6)||'-'||SUBSTR(JUMIN, 7, 14)주민번호
FROM student;
    
    