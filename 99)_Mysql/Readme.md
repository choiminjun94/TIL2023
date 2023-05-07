# MYSQL 쿼리 정리

## DAY1

### 현재 서버에 어떤 DB가 있는지 보기

```sql
show DATABASES;
```

![1](https://user-images.githubusercontent.com/60457431/236145038-1384b185-d531-4654-b2bc-e25dc7060c91.png)

### 사용할 데이터베이스 지정

```sql
use world;
```

![2](https://user-images.githubusercontent.com/60457431/236145263-f4e79613-5915-404f-8fd7-eb5e2258a17b.png)

### 데이터베이스 테이블 이름 보기

```sql
show tables;
```

![3](https://user-images.githubusercontent.com/60457431/236145424-7a1bcaea-d920-4beb-95cf-3a8075d3abc0.png)

## 데이터베이스의 테이블 정보 조회

```sql
show table status;
```

![4](https://user-images.githubusercontent.com/60457431/236145582-e8425602-57ac-4e11-83c6-142850912557.png)

## 무슨 열이 있는지 확인 //속성 정보

```sql
desc city;
```

![5](https://user-images.githubusercontent.com/60457431/236145865-d2b0c8ae-d29e-4241-a7e7-9ff7b80d9434.png)

## 과제

## country 테이블과 countrylanguage 정보보기

```sql
desc country;

desc countrylanguage;
```

![6](https://user-images.githubusercontent.com/60457431/236145940-08350aa5-19d2-4203-b039-1ef0ad518244.png)

![7](https://user-images.githubusercontent.com/60457431/236145970-7d1329e2-f81a-4621-b04b-530c75cafaf7.png)

## DAY2

## 요구하는 데이터를 가져오는 구분 SELECT

```
show databases;
use world;

SELECT \* from city;
```

## 데이블에서 필요로 하는 열만 가져오기 가능

## 여러 개의 열을 가져오고 싶을 때는 콤마로 구분

```sql
select name, district from city;
```

![스크린샷 2023-05-07 오후 10 23 52](https://user-images.githubusercontent.com/60457431/236680435-1fab7342-e02c-433a-9199-4be560e774a3.png)

## 조회하는 결과에 특정한 조건 줘서 원하는 데이터만 보고 싶을 떄 사용

## select 필터 이름 from 테이블 이름 where 조건식;

```sql
SELECT \* from city WHERE population > 800000
```

![스크린샷 2023-05-07 오후 10 24 09](https://user-images.githubusercontent.com/60457431/236680544-65e08a20-24aa-412e-bfb1-bc255195c7ff.png)

## 관계 연산자의 사용

```sql
select \* from city WHERE Population > 7000000 and Population < 8000000;
```

![스크린샷 2023-05-07 오후 10 24 30](https://user-images.githubusercontent.com/60457431/236680559-c2bfe7ae-acd1-4493-a155-6552287dc489.png)

## 과제

## 한국에 있는 도시만 보기

```sql
SELECT \* FROM city WHERE CountryCode = 'kor';
```

![스크린샷 2023-05-07 오후 10 24 44](https://user-images.githubusercontent.com/60457431/236680598-708f8dac-c860-447f-834b-2c09a1bea17e.png)

## 미국에 있는 도시만 보기

```sql
SELECT \* from city where CountryCode ='usa';
```

![스크린샷 2023-05-07 오후 10 24 58](https://user-images.githubusercontent.com/60457431/236680636-bd9e11a0-c435-45cd-a1a4-5c0a492e414b.png)

## 한국 도시중 인수가 1,000,000 이상 인 도시만 보기

```sql
SELECT \* from city WHERE CountryCode ='kor' and Population > 1000000;
```

![스크린샷 2023-05-07 오후 10 25 12](https://user-images.githubusercontent.com/60457431/236680659-36f33def-2446-4d8f-9543-8495ad0c5d55.png)

## 데이터가 숫자로 구성도어 있어 연속적인 값은 Between ... AND 사용 가능

```sql
SELECT \* from city where Population BETWEEN 7000000 and 8000000;
```

![스크린샷 2023-05-07 오후 10 25 29](https://user-images.githubusercontent.com/60457431/236680701-df716895-6679-4e49-abdf-ebe78062c822.png)

## 이산적인( 연속성이 전혀 없는 분리된 상태 ) 값의 조건에서는 in() 사용가능

```sql
SELECT \* from city WHERE name IN('seoul', 'tokyo', 'moscow');
```

![스크린샷 2023-05-07 오후 10 25 40](https://user-images.githubusercontent.com/60457431/236680728-d07b44bf-5c6a-44d7-86a2-f22287ab0c61.png)

## 과제

## 한미일 국가 도시 검색

```sql
SELECT \* from city where CountryCode in('kor', 'jpn', 'usa');
```

![스크린샷 2023-05-07 오후 10 26 12](https://user-images.githubusercontent.com/60457431/236680744-0cd3e076-abf5-4040-b547-a92e9e5431a8.png)

## 한미일 도시 중 인구 2,000,000 에서 8,000,000 인 도시 검색

```sql
SELECT \* from city where CountryCode in('kor', 'jpn', 'usa') and Population BETWEEN 2000000 and 8000000;
```

![스크린샷 2023-05-07 오후 10 26 26](https://user-images.githubusercontent.com/60457431/236680764-7b3c69da-a430-4afd-99a0-d0393605f5bb.png)

## DAY3

-- 요구하는 데이터를 가져오는 구분 SELECT
show databases;
use world;

-- 문자열의 내용 검색하기 위해 Like 연산자 사용
-- 문자 뒤에 %-에 무엇이든 (%) 허용
-- 한 글자와 매치하기 위해서는 '\_'사용
SELECT \* from city where CountryCode like 'Ko%'

SELECT \* from city where CountryCode like 'Ko\_'

-- 중요 [Sub Query]
-- 쿼리문 안에 또 퀄리문이 들어 있는것
-- 서브쿼리의 결과가 둘 이상이 되면 에러 발생

SELECT \* from city WHERE CountryCode =( SELECT CountryCode from city WHERE name = 'new york');

-- [ANY]
-- 서브쿼리의 여러개의 결과 중 한가지만 만족해도 가능
-- SOME은 ANY와 동일한 의미로 사용
-- ANY구문은 IN과 동일한 의미

SELECT \* from city where Population > ANY ( SELECT Population from city WHERE District = 'new york');

-- [ALL]
-- 서브쿼리의 여러 개의 결과를 모두 만족 시켜야 함

SELECT \* FROM city WHERE Population > all (SELECT Population from city WHERE District = 'new york');

-- [ORDER BY No.1]
-- 결과문에 대해 영향을 미치지는 않음
-- 결과가 출력되는 순서를 조절하는 구문
-- 기본적으로는 오름차순(ASC)이다.
-- 내림차순 (DESC)

select _ from city order by Population desc;
select _ from city order by Population;

-- [ORDER BY No.2]
-- 혼합해 사용하는 구문
SELECT \* from city order by CountryCode asc, Population desc;

-- [과제]
-- 한국에는 도시 인구수 내림차순으로 출력
select \* from city where CountryCode ='kor' order by Population desc;

-- 국가면적 크기로 내림차순
SELECT \* from country order by SurfaceArea desc;
