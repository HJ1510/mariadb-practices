-- 함수: 날짜 함수

-- curdate(), current_date
select curdate(), current_date;

-- curtime(), current_time
select curtime(), current_time;

-- now() vs sysdate()
select now(), sysdate() ;
select now(), sleep(2), now(); -- sleep(s) s초만큼 일시정지 now=>함수를 실행 시킬때 시간
select now(), sleep(2), sysdate(); -- sysdate=>함수가 실행될 때 시간

-- date_format()
-- 2022년 10월 13일 10:12:55
select date_format(now(),"%Y년 %m월 %d일 %h:%i:%s");
select date_format(now(),"%y-%c-%d");
select date_format(now(),'%d %b, \'%y %h:%i:%s');

-- period_diff
-- 포맷팅 YYMM / YYYYMM
-- 근무개월수
select first_name,
period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) as month
from employees
-- order by period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m'))
order by month;

-- date_add = adddate, date_sub = subdate
-- 날짜 date에 type(year, month, day)의 표현식을 더하거나 뺀다
-- 예제: 각 사원들의 근속년수가 5년이 되는 날은 언제인가요?
select first_name, hire_date, date_add(hire_date, interval 5 year) as '5년'
from employees;

-- cast
-- 칼럼마다 들어갈 데이터의 type을 지정(숫자/문자 등등)
-- type
-- 문자: varchar, char, text, CLOB(Character Large Object)
-- 정수: signed(unsigned), int(integer), medium int
-- 실수: float, double
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large Object)
select '12345'+10, cast('12345' as int)+10;
select date_format(cast('2022-10-10' as date), '%Y년 %m월 %d일');
select cast(cast(1-2 as unsigned) as int),
cast(cast(1-2 as unsigned) as signed),
cast(1-2 as unsigned);


