# Oracle 쿼리 정리 (200제)

## DAY1

``` txt
기본서를 읽은 다음 문제풀이 과정
emp 테이블 생성은 Oracle Doit 참고
```

## Day.1 (200제)

### 001) 사원번호 및 이름, 월급만 
```sql

SELECT empno, ename,sal FROM emp; 

```
![스크린샷 2023-11-21 오전 2 17 56](https://github.com/choiminjun94/TIL2023/assets/60457431/2f11e8c3-01cf-4b0f-aa87-0a13697d0f06)

### 002) 테이블에서 모든 열 출력
```sql 

SELECT * FROM emp;

```
![스크린샷 2023-11-21 오전 2 17 46](https://github.com/choiminjun94/TIL2023/assets/60457431/ad9c3135-9a11-4e23-9b14-d5eb88ef8b2e)


### 003) 컬럼 별칭을 사용하여 출력되는 컬럼명 변경
```sql

SELECT empno AS "사원번호", ename AS "이름", sal FROM emp;

```
![스크린샷 2023-11-21 오전 2 17 36](https://github.com/choiminjun94/TIL2023/assets/60457431/6ae2cb5a-31ba-42d6-90fa-f19f5274a956)


### 004) 사원테이블의 이름과 월급을 붙여서 출력 (몰랐음)
```sql

SELECT ename || sal FROM emp;

```
![스크린샷 2023-11-21 오전 2 17 25](https://github.com/choiminjun94/TIL2023/assets/60457431/b6c3d324-d073-47e9-b5c5-a81978f7fe79)

```sql

SELECT ename || '의 월급은 ' || sal ||' 입니다.' AS  월급정보  FROM emp;

```
![스크린샷 2023-11-21 오전 2 17 15](https://github.com/choiminjun94/TIL2023/assets/60457431/3ba3680c-9d00-4a83-8742-4c856fcbfe84)


### 005)사원 직업에서 중복된 데이터 제거 (DISTINCT)
```sql

SELECT DISTINCT job FROM emp; 

```
![스크린샷 2023-11-21 오전 2 17 01](https://github.com/choiminjun94/TIL2023/assets/60457431/b35b4e7e-70de-4a10-8703-8d9a85a32b86)


### 006) 이름과 월급을 출력하는데 월급이 낮은 사원별로 출력 (asc)
```sql

SELECT ename, sal FROM emp ORDER BY sal ASC;

```
![스크린샷 2023-11-21 오전 2 16 50](https://github.com/choiminjun94/TIL2023/assets/60457431/f2f78917-eb0d-4d9b-8136-691259045786)


### 006.1) 이름과 부서번호는 내림차순 월급은 올림차순으로 출력
```sql

SELECT ename AS "이름", DEPTNO  AS "부서번호", sal AS "월급" 
	FROM emp 
ORDER BY DEPTNO asc , sal desc;

```
![스크린샷 2023-11-21 오전 2 16 38](https://github.com/choiminjun94/TIL2023/assets/60457431/f4ae1185-8c55-4333-a3c4-ceddaaec0d9c)


## Day.2 (200제)

## Where
### 007) 월급이 3000인 사원들의 이름과 월급 직업을 출력
```sql

SELECT ename, sal, job
FROM emp
WHERE sal = 3000;

```


### 007.1) 월급이 3000이상인 사원들의 이름과 월급을 출력
```sql

SELECT ename AS 이름, sal AS 월급
FROM emp
WHERE sal >= 3000;

```


### 008) 사원이름이 SCOTT의 이름,월급,직업,입사일,부서번호
```sql

SELECT ename,sal,hiredate,deptno
FROM emp
WHERE ename = 'SCOTT';

```


### 008.1) 입사일이 81년 11월 17일에 입사한 사원 이름과 입사일 출력
```sql

SELECT ename, hiredate
FROM emp 
WHERE HIREDATE ='81/11/17';

```


## 산술 연산자 
### 009) 연봉이 36000 이상인 이름과 연봉 
```sql

SELECT ename AS 이름, sal*12 AS 연봉 
FROM emp
WHERE sal*12 > 36000;

```


### 009.1) 부서번호가 10번인 사원들 의 이름, 월급, 커미션, 월급+커미션을 출력
```sql

SELECT ename, sal, comm, sal+comm
FROM emp
WHERE DEPTNO = 10;

```


## 비교연산자 
### 010) 월급이 1200이하인 사원들의 이름과 월급 직업 부서번호를 출력 
```sql

SELECT ename, sal, job, deptno
FROM emp
WHERE sal <= 1200;

```


### 011) 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력
```sql

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

```


### 011.1)  11과 다른 표현으로
```sql 

SELECT  ename, sal
FROM emp
WHERE (sal >= 1000 AND sal <= 3000);

```


### 011.2)월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력
```sql 

SELECT ename, sal
FROM emp
WHERE sal NOT BETWEEN 1000 AND 3000;

```


### 012)첫 글자가 S로 시작하는 사원들의 이름과 월급 출력(LIKE)
```sql 

SELECT ename, sal 
FROM emp
WHERE ename LIKE 'S%';

```


### 012.1) 이름의 두번째 철자가 M인 사원의 이름을 출력
```sql 

SELECT ename 
FROM emp 
WHERE ename LIKE '_M%';

```


### 012.2) 이름에 A가 들어가는 사람 
```sql 

SELECT ename 
FROM emp
WHERE ename LIKE '%A%';

```


### 013) 커미션이 NULL인 사원들의 이름과 커미션 출력
```sql 

SELECT ename, comm 
FROM emp
WHERE comm IS NULL;

```


### 014) 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업을 출력 (IN)
```sql 

SELECT ename, sal, job
FROM emp
WHERE job in('saleman','ANALYST','MANAGER');

```


### 014.1) 직업이 SALESMAN, ANALYST, MANAGER이 아닌 사원들의 이름, 월급, 직업을 출력
```sql

SELECT ename, sal, job 
FROM emp 
WHERE job NOT IN ('saleman','ANALYST','MANAGER');

```


### 015) 직업이 salesman이고 월급이 1200 이상인 사원들의 이름,월급,직업 출력
```sql

SELECT ename, sal, job
FROM emp
WHERE job='SALESMAN' AND sal > 1200;

```
## Day.3 (200제)
### 016) 대소문자 변환 함수 (Upper, Lower, INITCAP)
```sql

SELECT upper(ename), lower(ename), INITCAP(ename) FROM emp;

```

 ### 016.1) scott인 사원의 이름 및 월급 조회
 ```sql

 SELECT ename, sal 
 FROM emp 
 WHERE LOWER(ename) = 'scott'; 

 ```

 ### 017) 문자에서 특정 철자 추출하기 (SUBSTR)
 ### SMITH에서 SMI만 잘라서 추출
```sql 

SELECT substr('SMITH', 1,3) FROM dual; 

```

### 018) 문자열의 길이를 출력 (LENGTH)
### 이름을 출력하고 그 옆에 이름의 철자 갯수를 출력
```sql

SELECT ename, LENGTH(ename) FROM emp;

```
### 바이트의 길이 반환
```sql 

SELECT LENGTHB('가나다라마') FROM dual; 

```

### 019) 문자에서 특정 철자의 위치 출력(INSTR)
```sql 

SELECT INSTR('SMITH', 'M') FROM dual;

SELECT instr('abcdefg@naver.com', '@') FROM dual;

```


### 020) 특정철자를 다른 철자로 변경 (REPLACE)
```sql 

SELECT ename, REPLACE (sal, 0, '*') FROM emp;

```
### 정규식 변경 (REGEXP_REPLACE)
```sql 

SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') AS salary FROM emp; 

```

### 021) 특정 철자를 N개 만큼 채우기
```sql 

SELECT ename, lpad(sal, 10, '*') AS salary1, rpad(sal, 10, '#') AS salary2 FROM emp;

```

### 022) 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)
```sql

 SELECT 'smith', ltrim('simth', 's'), RTRIM('smith','h'), TRIM('s' FROM 'smiths') FROM dual; s

``` 

### 022.1) 데이터가 안나올시 공백 때문일수도,...
```sql 

SELECT ename, sal FROM emp WHERE ename = 'JACK';
SELECT ename, sal FROM emp WHERE RTRIM(ename) = 'JACK'; 

```

### 023) 반올림해서 출력 (ROUND)
```sql

SELECT '876.543' AS 숫자, round(876.567,1 ) FROM dual;

```

### 024) 숫자를 버리고 출력(TRUNC) 
```sql

SELECT '876.422' AS 숫자, trunc(853.432,1) FROM dual;

```
