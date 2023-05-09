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

## 문자열의 내용 검색하기 위해 Like 연산자 사용

## 문자 뒤에 %-에 무엇이든 (%) 허용

## 한 글자와 매치하기 위해서는 '\_'사용

```sql
SELECT \* from city where CountryCode like 'Ko%'

SELECT \* from city where CountryCode like 'Ko\_'
```

![1](https://user-images.githubusercontent.com/60457431/236684949-3236427b-4474-4c72-9035-1826ed7b0d5a.png)

![2](https://user-images.githubusercontent.com/60457431/236684957-0a9dd63d-0988-4901-920f-40616432c5b3.png)

## 중요 [Sub Query]

## 쿼리문 안에 또 퀄리문이 들어 있는것

## 서브쿼리의 결과가 둘 이상이 되면 에러 발생

```sql
SELECT \* from city WHERE CountryCode =( SELECT CountryCode from city WHERE name = 'new york');
```

![3](https://user-images.githubusercontent.com/60457431/236684978-50811b33-4a5e-4b34-bb1f-b03a82b86551.png)

## [ANY]

## 서브쿼리의 여러개의 결과 중 한가지만 만족해도 가능

## SOME은 ANY와 동일한 의미로 사용

## ANY구문은 IN과 동일한 의미

```sql
SELECT \* from city where Population > ANY ( SELECT Population from city WHERE District = 'new york');
```

![4](https://user-images.githubusercontent.com/60457431/236685001-a9a8a1d4-8e47-4479-8519-8dedccaf9e22.png)

## [ALL]

## 서브쿼리의 여러 개의 결과를 모두 만족 시켜야 함

```sql
SELECT \* FROM city WHERE Population > all (SELECT Population from city WHERE District = 'new york');
```

![5](https://user-images.githubusercontent.com/60457431/236685018-b6eec9bd-6011-4650-9a9c-985f7fa05fe8.png)

## [ORDER BY No.1]

## 결과문에 대해 영향을 미치지는 않음

## 결과가 출력되는 순서를 조절하는 구문

## 기본적으로는 오름차순(ASC)이다.

## 내림차순 (DESC)

```sql
select _ from city order by Population desc;
select _ from city order by Population;
```

![6](https://user-images.githubusercontent.com/60457431/236685083-3f196267-d772-46b6-8cee-bfcbee7cef19.png)

![7](https://user-images.githubusercontent.com/60457431/236685090-e03588ae-ec9e-4952-ae73-37d93fbd072c.png)

## [ORDER BY No.2]

## 혼합해 사용하는 구문

```sql
SELECT \* from city order by CountryCode asc, Population desc;
```

![8](https://user-images.githubusercontent.com/60457431/236685109-f70fefdc-4b76-4bea-91a8-846b3185e6d8.png)

## [과제]

## 한국에는 도시 인구수 내림차순으로 출력

```sql
select \* from city where CountryCode ='kor' order by Population desc;
```

![9](https://user-images.githubusercontent.com/60457431/236685135-a1a7fd8c-eee6-4359-9e1d-fd274732afc7.png)

## 국가면적 크기로 내림차순

```sql
SELECT \* from country order by SurfaceArea desc;
```

![10](https://user-images.githubusercontent.com/60457431/236685154-51554c76-736e-41cc-9c36-25996fb49d63.png)

## DAY4

## [DISTINCT]

## 중복된 것은 1개씩만 보여주면서 출력

## 데이블의 크기가 클수록 효율적

```sql
SELECT DISTINCT  countryCode from city;
```

![1](https://user-images.githubusercontent.com/60457431/236849271-c053a5cd-3245-4e5b-883a-e5b41ab84425.png)

## [LIMIT]

## 출력 개수를 제한

## 일부를 보기 위해 여러 건의 데이터를 출력

## 상위 N개만 출력하는 'LIMIT N' 구문을 사용

```sql
SELECT * from city order by population desc limit 10;
```

![2](https://user-images.githubusercontent.com/60457431/236849314-03477784-d7f8-4006-8c3c-75882f260d6b.png)

## [Group BY]

```text
그룹으로 묶어주는 역할
집계함수를 함께 사용
AVG() : 평균
MIN() : 최소값
MAX() : 최대값
Count() : 행의 개수
count(distinct) : 중복제외된 행의 갯수
sidev() : 표준편차
VARIANCE() : 분산
```

```sql
SELECT countrycode, max(population) from city group by CountryCode;
```

![3](https://user-images.githubusercontent.com/60457431/236849342-3af52a4a-6ef5-48f8-a58d-89b196f64729.png)

## [과제]

## 전체 도시는 ?

```sql
SELECT count(\*) from city;
```

![4](https://user-images.githubusercontent.com/60457431/236849373-63125f77-2d20-47df-9b29-c1ff10cba466.png)

## 전체 도시들의 평균 인구수는 ??

```sql
SELECT avg(population) from city;
```

![5](https://user-images.githubusercontent.com/60457431/236849404-d4b01399-e224-4a4c-93f2-2d83be8d930a.png)

## DAY 5

## [HAVING]

## WHERE과 비슷한 개념으로 조건 제한

## 집계함수에 대해서 조건제한 하는 편리한 개념

## HAVING절은 반드시 GROUP BY절 다음에 나와야 함

```sq;
SELECT countrycode, max(population) 'max population' from city group by CountryCode having max(Population) > 8000000;
```

![1](https://github.com/choiminjun94/TIL2023/assets/60457431/ecc59c60-1934-4914-a0b8-6255f04c162f)


## [rollup]

## 총합 또는 중간합계가 필요한 경우 사용

## group by절과 함께 with rollup문 사용

```sq;
SELECT countrycode, name, sum(population) from city group by CountryCode, name with ROLLUP;
```

![2](https://github.com/choiminjun94/TIL2023/assets/60457431/38eaede9-6351-4b16-af4c-7802cb9657e4)


## [join]

## 데이터베이스 내의 여러 데이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과 집합으로 표현

```sq;
select * from city join country on city.CountryCode = country.code;
```

![3](https://github.com/choiminjun94/TIL2023/assets/60457431/ecdd6c9a-6a1e-4c73-b6af-7656482ad912)


## [과제]

## city, country, countrylanguage 테이블3개를 join

```sql
select * from city join country on city.CountryCode = country.code join countrylanguage on city.CountryCode  = countrylanguage.CountryCode;
```

![스크린샷 2023-05-09 오후 11 10 58](https://github.com/choiminjun94/TIL2023/assets/60457431/dadb75fe-e351-494b-96ea-d6918a6aacdd)


