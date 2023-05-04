# MYSQL 쿼리 정리

## 1일차 

### 현재 서버에 어떤 DB가 있는지 보기

``` sql 
show DATABASES;
```

![1](https://user-images.githubusercontent.com/60457431/236145038-1384b185-d531-4654-b2bc-e25dc7060c91.png)


### 사용할 데이터베이스 지정

``` sql
use world;
``` 

![2](https://user-images.githubusercontent.com/60457431/236145263-f4e79613-5915-404f-8fd7-eb5e2258a17b.png)


### 데이터베이스 테이블 이름 보기

``` sql 
show tables;
```

![3](https://user-images.githubusercontent.com/60457431/236145424-7a1bcaea-d920-4beb-95cf-3a8075d3abc0.png)


##  데이터베이스의 테이블 정보 조회

```sql
show table status;
```

![4](https://user-images.githubusercontent.com/60457431/236145582-e8425602-57ac-4e11-83c6-142850912557.png)

## 무슨 열이 있는지 확인 //속성 정보

``` sql
desc city;
```

![5](https://user-images.githubusercontent.com/60457431/236145865-d2b0c8ae-d29e-4241-a7e7-9ff7b80d9434.png)


-- country 테이블과 countrylanguage 정보보기

```  sql
desc country;

desc countrylanguage;
```

![6](https://user-images.githubusercontent.com/60457431/236145940-08350aa5-19d2-4203-b039-1ef0ad518244.png)

![7](https://user-images.githubusercontent.com/60457431/236145970-7d1329e2-f81a-4621-b04b-530c75cafaf7.png)

