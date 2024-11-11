--dml

--데이터 저장 INSERT
--데이터 수정 UPDATE
--데이터 삭제 DELETE
--데이터 병합 MERGE

INSERT INTO 테이블명 (컬럼명)
VALUES (데이터 값);

INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table (name, birth, no) --위 아래 순서가 맞으면된다.
VALUES ('이름2', SYSDATE, 2);

INSERT INTO new_table (name, birth, no)
VALUES ('이름3', '2022-02-15', 3);

INSERT INTO new_table (name, birth, no)
VALUES ('이름4', TO_DATE('2001-10-25'), 4);

--컬럼명 생략
--전체 컬럼에 저장하는 경우 + 순서까지 맞추면 생략가능.
INSERT INTO new_table
VALUES (5, '이름5', SYSDATE);

INSERT INTO new_table (no, name)
VALUES (6, '이름6');

INSERT INTO new_table
VALUES (7, '이름7', null);    

---

INSERT INTO tt02 (no)
VALUES (1);

INSERT INTO tt02 (no, name, hiredate)
VALUES (2, null, null);

--UPDATE 수정 (데이터 변경하기)

UPDATE 테이블명
SET 컬럼명 = 값
WHERE 조건;

--임시부서 여부를 체크 컬럼명 temp_code 'Y'임시부터, 'N'정식부서

SELECT * FROM DEPT4;

UPDATE DEPT4
SET temp_code = 'N';

UPDATE DEPT4
SET temp_code = 'Y'
WHERE DCODE = 2000; --DCODE 2000인 데이터를 TEMP_CODE 값 Y로 변경

SELECT *
FROM DEPT4
WHERE TEMP_CODE = 'Y';

CREATE TABLE professor2
AS
SELECT * FROM professor;

SELECT *
FROM PROFESSOR2
WHERE POSITION = 'assistant professor';

UPDATE PROFESSOR2
--SET BONUS = 200 --200으로 저장
SET BONUS = BONUS + 200 --200을 증가
WHERE POSITION = 'assistant professor'; --포지션 ''인 사람만 보너스를 200으로 바꿔라.

SELECT *
FROM PROFESSOR2;


--샤론스톤 교수랑 같은 직급을 가지고있는 사람들 중 페이가 250이상인 사람들을 15% 급여인상
UPDATE PROFESSOR2
SET PAY = PAY * 1.15
WHERE POSITION = (SELECT POSITION 
                    FROM PROFESSOR2
                    WHERE NAME = 'Sharon Stone')
AND PAY > 250                    
;


COMMIT;
ROLLBACK;

SELECT *
FROM DEPT4
WHERE DCODE = 2000;

UPDATE DEPT4
SET LOCATION = 'Asan'
WHERE DCODE = 2000;

INSERT INto DEPT4
VALUES (2001, 'Asan Office', 'Asan', 'Y');

--데이터 삭제 DELETE (ROLLBACK 가능/ 자동 COMMIT X)

SELECT *
FROM DEPT4;

--지우려고 했던 데이터가 맞나 확인하고 지운다.
SELECT *
--DELETE
FROM DEPT4
WHERE TEMP_CODE = 'Y';

