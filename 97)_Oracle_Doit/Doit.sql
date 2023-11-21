select * from all_users;

-- emp 테이블이 없어서 생성 
CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) 
 );
 
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('1981-11-17','YYYY-MM-DD'),5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1981-05-01','YYYY-MM-DD'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('1981-05-09','YYYY-MM-DD'),2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-04-01','YYYY-MM-DD'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-09-10','YYYY-MM-DD'),1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-02-11','YYYY-MM-DD'),1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('1981-08-21','YYYY-MM-DD'),1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('1981-12-11','YYYY-MM-DD'),950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-02-23','YYYY-MM-DD'),1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('1981-12-11','YYYY-MM-DD'),3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-09','YYYY-MM-DD'),800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('1982-12-22','YYYY-MM-DD'),3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('1983-01-15','YYYY-MM-DD'),1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('1982-01-11','YYYY-MM-DD'),1300,NULL,10);

COMMIT;

-- Day.1 (DO it)
-- 데이터 출력
-- 테이블 전체 열 출력 
SELECT * FROM emp;

-- 테이블 부분열만 출력 (사원번호, 이름, 부서)
SELECT empno, ename, job FROM emp;

-- 복습 (사원번호 부서번호 출력)
SELECT empno, deptno FROM emp; 

-- 열 제거
-- 중복 열 제거 (DISTINCT)
SELECT  DISTINCT deptno FROM emp; 

-- 여러 중복열 제거
SELECT DISTINCT job, deptno FROM emp;

-- 별칭 지정
-- 별칭 (열과 연산식 )
SELECT ename, sal, sal*12+Comm,comm FROM emp;

-- 별칭 지정2 (as)
SELECT ename AS 이름, sal AS 월급, sal*12+comm AS 연간총수입, comm FROM emp; 

-- 원하는 순서로 출력 데이터를 정렬 (order by)
-- 오름차순
SELECT * FROM emp ORDER BY sal;

-- 복습 (사원번호 오름차순)
 SELECT * FROM emp ORDER BY empno;
 
-- 급여 내림차순 (desc)
SELECT * FROM emp ORDER BY sal DESC; 

-- 오름차순과 내림차순 동시에 사용
SELECT * 
	FROM emp 
ORDER BY DEPTNO, sal DESC;

-- 과제 (잡 중복 제거하기)
SELECT DISTINCT  job AS 직업 FROM emp; 

SELECT empno AS "EMPLOYEE_NO", ename AS "EMPLOYEE_NAME", job, MGR  AS "MANAGER", hiredate ,sal AS "SALARY", comm AS "COMMISSION", deptno AS "DEPARTMENT_NO" 

	FROM emp ORDER BY EMPNO DESC, ENAME ;

-- ========================================================================= -- 
-- Day.2 (DO it)
-- where문 select문으로 데이터를 조회할때 특정 조건을 기준으로 원하는 행을 출력

-- 부서번호 30인 데이터 출력 
SELECT * FROM emp WHERE DEPTNO = 30; s
-- 사원번호 7782인 사원번호만
SELECT * FROM emp WHERE empno = 7782;

-- 여러개 조건식을 사용하는 연산자(AND, OR) 
-- AND 연산자로 여러개의 조건식을 사용
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
-- 사원번호가 7499이고 부서번호가 30인 것
SELECT * FROM emp WHERE empno = 7499 AND DEPTNO =30;

-- OR연산자로 여러개를 출력 조건 사용
SELECT * FROM emp WHERE DEPTNO = 30 OR job = 'salesman';
-- 부서번호가 20 이거나 직업이 salesman인 사원정보만 나오게 
SELECT * FROM emp WHERE DEPTNO =20 OR job='salesman';

-- 연산자 종류와 활용 방법

-- 산술연산자 (+,-,*,/)
SELECT * FROM emp WHERE sal * 12 = 36000;

-- 비교연산자 
SELECT * FROM emp WHERE sal >= 3000;
-- 급여가 2500이상이고 직업이 ANALYST인 사원정보만
SELECT * FROM emp WHERE sal >= 2500 AND job='ANALYST'; 
-- 비교 문자열이 문자 하나일 
-- 알파벳 순서상 F와 같거나 F보다 뒤에 있는 문자열
SELECT * FROM emp WHERE ename >= 'F';

--등가 비교 연산자
-- ( != )
SELECT * FROM emp WHERE sal != 3000;

-- ( <> )
SELECT * FROM emp WHERE sal <> 3000;

-- ( ^= )
SELECT * FROM emp WHERE sal ^= 3000;

-- 부정연산자
SELECT * FROM emp WHERE NOT sal = 3000;

-- in 연산자
-- 특정열에 해당하는 조건을 여러개 지정 
SELECT * FROM emp WHERE job IN ('MANAGER', 'SALESMAN', 'CLERK');

-- IN연산자와 논리부정연사자를 사용하여 출력 
SELECT * FROM emp WHERE job NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- IN연산자를 사용 부서번호 10,20인 사원정보만 나오도록
SELECT * FROM emp WHERE DEPTNO IN (10,20);

-- Between a and B 연산자
-- 특정 열 값의 최소, 최고범위를 지정
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- Between a and b연산자와 NOT 연산자를 사용하여 출력 
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- Like연산자와 와일드카드

-- Like연산자는 일부 문자열이 포함된 데이터를 조회할때 사용
-- ename 열 값이 대문자 S로 시작하는 데이터를 조회
SELECT * FROM emp WHERE ENAME LIKE 'S%';

-- 와일드 카드 
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미 
SELECT * FROM emp WHERE ename LIKE '_L%';
-- % : 길이와 상관없이 (문자 없이 경우도 포함) 모든 문자 데이터를 의미
SELECT * FROM emp WHERE ename LIKE '%AM%';
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

-- IS NULL : NULL인 데이터를 출력 
-- IS NULL과 IS NOT NULL은 잘쓰인다고 함 
SELECT * FROM emp WHERE comm IS NULL;

-- 직속상관이 있는 사원만 출력 
SELECT * FROM emp WHERE MGR IS NOT NULL;

-- OR 연산자와 IS NULL연산자 사
SELECT * FROM emp WHERE sal > NULL OR comm IS NULL;

-- 집합 연산자 (union)
-- 두개의 select문 사이에 사용되는 연산자
-- 합집합을 의미 
-- 중복은 제외
-- 주의 : 출력하려는 열갯수와 각 열의 자료형이 순서별로 일치 해야한다.

SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10 
UNION 
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- 집합 연산자 (union all)
-- 중복 데이터도 모두 출력
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10 
UNION all
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 집합 연산자 (minus)
-- 차집합
SELECT empno, ename, sal, deptno FROM emp
minus
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;


-- 집합 연산자 (intersect)
-- 교집합
-- 두 select문의 결과값이 같은 데이터만 출력
SELECT empno, ename, sal, deptno FROM emp
intersect
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;



-- 과제 
-- EMP테이블을 사용하여 다음과 같이 사원 이름이 S로 끝나는 사원 데이블를 모두 출력
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno 
	FROM emp 
WHERE ename LIKE '%S';

-- EMP 데이블을 사용하여 30번 부서에서 근무하고 있는 사원 중에 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서 번호를 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
	FROM emp 
WHERE deptno ='30' 
AND job ='SALESMAN';

-- EMP데이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두가지 방식의 select문을 사용하여 사원번호, 이름, 급여, 부서번호를 출력 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
	FROM emp 
WHERE deptno IN (20,30) 
AND SAL >= 2000;

-- EMP데이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두가지 방식의 select문을 사용하여 사원번호, 이름, 급여, 부서번호를 출력 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
	FROM emp 
WHERE deptno = 20 
	AND 
SAL > 2000
UNION 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM emp WHERE deptno = 30 AND SAL > 2000;

-- NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여열 값이 2000 이상 3000이하 범위 이외의 값을 가진 데이터만 출
SELECT * FROM emp WHERE sal > 2000 OR sal < 3000;

-- 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원 이름, 사원 번호, 급여 부서번호를 출력 
SELECT ENAME, EMPNO, SAL, DEPTNO 
	FROM EMP 
WHERE DEPTNO = 30 
AND ENAME LIKE '%E%' 
AND SAL NOT BETWEEN 1000 AND 2000;

-- ========================================================================= -- 




