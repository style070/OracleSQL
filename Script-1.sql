-- Single line comment
/*
 * Multi line commnet
 */

-- EMPLOYEES 테이블에서 모든 컬럼들의 모든 데이터를 조회
SELECT * 
  FROM EMPLOYEES
;

-- EMPLOYEES 테이블에서 EMPLOYEE_ID의 모든 데이터를 조회
SELECT EMPLOYEE_ID
  FROM EMPLOYEES 
;

--EMPLOYEES 테이블에서 EMPLOYEE_ID, FIRST_NAME 의 모든 데이터를 조회
SELECT EMPLOYEE_ID
     , FIRST_NAME
  FROM EMPLOYEES 
;

--DEPARTMENTS 테이블에서 DEPARTMENT_NAME, LOCATION_ID의 모든 데이터를 조회
SELECT DEPARTMENT_NAME
     , LOCATION_ID
  FROM DEPARTMENTS 
;

-- LOCATIONS테이블에서 모든 컬럼들의 모든 데이터를 조회
SELECT *
  FROM LOCATIONS
;

-- EMPLOYEES테이블에서 모든 데이터를 LAST_NAME을 기준으로 오름차순 조회(ORDER_BY)
-- PRIMARY KEY를 기준으로 오름차순 된 상태로 조회됨.
  SELECT *
    FROM EMPLOYEES 
;    
-- LAST NAME으로 오름차순 조회    
  SELECT *
    FROM EMPLOYEES 
-- 이 때, ORDER BY는 SELECT 조회문의 가장 아래쪽에 위치해야 함
ORDER BY LAST_NAME -- <- 오름차순 정렬
;  
   SELECT *
     FROM EMPLOYEES 
     ORDER BY LAST_NAME ASC -- <- 오름차순 정렬(명시해준것)
;
/*
 * ASC 혹은 생략 : 오름차순
 * DESC : 내림차순
 */
-- EMPLOYEES테이블에서 모든 데이터를 LAST_NAME을 기준으로 내림차순 조회(ORDER_BY)
   SELECT *
     FROM EMPLOYEES 
    ORDER BY LAST_NAME DESC
;


--정렬할때 주의할점 : ORDER_BY명령은 CPU를 매우많이 사용하는 키워드임 -> 실무에서는 가급적 안쓰려고 함

-- 2차정렬 : EMPLOYEES테이블에서 LAST_NAME으로 내림차순 정렬을하고 FIRST_NAME으로오름차순 정렬을 해서 모든 데이터를 조회
SELECT *
  FROM EMPLOYEES
 ORDER BY LAST_NAME DESC
     , FIRST_NAME ASC
  ;
 
-- EMPLOYEES테이블에서 SALARY(연봉)로 오름차순 정렬을하고
-- FIRST_NAME으로 내림차순 한 뒤, HIRE_DATE로 오름차순 정렬하여 모든데이터 조회
SELECT *
  FROM EMPLOYEES 
  --  ORDER BY 는 SELECT 문장의 가장 마지막에 위치해야함!
 ORDER BY SALARY ASC
     , FIRST_NAME DESC
     , HIRE_DATE ASC


-- EMPLOYEES테이블에서 EMPLOYEE_ID가 101인 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 101
  ;

-- EMPLOYEES테이블에서 FIRST_NAME이 "Neena"인 정보를 조회
 SELECT *
   FROM EMPLOYEES 
  WHERE FIRST_NAME = 'Neena'
 ;

-- EMPLOYEES테이블에서 SALARY의 값의 6000보다 큰 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE SALARY > 6000
;

--EMPLOYEES테이블에서 COMMISSION_PCT(인센티브)를 0.2보다 크거나 같은 정보를
-- SALARY로 내림차순 정렬해서 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT >= 0.2
 ORDER BY SALARY DESC 
 ;

-- EMPLOYEES테이블에서 COMMISSION_PCT(인센티브)를 0.2보다 크거나 같은 정보를 SALARY로 내림차순 정렬해서 
-- EMPLOYEE_ID, FIRST_NAME, EMAIL, SALARY, COMMISSION_PCT 만 조회
SELECT EMPLOYEE_ID
    , FIRST_NAME
    , EMAIL
    , SALARY
    , COMMISSION_PCT
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT >= 0.2
 ORDER BY SALARY DESC 
;

-- DEPARTMENTS(부서정보)테이블에서 LOCATION_ID가 1700인 부서의
-- DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID를 
-- DEPARTMENT_NAME으로 내림차순 정렬해서 조회
SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , LOCATION_ID
  FROM DEPARTMENTS
 WHERE LOCATION_ID = 1700
 ORDER BY DEPARTMENT_NAME DESC
  ;

-- DEPARTMENTS테이블에서 LOCATION_ID가 1500~2000 사이에 있는 모든 정보를 조회
 SELECT *
   FROM DEPARTMENTS
  WHERE LOCATION_ID BETWEEN 1500 AND 2000
  ;
 
 --DEPARTMENTS테이블에서 MANAGER_ID(부서장 사원의 번호)가 없는것만 조회
SELECT *
  FROM DEPARTMENTS 
 WHERE MANAGER_ID IS NULL --MANAGER_ID != NULL로 하면 안됨!! -> != 은 같지않다 라는 뜻
 ;
 --MANAGER_ID가 있는것만 조회
 SELECT *
   FROM DEPARTMENTS 
  WHERE MANAGER_ID IS NOT NULL
 ;
 
 --EMPLOYEES 테이블에서 DEPARTMENT_ID(근무중인 부서번호)가 90 OR 30 OR 60 OR 100인 모든정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IN (90, 30, 60, 100) -- IN에 넣을수있는 비교값은 1000개까지만 사용가능함
;

-- EMPLOYEES 테이블에서 JOB_ID(직무ID) 가 IT_PROG이거나 AD_VP이거나 FI_ACCOUNT인
-- EMPLOYEE_ID, JOB_ID, SALARY를 조회
SELECT EMPLOYEE_ID
     , JOB_ID
     , SALARY
  FROM EMPLOYEES 
 WHERE JOB_ID IN ('IT_PROG', 'AD_VP', 'FI_ACCOUNT')
 ;
 
-- EMPLOYEES 테이블에서 JOB_ID(직무ID) 가 IT_PROG이 아니고 AD_VP도 아니고 FI_ACCOUNT도 아닌
-- EMPLOYEE_ID, JOB_ID, SALARY를 조회
 SELECT EMPLOYEE_ID
     , JOB_ID
     , SALARY
  FROM EMPLOYEES 
 WHERE JOB_ID NOT IN ('IT_PROG', 'AD_VP', 'FI_ACCOUNT')
 ;
 
-- LIKE (자리수 체크) -> 문자열 검색만 허용(숫자는 불가능함)
-- WILD CARD : 1) "_" : 아무 글자 하나, "__" : 아무 글자 2개
--             2) % : 포함되어있음
-- ex) "A%" : A로 시작하는것 / "%A" : A로 끝나는것 / "%A%" :A가 포함되어있는것
-- EMPLOYEES 테이블에서 FIRST_NAME이 5글자인 모든 정보를 조회
SELECT * 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '_____' --> FIRST_NAME이 5글자
;
-- EMPLOYEES 테이블에서 FIRST_NAME이 6글자인 모든 정보를 조회
SELECT * 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '______' --> FIRST_NAME이 6글자
;
 -- EMPLOYEES 테이블에서 FIRST_NAME이 5글자가 아닌 모든 정보를 조회
SELECT * 
  FROM EMPLOYEES 
 WHERE FIRST_NAME NOT LIKE '_____' 
;
 
-- EMPLOYEES 테이블에서 EMAIL이 S로 시작하는 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL LIKE 'S%'
;
-- EMPLOYEES 테이블에서 EMAIL이 S로 시작하지 않는 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL NOT LIKE 'S%'
;
--EMPLOYEES에서 EMAIL이 'T'로 끝나는 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL LIKE '%T'
;
--EMPLOYEES에서 EMAIL이 'T'로 끝나지 않는 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL NOT LIKE '%T'
;
 --EMPLOYEES에서 EMAIL이 'W'가 포함된 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL LIKE '%W%'
;
 --EMPLOYEES에서 EMAIL이 'W'가 포함되지 않은 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL NOT LIKE '%W%'
;
 
--EMPLOYEES테이블에서 PHONE_NUMBER가 '2'로 끝나고, 
--SALARY가 5000 이상이며, 
-- JOB_ID 가 'SA_REP'인 '모든 정보를 조회(=SELECCT *)'한다
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '%2'
   AND SALARY >= 5000
   AND JOB_ID = 'SA_REP'
;
 
-- EMPLOYEES 테이블에서 FIRST_NAME이 6자리이고, 
-- JOB_ID가 'AD_PRES'이거나, 'IT_PROG'인 모든정보를 조회
--1) IN을 이용한 방법
SELECT *
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '______'
   AND JOB_ID IN ('AD_PRES', 'IT_PROG')
;

--2) AND 와 OR을 이용한 방법
SELECT *
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '______'
   AND (JOB_ID = 'AD_PRES'
     OR JOB_ID = 'IT_PROG')
;
 
 
-- EMPLOYEES테이블에서 MANAGER_ID 가 NULL이 아니고,
-- COMMISSION_PCT는 NULL이고
-- EMPLOYEE_ID는 200미만이면서
-- EMAIL이 'S' 혹은 'D' 로 시작하는 모든 정보를 조회
SELECT *
  FROM EMPLOYEES 
 WHERE MANAGER_ID IS NOT NULL
   AND COMMISSION_PCT IS NULL 
   AND EMPLOYEE_ID < 200
   AND (EMAIL LIKE 'S%' 
    OR EMAIL LIKE 'D%')
;
 

-- JDBC 연동

SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , EMAIL
     , PHONE_NUMBER
     , HIRE_DATE
     , JOB_ID
     , SALARY
     , COMMISSION_PCT
     , MANAGER_ID
     , DEPARTMENT_ID
  FROM EMPLOYEES 
;
 


-- 사원정보 테이블에서 이름과 성, 연봉, 이메일을 조회한다.
SELECT FIRST_NAME 
,LAST_NAME 
,SALARY 
,EMAIL 
FROM EMPLOYEES ;


-- 지역정보 테이블에서 도시명이 "Seattle"인 지역의 주소와 우편번호를 조회.
SELECT STREET_ADDRESS ,POSTAL_CODE 
FROM LOCATIONS
WHERE CITY ='Seattle';
 

-- 모든 사원들의 연봉 총합, 최대 연봉 , 최소 연봉 , 평균 연봉 , 사원의 수를 조회
SELECT SUM(SALARY)
		,MAX(SALARY)
		,MIN(SALARY)
		,AVG(SALARY)
		,COUNT(EMPLOYEE_ID) -- COUNT 함수의 파라미터는 PK를 쓰는것이 원칙
		,MAX(HIRE_DATE) -- 가장 최근의 입사일자
		,MIN(HIRE_DATE) -- 가장 과거의 입사일자
FROM EMPLOYEES;


-- 2007년에 입사한 사원의 수와 평균 연봉을 조회.
-- 문자 -> 날짜 변경

SELECT '2007-01-01' -- 날짜 형태의 문자
	,TO_DATE('2007-01-01','YYYY-MM-DD')
FROM DUAL; -- DUAL ( Dummy 테이블 : 날짜 , 시퀀셜할 번호등을 조회)

SELECT COUNT(EMPLOYEE_ID)
	,AVG(SALARY) 
FROM EMPLOYEES
WHERE HIRE_DATE >=TO_DATE('2007-01-01','YYYY-MM-DD')
AND HIRE_DATE <=TO_DATE('2007-12-31','YYYY-MM-DD');

-- GROUP BY 이용.
-- 부서별 부서번호 연봉의 합계, 최대 연봉, 가장 늦게 입사한 날짜, 가장 일찍 입사한 날짜, 사원의 수 조회.
-- 일반함수와 , 그룹함수를 사용할때는 반드시 GROUP BY를 사용해 주어야한다.
-- SELECT , FROM , WHERE , GROUP BY , OREDER BY 순으로
SELECT DEPARTMENT_ID   --ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
	, SUM(SALARY)
	,MAX(SALARY)
	,MAX(HIRE_DATE)
	,MIN(HIRE_DATE)
	,COUNT(EMPLOYEE_ID) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;


-- "~뼐"은 무조건 GROUP BY
-- 사원 정보에서 "직무 아이디" 별 '사원ㅇ의 수"와 "직무 아이디"를 조회한다.
SELECT COUNT(EMPLOYEE_ID) , JOB_ID  
FROM EMPLOYEES
GROUP BY JOB_ID ;


-- 사원 정보에서 "성"이 같은 사원들의 "수"와 "성"을 조회한다.
SELECT COUNT(EMPLOYEE_ID) , LAST_NAME 
FROM EMPLOYEES
GROUP BY LAST_NAME ;

-- 2004년에 입사한 사원들 중
-- 부서 번호별 사원들의 수와 평균 연봉, 연봉의 총합, 부서번호를 조회한다.
SELECT COUNT(EMPLOYEE_ID) 
	, AVG(SALARY)
	,SUM(SALARY)
	,DEPARTMENT_ID 
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2004-01-01','YYYY-MM-DD') 
AND HIRE_DATE <= TO_DATE('2004-12-31','YYYY-MM-DD')
GROUP BY DEPARTMENT_ID ;

-- 사원 정보에서 동일한 "성"을 두 명 이상이 있는 사원들만 조회한다.
-- "성"별 사원의 수 "성"
SELECT LAST_NAME , COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY LAST_NAME 
HAVING COUNT(EMPLOYEE_ID) > 1;

-- 사원정보에서 직무 아이디별 사원의 수와 직무 아이디를 조회하는데
-- 사원의 수가 3명이상인 정보만 조회한다.

SELECT  COUNT(EMPLOYEE_ID) 
		, JOB_ID  
FROM EMPLOYEES
GROUP BY JOB_ID 
HAVING COUNT(EMPLOYEE_ID) > 2;

-- SUB Query 

-- Q1. 부서명 "IT" 부서에서 근무중인 사원들의 정보를 조회 (IT부서의 부서번호를 모르는 상황)
-- A1. IT 부서의 부서번호를 찾는다. ==> 60
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT'

-- A2. 60번 부서에서 일을 하는 사원들의 정보를 조회한다.
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- SUB QUERY 이용
-- * SUB QUERY를 먼저 작성 (우리가 알기 위해 필요한 코드를 먼저 작성)


SELECT *
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID = (SELECT DEPARTMENT_ID
									FROM DEPARTMENTS d
									WHERE d.DEPARTMENT_NAME = 'IT');
							
 -- Q2 . 지역번호가 1700인 부서에서 근무중인 사원들의 모든 정보를 조회. (지역번호가 1700인 부서의 번호를 모르는 상황)
 -- SUB Query에서 Return 되는 값이 2개 이상일 경우 포함되는 정보를 출력해야하기 때문에  = 이 아닌 IN을 사용한다.
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS 
						WHERE LOCATION_ID = 1700);
								


-- Q3. 145번 사원이 부서장인 부서에서 근무중인 사원들의 모든 정보를 조회하는데
-- 결과에서 145번 사원은 제외시킨다.
SELECT *
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS 
						WHERE MANAGER_ID =145)		
AND e.EMPLOYEE_ID != 145;


-- 직무명이 "Marketing Manager"인 사원의 모든 정보를 조회한다.
-- 직무명 : 직무정보 ( JOBS )
-- 사원의 모든 정보 : 사원 정보 ( EMPLOYEES )
-- 알아야 할 정보
-- 직무명 : "Marketing Manager"인 직무의 아이디 (MK_MAN)
-- 알고싶은정보
-- 사원의 직무아이디가 'MK_MAN'인 사원의 모든 정보

SELECT *
FROM EMPLOYEES e
WHERE e.JOB_ID = (SELECT JOB_ID 
							FROM JOBS j
							WHERE JOB_TITLE = 'Marketing Manager'
);

-- 도서명이 "Seattle"인 지역에 존재하는 부서의 모든 정보를 조회한다.
-- 알아야 할 정보
-- 알고 싶은 정보

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENTS.LOCATION_ID = (SELECT LOCATION_ID 
									FROM LOCATIONS
									WHERE CITY = 'Seattle');

						
-- 대륙명이 "Ameriacas"인 국가 정보를 모두 조회한다.
-- 알아야 할 정보
-- 알고싶은 정보
-- 테이블간의 연결은 항상 PK -- FK로 한다.

								
SELECT *
FROM COUNTRIES
WHERE REGION_ID  = (SELECT REGION_ID 
FROM REGIONS 
WHERE REGION_NAME = 'Americas');
								

-- 도시명이 "Seattle"인 지역에서 근무중인 모든 사원들의 정보를 조회한다.

-- 알아야할 정보 1 : 도시명이 " Seattle"인 지역의 지역번호 (1700)
SELECT LOCATION_ID 
FROM LOCATIONS
WHERE CITY = 'Seattle';

-- 알아야할 정보 2 : 알아야 할 정보 2 : 지역번호가 1700인 부서번호 ( 10,30,90,100,110,120,130,140,150 , .... )
SELECT DEPARTMENT_ID 
FROM DEPARTMENTS d 
WHERE d.LOCATION_ID = (SELECT LOCATION_ID 
FROM LOCATIONS
WHERE CITY = 'Seattle');

SELECT *
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
							FROM DEPARTMENTS d 
							WHERE d.LOCATION_ID = (SELECT LOCATION_ID 
													FROM LOCATIONS
													WHERE CITY = 'Seattle'));



-- 대륙명이 'Eurpoe'인 국가에서 근무하는 모든 사원들의 정보를 조회
-- 알아야할 정보 : 
-- 알고싶은 정보 : 
												
--SELECT *
--FROM EMPLOYEES e 
--WHERE e.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
--							FROM DEPARTMENTS d 
--							WHERE d.LOCATION_ID IN (SELECT COUNTRY_ID 
--													FROM COUNTRIES c 
--WHERE c.REGION_ID = (SELECT REGION_ID 
--FROM REGIONS r 
--WHERE REGION_NAME = 'Europe')));
						
SELECT *
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS d 
						WHERE LOCATION_ID IN (SELECT LOCATION_ID  
												FROM LOCATIONS l  
												WHERE COUNTRY_ID IN (SELECT COUNTRY_ID 
																	FROM COUNTRIES c 
																	WHERE c.REGION_ID = (SELECT REGION_ID 
																						FROM REGIONS r 
																						WHERE REGION_NAME = 'Europe'))));
												
												
												


-- INNER JOIN
-- 문법
SELECT A.*
	  ,B.*
FROM TABLE A
INNER JOIN TABLE B
ON A.PK = B.FK;

-- EMPLOYEES와 DEPARTMENTS의 모든 정보를 조회
SELECT *
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID  = E.DEPARTMENT_ID; 

-- 사람들이 근무하는 부서의 이름과 지역의 도시명,사원들의 이름을 조회한다.
SELECT E.DEPARTMENT_ID ,D.DEPARTMENT_ID ,L.*
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
INNER JOIN LOCATIONS L
ON L.LOCATION_ID = D.LOCATION_ID ;

-- 103번 사원의 이름과 연봉, 사원번호,부서의 이름, 도시명을 조회한다.
-- SUB QUERY는 여러 테이블 정보를 처리할 수 없기 때문에 이러한 무제는 JOIN으로 

SELECT E.FIRST_NAME , E.SALARY,E.EMPLOYEE_ID ,D.DEPARTMENT_NAME , L.CITY 
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID 
WHERE E.EMPLOYEE_ID = 103;

-- JOIN을 표현하는 여러가지단어
--> JOIN
--> EQUIP JOIN
--> NATURE JOIN
--> INNER JOIN

-- 사원번호가 150번 이하인 사원들의 이름과 성,연봉 , 직무아이디,직무명을 조회 한다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME  , E.LAST_NAME , E.SALARY  , J.JOB_ID , J.JOB_TITLE 
FROM EMPLOYEES E
INNER JOIN JOBS J 
ON  E.JOB_ID = J.JOB_ID 
WHERE E.EMPLOYEE_ID < 150;

-- 부서번호, 부서명 , 부서장의 사원번호 , 부서장의 이름 , 부서장의 성 , 부서장의 직무명을 조회
SELECT E.DEPARTMENT_ID , D.DEPARTMENT_NAME ,D.MANAGER_ID ,E.FIRST_NAME ,E.LAST_NAME ,J.JOB_TITLE 
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.EMPLOYEE_ID = D.MANAGER_ID 
INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID 
WHERE E.EMPLOYEE_ID  = D.MANAGER_ID ;

-- 대륙명, 국가명 , 지역의 도시명을 조회한다.
SELECT R.REGION_NAME ,C.COUNTRY_NAME ,C.COUNTRY_NAME 
FROM COUNTRIES C
INNER JOIN REGIONS R
ON C.REGION_ID = R.REGION_ID 
INNER JOIN LOCATIONS L
ON C.COUNTRY_ID = L.COUNTRY_ID ;

-- 사원의 모든 정보와 사원이 근무중인 부서의 이름, 부서가 있는 지역의 도시명, 도시가 있는 국가명 , 국가가 있는 대륙명 , 직무명을 조회한다.
SELECT E.* , D.DEPARTMENT_ID , L.CITY , C.COUNTRY_NAME ,R.REGION_NAME ,J.JOB_TITLE 
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
INNER JOIN LOCATIONS L
ON  D.LOCATION_ID = L.LOCATION_ID 
INNER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID 
INNER JOIN REGIONS R
ON C.REGION_ID =R.REGION_ID 
INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID 
ORDER BY E.EMPLOYEE_ID ASC ;

-- EMPLOYEE 테이블 조회시 107건이 조회되지만
-- DEPARTMENT와 조회시 106건이 조회됨
-- WHY? DEPARTMENT 와 조인시 DEPARTMENT_ID가 NULL인 데이터가 1건 있기 떄문에
-- INNER JOIN에는 PK = FK 관계에서 NULL 데이터는 1건 제외된다.
SELECT *
FROM EMPLOYEES e ;

--- 과거에 직무가 변경된 적이 있는 사원들의 모든 정보를 조회
-- 사원들의 모든 정보만 조회. -- JOIN X
--					   SUBQuery O
SELECT *
FROM EMPLOYEES e 
WHERE e.EMPLOYEE_ID IN (SELECT EMPLOYEE_ID
						FROM JOB_HISTORY jh);
					
-- 직무가 변경된 적이 있는 사원의 과거 직무명과 현재 직무명을 조회.
		

SELECT PAST_J.JOB_TITLE 
,JH.START_DATE 
,JH.END_DATE 
,NOW_J.JOB_TITLE
,E.EMPLOYEE_ID 
FROM EMPLOYEES E
INNER JOIN JOBS NOW_J
ON NOW_J.JOB_ID = E.JOB_ID 
INNER JOIN JOB_HISTORY JH
ON E.EMPLOYEE_ID =JH.EMPLOYEE_ID 
INNER JOIN JOBS PAST_J
ON PAST_J.JOB_ID =JH.JOB_ID ;


-- 183번 사원 이름과 상사 정보를 조회한다.
-- 프로젝트에서 자기자신 테이블을 참조하는 Query는 무조건 하나이상 존재한다.
-- ex) 대분류 중분류 소분류 카테고리
SELECT E.FIRST_NAME
,M.*
FROM EMPLOYEES E -- 사원정보
INNER JOIN EMPLOYEES M -- 상사정보
ON E.MANAGER_ID = M.EMPLOYEE_ID 
WHERE E.EMPLOYEE_ID = 183;





-- LEFT OUTER JOIN
-- 모든 사람들의 이름, 성 , 부서명을 조회한다. 만약 부서에 속해있지 않는 사람이라면 NULL로 표기한다.
-- 예상되는 건 수 : 107건

SELECT *
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID ;

SELECT *
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID ;

-- 근무하는 사원이 없는 부서의 정보를 LEFT OUTER JOIN으로 조회한다.
SELECT *
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
WHERE E.EMPLOYEE_ID IS NULL;

-- 부서가 존재하지 않는 도시의 이름을 LEFT OUTER JOIN으로 조회한다.
SELECT L.CITY
FROM LOCATIONS L
LEFT OUTER JOIN DEPARTMENTS D
ON L.LOCATION_ID =D.LOCATION_ID 
WHERE D.DEPARTMENT_ID IS NULL;

-- Q1. 대륙에 존재하는 국가를 모두 조회한다. 국가가 없을 경우 NULL로 표기한다.
-- 		(대륙명과 국가명을 조회.)
-- Result : 국가가 없는 대륙이 존재하지 않음
SELECT R.REGION_NAME , C.COUNTRY_NAME 
FROM  REGIONS R
LEFT OUTER JOIN COUNTRIES C
ON C.REGION_ID = R.REGION_ID ;

-- Q2. 대륙명별 국가의 수를 모두 조회한다. 국가가 없을 경우 0으로 표기한다.
SELECT REGION_NAME,COUNT(COUNTRY_ID)
FROM REGIONS R
LEFT OUTER JOIN COUNTRIES C
ON  C.REGION_ID  = R.REGION_ID 
GROUP BY REGION_NAME ;


-- Q3. 직무명별 사원의 수를 모두 조회한다. 사원의 수가 없을 경우 0으로 표기한다.
SELECT JOB_TITLE, COUNT(EMPLOYEE_ID)
FROM JOBS J
LEFT OUTER JOIN EMPLOYEES E
ON J.JOB_ID =E.JOB_ID 
GROUP BY JOB_TITLE;

-- Q4. 직무별명 사원의 수를 모두 조회한다. 단 , 사원의 수가 2명 이상인 경우만 조회한다.

SELECT JOB_TITLE, COUNT(EMPLOYEE_ID)
FROM JOBS J
LEFT OUTER JOIN EMPLOYEES E
ON J.JOB_ID =E.JOB_ID 
GROUP BY JOB_TITLE
HAVING COUNT(EMPLOYEE_ID)>1 ;



-- Q5. 근무하는 사원이 단 한명도 없는 도시를 조회한다. ( LEFT OUTER JOIN )
SELECT L.CITY 
FROM LOCATIONS L
LEFT OUTER JOIN DEPARTMENTS D 
ON L.LOCATION_ID =D.LOCATION_ID 
LEFT OUTER JOIN EMPLOYEES E  
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID  IS NULL
AND E.EMPLOYEE_ID IS NULL;

-- INLINE VIEW

/*
 * SELECT COLUMN ...
FROM (SELECT *
		FROM TABLE) A
INNER JOIN (SELECT *
			FROM TABLE) B
WHERE ...

 */

			
-- 사원의 정보를 INLINE VIEW를 이용해 조회한다.
SELECT *
FROM ( -- INLINE VIEW로 이용할 SELECT문장을 먼저 작성
		SELECT EMPLOYEE_ID
		,FIRST_NAME
		,LAST_NAME
		,SALARY
			FROM EMPLOYEES)TEMP_E;
		

-- EMPLOYEES 테이블에서 ROW 3개만 조회한다.
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID <= 102;

-- Oracle DB 한정 사용 명령어 ROWNUM
SELECT *
FROM EMPLOYEES
WHERE ROWNUM <= 3;

-- EMPLOYEES 테이블에서 연봉을 가장 많이 받는 사원 3명만 조회한다.
SELECT *
FROM EMPLOYEES e 
WHERE ROWNUM <=3
ORDER BY SALARY DESC;

-- EMPLOYEES 테이블에서 연봉을 가장 적게 받는 사원 3명만 조회한다.
-- Reulst가 Order By로 실행되지 않음
-- WHY? SELECT FROM WHERE를 먼저 실행하고 Order By가 가장 마지막에 실행하기 때문에
SELECT *
FROM EMPLOYEES e 
WHERE ROWNUM <=3
ORDER BY SALARY ASC;


-- INLINE VIEW 이용해서 풀기
-- 1. EMPLOYEES 테이블에서 연봉을 기준으로 오름차순 정렬한다.
-- EMPLOYEES 테이블에서 연봉을 가장 많이 받는 사원 3명만 조회한다.
SELECT *
FROM (SELECT *
		FROM EMPLOYEES
		ORDER BY SALARY DESC) ORDERED_EMPLOYEES
WHERE ROWNUM<=3;

-- 2. EMPLOYEES 테이블에서 연봉을 기준으로 내림차순 정렬한다.
-- EMPLOYEES 테이블에서 연봉을 가장 적게 받는 사원 3명만 조회한다.
-- INLINE VIEW를 통하여 FROM절의 INLINE VIEW를 먼저 수행하고 WHERE을 통해 INLINE VIEW의 결과에서 3개를 추출 하므로 
-- INLINE VIEW ( SELECT -> FROM -> ORDER BY -> WHERE) 순으로 적용되어 정렬이 가능하다.
SELECT *
FROM (SELECT *
		FROM EMPLOYEES
		ORDER BY SALARY ASC) ORDERED_EMPLOYYES
WHERE ROWNUM<=3;

-- 가장 많은사원이 근무중인 부서의 모든 정보를 조회한다.
-- 부서별 사원의 수 ( 부서에 사원이 존재하지 않는다면 0으로 조회한다)

-- (코드정리)

-- 연봉의 총 합이 가장 높은 부서의 모든 정보를 조회한다.
-- 부서별 연봉 총합.
SELECT D.DEPARTMENT_ID , SUM(E.SALARY) AS SUM_SALARY
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
GROUP BY D.DEPARTMENT_ID ;
-- 연봉 총합으로 내림차순 정렬
SELECT D.DEPARTMENT_ID , SUM(E.SALARY) AS SUM_SALARY
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
-- WHERE E.EMPLOYEE_ID IS NOT NULL
GROUP BY D.DEPARTMENT_ID 
ORDER BY SUM_SALARY DESC;
 
-- 정렬된 데이터에서 1개만 조회.
-- 부서의 정보를 알기위해 JOIN 해야함.





