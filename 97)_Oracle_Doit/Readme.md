# Oracle 쿼리 정리 (DOIT)

## DAY1

```sql
기본서 공부 기록
emp 테이블이 없어서 생성 
```

```sql

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

```

 ```sql

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

 ```


## Day.1 (DO it)

### 데이터 출력  테이블 전체 열 출력 
```sql

SELECT * FROM emp;

```
![1](https://github.com/choiminjun94/TIL2023/assets/60457431/521037fa-5122-4e03-ba61-8aed60e18e96)


### 테이블 부분열만 출력 (사원번호, 이름, 부서)
```sql

SELECT empno, ename, job FROM emp;

```
![스크린샷 2023-11-21 오전 1 57 26](https://github.com/choiminjun94/TIL2023/assets/60457431/7bab642b-a511-44b3-a491-697ee56ca8da)

### 복습 (사원번호 부서번호 출력)
```sql

SELECT empno, deptno FROM emp; 

```
![스크린샷 2023-11-21 오전 1 57 07](https://github.com/choiminjun94/TIL2023/assets/60457431/7194ead0-8ad2-4c4f-9aaf-43e8b9ecbc20)


### 열 제거
### 중복 열 제거 (DISTINCT)
```sql

SELECT  DISTINCT deptno FROM emp; 

```
![스크린샷 2023-11-21 오전 1 56 59](https://github.com/choiminjun94/TIL2023/assets/60457431/dd222daf-bfd2-4241-9314-130b1e82b962)


### 여러 중복열 제거
```sql

SELECT DISTINCT job, deptno FROM emp;

```
![스크린샷 2023-11-21 오전 1 56 49](https://github.com/choiminjun94/TIL2023/assets/60457431/53260895-9a1c-4472-890d-3a77d57236a7)


### 별칭 지정
### 별칭 (열과 연산식 )
```sql

SELECT ename, sal, sal*12+Comm,comm FROM emp;

```
![스크린샷 2023-11-21 오전 1 56 40](https://github.com/choiminjun94/TIL2023/assets/60457431/95465d04-1a7d-4c29-a6ba-09ee04de5ca2)


### 별칭 지정2 (as)
```sql

SELECT ename AS 이름, sal AS 월급, sal*12+comm AS 연간총수입, comm FROM emp; 

```
![스크린샷 2023-11-21 오전 1 56 29](https://github.com/choiminjun94/TIL2023/assets/60457431/baf1c2a8-7633-4c15-b852-f26414cb7a81)


### 원하는 순서로 출력 데이터를 정렬 (order by)
### 오름차순
```sql

SELECT * FROM emp ORDER BY sal;

```
![스크린샷 2023-11-21 오전 1 56 19](https://github.com/choiminjun94/TIL2023/assets/60457431/948a21d9-e4b2-4a25-8d45-503471d4efb5)


### 복습 (사원번호 오름차순)
```sql

 SELECT * FROM emp ORDER BY empno;

```
![스크린샷 2023-11-21 오전 1 55 53](https://github.com/choiminjun94/TIL2023/assets/60457431/9b14573b-3202-4f8e-8df2-849111e254c2)


### 급여 내림차순 (desc)
```sql

SELECT * FROM emp ORDER BY sal DESC; 

```
![스크린샷 2023-11-21 오전 1 55 39](https://github.com/choiminjun94/TIL2023/assets/60457431/90e0e15d-2ad8-4f19-b5bc-e9a9f9258b6b)


### 오름차순과 내림차순 동시에 사용
```sql

SELECT * 
	FROM emp 
ORDER BY DEPTNO, sal DESC;

```
![스크린샷 2023-11-21 오전 1 55 28](https://github.com/choiminjun94/TIL2023/assets/60457431/395cd9e8-e6d4-472c-9ded-1f15a0084e23)


### 과제 (잡 중복 제거하기)
```sql

SELECT DISTINCT  job AS 직업 FROM emp; 

```
![스크린샷 2023-11-21 오전 1 55 18](https://github.com/choiminjun94/TIL2023/assets/60457431/78ac5ba2-7cb4-4547-9f76-355765d36b8b)

```sql

SELECT empno AS "EMPLOYEE_NO", ename AS "EMPLOYEE_NAME", job, MGR  AS "MANAGER", hiredate ,sal AS "SALARY", comm AS "COMMISSION", deptno AS "DEPARTMENT_NO" 

	FROM emp ORDER BY EMPNO DESC, ENAME ;
	
```
![스크린샷 2023-11-21 오전 1 55 07](https://github.com/choiminjun94/TIL2023/assets/60457431/35c00170-23d8-421a-b6ec-f670db1ee77a)

##  Day.2 (DO it)
### where문 select문으로 데이터를 조회할때 특정 조건을 기준으로 원하는 행을 출력

### 부서번호 30인 데이터 출력 
```sql

SELECT * FROM emp WHERE DEPTNO = 30; s

```

### 사원번호 7782인 사원번호만
```sql

SELECT * FROM emp WHERE empno = 7782;

```

### 여러개 조건식을 사용하는 연산자(AND, OR) 
### AND 연산자로 여러개의 조건식을 사용
```sql

SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';

```

### 사원번호가 7499이고 부서번호가 30인 것
```sql

SELECT * FROM emp WHERE empno = 7499 AND DEPTNO =30;

```

### OR연산자로 여러개를 출력 조건 사용
```sql

SELECT * FROM emp WHERE DEPTNO = 30 OR job = 'salesman';

```

### 부서번호가 20 이거나 직업이 salesman인 사원정보만 나오게
```sql

SELECT * FROM emp WHERE DEPTNO =20 OR job='salesman';

``` 

### 연산자 종류와 활용 방법

### 산술연산자 (+,-,*,/)
```sql

SELECT * FROM emp WHERE sal * 12 = 36000;

```

### 비교연산자
```sql

SELECT * FROM emp WHERE sal >= 3000;

```

### 급여가 2500이상이고 직업이 ANALYST인 사원정보만
```sql 

SELECT * FROM emp WHERE sal >= 2500 AND job='ANALYST'; 

```

### 비교 문자열이 문자 하나일 
### 알파벳 순서상 F와 같거나 F보다 뒤에 있는 문자열
```sql

SELECT * FROM emp WHERE ename >= 'F';

```

### 등가 비교 연산자
### ( != )
```sql 

SELECT * FROM emp WHERE sal != 3000;

```

### ( <> )
```sql

SELECT * FROM emp WHERE sal <> 3000;

```

### ( ^= )
```sql

SELECT * FROM emp WHERE sal ^= 3000;

```

### 부정연산자
```sql

SELECT * FROM emp WHERE NOT sal = 3000;

```

### in 연산자
### 특정열에 해당하는 조건을 여러개 지정 
```sql

SELECT * FROM emp WHERE job IN ('MANAGER', 'SALESMAN', 'CLERK');

```

### IN연산자와 논리부정연사자를 사용하여 출력
```sql

SELECT * FROM emp WHERE job NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

```

### IN연산자를 사용 부서번호 10,20인 사원정보만 나오도록
```sql 

SELECT * FROM emp WHERE DEPTNO IN (10,20);

```

### Between a and B 연산자
### 특정 열 값의 최소, 최고범위를 지정
```sql

SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

```

### Between a and b연산자와 NOT 연산자를 사용하여 출력
```sql 

SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

```

### Like연산자와 와일드카드

### Like연산자는 일부 문자열이 포함된 데이터를 조회할때 사용
### ename 열 값이 대문자 S로 시작하는 데이터를 조회
```sql 

SELECT * FROM emp WHERE ENAME LIKE 'S%';

```

### 와일드 카드 
### _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미 
```sql

SELECT * FROM emp WHERE ename LIKE '_L%';

```
### % : 길이와 상관없이 (문자 없이 경우도 포함) 모든 문자 데이터를 의미
```sql

SELECT * FROM emp WHERE ename LIKE '%AM%';

```
 
```sql 

SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

```

### IS NULL : NULL인 데이터를 출력 
### IS NULL과 IS NOT NULL은 잘쓰인다고 함 
```sql

SELECT * FROM emp WHERE comm IS NULL;

```

### 직속상관이 있는 사원만 출력 
```sql

SELECT * FROM emp WHERE MGR IS NOT NULL;

```

### OR 연산자와 IS NULL연산자 사용
```sql

SELECT * FROM emp WHERE sal > NULL OR comm IS NULL;

```

### 집합 연산자 (union)
### 두개의 select문 사이에 사용되는 연산자
### 중복은 제외
### 주의 : 출력하려는 열갯수와 각 열의 자료형이 순서별로 일치 해야한다.

```sql 

SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10 
UNION 
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

```


### 집합 연산자 (union all)
### 중복 데이터도 모두 출력
```sql

SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10 
UNION all
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

```


### 집합 연산자 (minus)
### 차집합
```sql

SELECT empno, ename, sal, deptno FROM emp
minus
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

```



### 집합 연산자 (intersect)
### 교집합
### 두 select문의 결과값이 같은 데이터만 출력
```sql 

SELECT empno, ename, sal, deptno FROM emp
intersect
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

```




## 과제 
### EMP테이블을 사용하여 다음과 같이 사원 이름이 S로 끝나는 사원 데이블를 모두 출력
```sql 

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno 
	FROM emp 
WHERE ename LIKE '%S';

```


### EMP 데이블을 사용하여 30번 부서에서 근무하고 있는 사원 중에 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서 번호를 출력
```sql 

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
	FROM emp 
WHERE deptno ='30' 
AND job ='SALESMAN';

```


### EMP데이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두가지 방식의 select문을 사용하여 사원번호, 이름, 급여, 부서번호를 출력 
```sql 

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
	FROM emp 
WHERE deptno IN (20,30) 
AND SAL >= 2000;

```


### EMP데이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두가지 방식의 select문을 사용하여 사원번호, 이름, 급여, 부서번호를 출력
```sql 

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
	FROM emp 
WHERE deptno = 20 
	AND 
SAL > 2000
UNION 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM emp WHERE deptno = 30 AND SAL > 2000;

``` 


### NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여열 값이 2000 이상 3000이하 범위 이외의 값을 가진 데이터만 출력
```sql 

SELECT * FROM emp WHERE sal > 2000 OR sal < 3000;

```

### 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원 이름, 사원 번호, 급여 부서번호를 출력 
```sql 

SELECT ENAME, EMPNO, SAL, DEPTNO 
	FROM EMP 
WHERE DEPTNO = 30 
AND ENAME LIKE '%E%' 
AND SAL NOT BETWEEN 1000 AND 2000;

```
## Day.3 (DO it)

## 함수 
### 문자 함수 
### upper(전부 대문자), lower(전부 소문자), initcap(첫글만 대문자)
```sql

SELECT Ename, upper(ename), lower(ename), INITCAP(ename)
FROM emp;

```


### Upper 함수로 문자열 비교 (사원이름 SCOTT인 데이터 찾기)
```sql

SELECT * FROM emp
WHERE UPPER(ENAME) = upper('scott'); 

```

### Upper 함수로 문자열 비교 (사원이름에 SCOTT 단어를 포함한 데이터 찾기)
```sql

SELECT * FROM emp
WHERE upper(ENAME) LIKE upper('%scott%');

```

### 사원이름 대문자로 출력
```sql 

SELECT UPPER(ename)  FROM emp;

```

### Length 함수
```sql 

SELECT INITCAP(ename), LENGTH (ename) AS "문자열 길이" FROM emp;

```
	
### where절 Length 함수 활용
```sql 

SELECT ename, LENGTH (ename) FROM emp
WHERE LENGTH(ename) >= 5;

```


### 바이트 수 반환 (LENGTHB)
### 직책 이름이 6글자 이상인 데이터만 출력
```sql

SELECT ENAME, job, LENGTHB(job) FROM emp WHERE LENGTHB(job) >= 6; 

```

### 문자열 일부를 추출(substr)
### substr(문자열 데이터, 시작위치, 추출길이)
### substr(문자열 데이터, 시작위치)
```sql 

SELECT job, substr(job,1,2), substr(job,3,2), SUBSTR(job,5) FROM emp; 

```

### 모든 사원 이름을 세번째 글자부터 끝까지 출력 
```sql

SELECT ename, substr(ename, 3) FROM emp;

```

### INSTR(문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 확인)
### INSTR [대상 문자열 데이터 필수(필수)]
###		 [위치를 찾으려는 부분의 문자(필수)]
###       [위치 찾기를 시작할 대상 문자열 데이터 위치(선택, 기본값은 1)]
###       [시작 위치에서 찾으려는 문자가 몇번째인지 지정(선택, 기본값은 1)]
```sql

SELECT INSTR ('HELLO, ORACLE!', 'L') AS instr_1,
	   INSTR ('HELLO, ORACLE!', 'L',5) AS instr_1,
	   INSTR ('HELLO, ORACLE!', 'L',2,2) AS instr_1
FROM dual;

```

### instr함수로 사원이름에 문자 S가 있는 행 구하기
```sql

SELECT * FROM emp WHERE instr(ENAME, 'S') > 0;

```

```sql

SELECT * FROM emp WHERE ENAME LIKE '%S%';

```

### (replace)특정문자를 다른 문자로 바꾸기
### Replace([문자열 데이터 또는 열 이름(필수)]),[찾는 문자(필수)],[(대체할 문자(택)]
```sql 

SELECT '010-1234-5678' AS "바뀌기 전 번호",
		REPLACE ('010-1234-5678', '-', ' ') AS 바꾸기1,
		REPLACE ('010-1234-5678', '-') AS 바꾸기2 
		FROM dual;

```

	
### (L,RPAD)데이터의 빈 공간을 특정문자로 변경 
```sql 

SELECT 'Oracle',
		LPAD('Oracle', 10, '#') AS Lpad_1,
		RPAD('Oracle', 10, '*') AS Rpad_1,
		LPAD('Oracle', 10) AS Lpad_2,
		RPAD('Oracle', 10) AS Rpad_2
		FROM DUAL;

```


### RPAD함수를 사용하여 개인정보 뒷자리 *표시 표현
```sql

SELECT 
	RPAD ('940311-', 14, '*')AS RPAD_JMMO,
	RPAD ('010-1111-', 13, '*')AS RPAD_PHONE
	FROM dual;

```

	
### (CONCAT) 두 문자열 데이터를 합치
```sql 

SELECT CONCAT(empno,ename),
	   CONCAT(empno,concat(' : ',ename))
	   FROM emp
	   WHERE ename = 'SCOTT';

```

	  
### 특정문자를 지우기
### (TRIM) 
```sql 

SELECT '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM,
       '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
  FROM DUAL;

```

 
 ### 특정 위치에서 반올림하는 ROUND 함수
 ### ROUND([숫자(필수)], [반올림 위치(선택)])
```sql 

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
  FROM DUAL;

```

 
 ### 특정 위치에서 버리는 TRUNC 함수
 ### TRUNC([숫자(필수)], [버림 위치(선택)])
```sql 

SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
  FROM DUAL;

```
 
 ### 지정한 숫자와 가까운 정수를 찾는 CEIL, FLOOR 함수
 ### CEIL([숫자(필수)])
 ### FLOOR([숫자(필수)])
 ```sql

SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
  FROM DUAL;

 ```
 
