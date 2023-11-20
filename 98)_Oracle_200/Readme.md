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


 
