# Oracle 쿼리 정리 (200제)

## DAY1
## 기본서를 읽은 다음 문제풀이 과정
## emp 테이블 생성은 Oracle Doit 참고

## Day.1 (200제)

### 001) 사원번호 및 이름, 월급만 
```sql

SELECT empno, ename,sal FROM emp; 

```

### 002) 테이블에서 모든 열 출력
```sql 

SELECT * FROM emp;

```

### 003) 컬럼 별칭을 사용하여 출력되는 컬럼명 변경
```sql

SELECT empno AS "사원번호", ename AS "이름", sal FROM emp;

```
### 004) 사원테이블의 이름과 월급을 붙여서 출력 (몰랐음)
```sql

SELECT ename || sal FROM emp;

```

```sql

SELECT ename || '의 월급은 ' || sal ||' 입니다.' AS  월급정보  FROM emp;

```

### 005)사원 직업에서 중복된 데이터 제거 (DISTINCT)
```sql

SELECT DISTINCT job FROM emp; 

```

### 006) 이름과 월급을 출력하는데 월급이 낮은 사원별로 출력 (asc)
```sql

SELECT ename, sal FROM emp ORDER BY sal ASC;

```

### 006.1) 이름과 부서번호는 내림차순 월급은 올림차순으로 출력
```sql

SELECT ename AS "이름", DEPTNO  AS "부서번호", sal AS "월급" 
	FROM emp 
ORDER BY DEPTNO asc , sal desc;

```
 