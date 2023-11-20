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

