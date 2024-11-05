select *
from dept;

select DEPTNO 부서번호, DNAME 부서이름, LOC 위치
from dept;

select *
from professor;

select NAME || '(' || ID || ')' 교수정보, 
POSITION, 
HIREDATE 입사일자, 
EMAIL 이메일
from professor;