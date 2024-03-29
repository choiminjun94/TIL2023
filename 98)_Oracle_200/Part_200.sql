-- Day.1 (200제)

-- 001) 사원번호 및 이름, 월급만 
SELECT empno, ename,sal FROM emp; 

-- 002) 테이블에서 모든 열 출력
SELECT * FROM emp;

-- 003) 컬럼 별칭을 사용하여 출력되는 컬럼명 변경
SELECT empno AS "사원번호", ename AS "이름", sal FROM emp;

-- 004) 사원테이블의 이름과 월급을 붙여서 출력 (몰랐음)
SELECT ename || sal FROM emp;

SELECT ename || '의 월급은 ' || sal ||' 입니다.' AS  월급정보  FROM emp;

-- 005)사원 직업에서 중복된 데이터 제거 (DISTINCT)
SELECT DISTINCT job FROM emp; 

-- 006) 이름과 월급을 출력하는데 월급이 낮은 사원별로 출력 (asc)
SELECT ename, sal FROM emp ORDER BY sal ASC;

-- 006.1) 이름과 부서번호는 내림차순 월급은 올림차순으로 출력
SELECT ename AS "이름", DEPTNO  AS "부서번호", sal AS "월급" 
	FROM emp 
ORDER BY DEPTNO asc , sal desc; 

-- Day.2 (200제)

-- Where
-- 007) 월급이 3000인 사원들의 이름과 월급 직업을 출력
SELECT ename, sal, job
FROM emp
WHERE sal = 3000;

-- 007.1) 월급이 3000이상인 사원들의 이름과 월급을 출력
SELECT ename AS 이름, sal AS 월급
FROM emp
WHERE sal >= 3000;

-- 008) 사원이름이 SCOTT의 이름,월급,직업,입사일,부서번호
SELECT ename,sal,hiredate,deptno
FROM emp
WHERE ename = 'SCOTT';

-- 008.1) 입사일이 81년 11월 17일에 입사한 사원 이름과 입사일 출력
SELECT ename, hiredate
FROM emp 
WHERE HIREDATE ='81/11/17';

-- 산술 연산자 
-- 009) 연봉이 36000 이상인 이름과 연봉 
SELECT ename AS 이름, sal*12 AS 연봉 
FROM emp
WHERE sal*12 > 36000;

-- 009.1) 부서번호가 10번인 사원들 의 이름, 월급, 커미션, 월급+커미션을 출력
SELECT ename, sal, comm, sal+comm
FROM emp
WHERE DEPTNO = 10;

-- 비교연산자 
-- 010) 월급이 1200이하인 사원들의 이름과 월급 직업 부서번호를 출력 
SELECT ename, sal, job, deptno
FROM emp
WHERE sal <= 1200;

-- 011) 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 011.1)  11과 다른 표현으로
SELECT  ename, sal
FROM emp
WHERE (sal >= 1000 AND sal <= 3000);

-- 011.2)월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력
SELECT ename, sal
FROM emp
WHERE sal NOT BETWEEN 1000 AND 3000;

-- 012)첫 글자가 S로 시작하는 사원들의 이름과 월급 출력(LIKE)
SELECT ename, sal 
FROM emp
WHERE ename LIKE 'S%';

-- 012.1) 이름의 두번째 철자가 M인 사원의 이름을 출력
SELECT ename 
FROM emp 
WHERE ename LIKE '_M%';

-- 012.2) 이름에 A가 들어가는 사람 
SELECT ename 
FROM emp
WHERE ename LIKE '%A%';

-- 013) 커미션이 NULL인 사원들의 이름과 커미션 출력
SELECT ename, comm 
FROM emp
WHERE comm IS NULL;

-- 014) 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업을 출력 (IN)
SELECT ename, sal, job
FROM emp
WHERE job in('saleman','ANALYST','MANAGER');

-- 014.1) 직업이 SALESMAN, ANALYST, MANAGER이 아닌 사원들의 이름, 월급, 직업을 출력
SELECT ename, sal, job 
FROM emp 
WHERE job NOT IN ('saleman','ANALYST','MANAGER');

-- 015) 직업이 salesman이고 월급이 1200 이상인 사원들의 이름,월급,직업 출력
SELECT ename, sal, job
FROM emp
WHERE job='SALESMAN' AND sal > 1200;

-- Day.3 (200제)
 -- 016) 대소문자 변환 함수 (Upper, Lower, INITCAP)
 SELECT upper(ename), lower(ename), INITCAP(ename) FROM emp;

 -- 016.1) scott인 사원의 이름 및 월급 조회
 SELECT ename, sal 
 FROM emp 
 WHERE LOWER(ename) = 'scott'; 
 
 -- 017) 문자에서 특정 철자 추출하기 (SUBSTR)
 -- SMITH에서 SMI만 잘라서 추출
SELECT substr('SMITH', 1,3) FROM dual; 

-- 018) 문자열의 길이를 출력 (LENGTH)
-- 이름을 출력하고 그 옆에 이름의 철자 갯수를 출력
SELECT ename, LENGTH(ename) FROM emp;

-- 바이트의 길이 반환
SELECT LENGTHB('가나다라마') FROM dual; 

-- 019) 문자에서 특정 철자의 위치 출력(INSTR)
SELECT INSTR('SMITH', 'M') FROM dual;

SELECT instr('abcdefg@naver.com', '@') FROM dual;

-- 020) 특정철자를 다른 철자로 변경 (REPLACE)
SELECT ename, REPLACE (sal, 0, '*') FROM emp;
-- 정규식 변경 (REGEXP_REPLACE)
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') AS salary FROM emp; 

-- 021) 특정 철자를 N개 만큼 채우기
SELECT ename, lpad(sal, 10, '*') AS salary1, rpad(sal, 10, '#') AS salary2 FROM emp;

-- 022) 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)
 SELECT 'smith', ltrim('simth', 's'), RTRIM('smith','h'), TRIM('s' FROM 'smiths') FROM dual; 

-- 022.1) 데이터가 안나올시 공백 때문일수도,...
SELECT ename, sal FROM emp WHERE ename = 'JACK';
SELECT ename, sal FROM emp WHERE RTRIM(ename) = 'JACK'; 

-- 023) 반올림해서 출력 (ROUND)
SELECT '876.543' AS 숫자, round(876.567,1 ) FROM dual;

-- 024) 숫자를 버리고 출력(TRUNC) 
SELECT '876.422' AS 숫자, trunc(853.432,1) FROM dual;