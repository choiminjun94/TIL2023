-- Day1

show databases;

-- 사용할 디비 지정 (use)
use world;

-- 데이터베이터 테이블 이름 보기 (show)
show tables;

-- 테이블 정보 조회 (status)
show table status;

-- 특정 테이블의 무슨 열이 있는지 확인 (테이블 속성 정보)
desc city;

desc country; 
desc countrylanguage;

-- 요구하는 데이터를 가져오는 구문 (select)
SELECT * from city;

-- 테이블에서 필요로 하는 열만 가져오기 
-- 여러 개의 열을 가져오고 싶을 때는 ,로 구분 

SELECT name, district from city;

-- 조회하는 결과에 특정한 조건 줘서 원하는 데이터만 보기 

SELECT * from city where population > 800000;  

-- 과제
-- 한국 인구만
SELECT * from city where countrycode = 'kor';

-- 미국 인구만
SELECT * from city where countrycode = 'usa'; 

-- 한국 인구중 1,000,000만 
SELECT * from city where countrycode = 'kor' and  population >=1000000;



-- 데이터가 숫자로 구성도어 있어 연속적인 값은 Between ... AND 사용 가능

SELECT * from city where Population BETWEEN  7000000 and 8000000;

-- 이산적인( 연속성이 전혀 없는 분리된 상태 ) 값의 조건에서는 in() 사용가능
SELECT * from city WHERE name IN('seoul', 'tokyo', 'moscow');

-- 과제 
-- 한미일 국가 도시 검색 

SELECT * from city  where CountryCode in('kor', 'jpn', 'usa');

-- 한미일 도시 중 인구 2,000,000 에서 8,000,000 인 도시 검색 
SELECT * from city  where CountryCode in('kor', 'jpn', 'usa') and Population BETWEEN 2000000 and 8000000;


-- 요구하는 데이터를 가져오는 구분 SELECT 
show databases;
use world;


-- 문자열의 내용 검색하기 위해 Like 연산자 사용 
-- 문자 뒤에 %-에 무엇이든 (%) 허용 
-- 한 글자와 매치하기 위해서는 '_'사용 
SELECT * from city where CountryCode like 'Ko%'

SELECT * from city where CountryCode like 'Ko_'

-- 중요 [Sub Query] 
-- 쿼리문 안에 또 퀄리문이 들어 있는것 
-- 서브쿼리의 결과가 둘 이상이 되면 에러 발생

SELECT * from city WHERE CountryCode  =(  SELECT CountryCode from city WHERE name = 'new york');

-- [ANY] 
-- 서브쿼리의 여러개의 결과 중 한가지만 만족해도 가능 
-- SOME은 ANY와 동일한 의미로 사용
-- ANY구문은 IN과 동일한 의미 

SELECT * from city where Population > ANY ( SELECT Population from city WHERE District = 'new york');

-- [ALL]
-- 서브쿼리의 여러 개의 결과를 모두 만족 시켜야 함

SELECT  * FROM city WHERE Population > all (SELECT Population from city WHERE District = 'new york');

-- [ORDER BY No.1]
-- 결과문에 대해 영향을 미치지는 않음
-- 결과가 출력되는 순서를 조절하는 구문
-- 기본적으로는 오름차순(ASC)이다. 
-- 내림차순 (DESC) 

select * from city order by Population desc;
select * from city order by Population;

-- [ORDER BY No.2]
-- 혼합해 사용하는 구문
SELECT * from city order by CountryCode asc, Population desc;

-- [과제]
-- 한국에는 도시 인구수 내림차순으로 출력 
select * from city where CountryCode ='kor' order by Population desc;

-- 국가면적 크기로 내림차순 
SELECT * from country order by SurfaceArea desc;

-- [DISTINCT]
-- 중복된 것은 1개씩만 보여주면서 출력 
-- 데이블의 크기가 클수록 효율적

SELECT DISTINCT  countryCode from city;


-- [LIMIT]
-- 출력 개수를 제한 
-- 일부를 보기 위해 여러 건의 데이터를 출력
-- 상위 N개만 출력하는 'LIMIT N' 구문을 사용

SELECT * from city order by population desc limit 10;

-- [Group BY]
-- 그룹으로 묶어주는 역할
-- 집계함수를 함께 사용
-- AVG() : 평균 
-- MIN() : 최소값
-- MAX() : 최대값 
-- Count() : 행의 개수
-- count(distinct) : 중복제외된 행의 갯수
-- sidev() : 표준편차
-- VARIANCE() : 분산

SELECT countrycode, max(population) from city group by CountryCode;

-- [과제]
-- 전체 도시는 ? 
SELECT count(*) from city;

-- 전체 도시들의 평균 인구수는 ??
SELECT avg(population) from city;

-- [HAVING] 
-- WHERE과 비슷한 개념으로 조건 제한 
-- 집계함수에 대해서 조건제한 하는 편리한 개념 
-- HAVING절은 반드시 GROUP BY절 다음에 나와야 함 

SELECT countrycode, max(population) 'max population' from city group by CountryCode having max(Population) > 8000000;

-- [rollup]
-- 총합 또는 중간합계가 필요한 경우 사용
-- group by절과 함께 with rollup문 사용 

SELECT countrycode, name, sum(population) from city group by CountryCode, name with ROLLUP;

-- [join]
-- 데이터베이스 내의 여러 데이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과 집합으로 표현 

select * from city join country on city.CountryCode = country.code;


-- [과제]
-- city, country, countrylanguage 테이블3개를 join

select * from city join country on city.CountryCode = country.code join countrylanguage on city.CountryCode  = countrylanguage.CountryCode;









 