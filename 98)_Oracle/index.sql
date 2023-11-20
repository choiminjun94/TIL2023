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
