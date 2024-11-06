/*emp2 테이블을 기준으로 아래 정보를 출력
사원들 중에 70년대 생이면서 지역번호를 기준으로 서울(02), 경기도(031)에 거주하는
사원들의 정보를 아래와 같이 출력하시오.
사번, 이름, 생년월일, 취미, 급여(pay), 성과급(급여의 150%)
, 직원분류(단, 가족과 같은 직원이라서 family로 표기)
,전화번호, 급여수준
(단, 급여수준은 아래와 같이 분류)
3500만 1원 ~ 4500만 : '하'
4500만 1원 ~ 6천만 : '중"
6000만 1원 이상 : '상'
그 외... : '화이팅'
*/

select *
from emp2;

select 
    empno 사번,
    name 이름,
    birthday 생년월일,
    hobby 취미,
    pay 급여,
    PAY * 1.5 성과급,
    REPLACE(emp_type, 'employee', 'family') "직원 분류", -- 리플레이스 써서 이름바꾸기
    --SUBSTR(emp_type, 1, INSTR(emp_type, ' '))||'family' 직원분류, --띄워쓰기 이후로 지운다음 '패밀리'적기
    tel TEL,
    CASE 
        WHEN PAY BETWEEN 35000001 AND 45000000 THEN '하'
        WHEN PAY BETWEEN 45000001 AND 60000000 THEN '중'
        WHEN PAY > 60000001 THEN '상'
        ELSE '화이팅'
    END 급여수준
from emp2
WHERE TO_CHAR(birthday, 'yy') BETWEEN 70 AND 79 AND
     SUBSTR(TEL, 1, INSTR(TEL,')')-1) IN (02, 031);
