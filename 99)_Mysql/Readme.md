# MYSQL 쿼리 정리

## 1일차

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

-- country 테이블과 countrylanguage 정보보기

```sql
desc country;

desc countrylanguage;
```

![6](https://user-images.githubusercontent.com/60457431/236145940-08350aa5-19d2-4203-b039-1ef0ad518244.png)

![7](https://user-images.githubusercontent.com/60457431/236145970-7d1329e2-f81a-4621-b04b-530c75cafaf7.png)

## 요구하는 데이터를 가져오는 구분 SELECT

show databases;
use world;

SELECT \* from city;

-- 데이블에서 필요로 하는 열만 가져오기 가능
-- 여러 개의 열을 가져오고 싶을 때는 콤마로 구분

select name, district from city;

-- 조회하는 결과에 특정한 조건 줘서 원하는 데이터만 보고 싶을 떄 사용
-- select 필터 이름 from 테이블 이름 where 조건식;

SELECT \* from city WHERE population > 800000

-- 관계 연산자의 사용
select \* from city WHERE Population > 7000000 and Population < 8000000;

-- 과제

-- 한국에 있는 도시만 보기
SELECT \* FROM city WHERE CountryCode = 'kor';

-- 미국에 있는 도시만 보기
SELECT \* from city where CountryCode ='usa';

-- 한국 도시중 인수가 1,000,000 이상 인 도시만 보기
SELECT \* from city WHERE CountryCode ='kor' and Population > 1000000;

-- 데이터가 숫자로 구성도어 있어 연속적인 값은 Between ... AND 사용 가능

SELECT \* from city where Population BETWEEN 7000000 and 8000000;

-- 이산적인( 연속성이 전혀 없는 분리된 상태 ) 값의 조건에서는 in() 사용가능
SELECT \* from city WHERE name IN('seoul', 'tokyo', 'moscow');

-- 과제
-- 한미일 국가 도시 검색

SELECT \* from city where CountryCode in('kor', 'jpn', 'usa');

-- 한미일 도시 중 인구 2,000,000 에서 8,000,000 인 도시 검색
SELECT \* from city where CountryCode in('kor', 'jpn', 'usa') and Population BETWEEN 2000000 and 8000000;
