
-- 대소문자 구분 없음
select version(),VerSion(), CuRrent_dAte, current_date; -- 오라클에선 from 필요

-- 함수 및 수식
select sin(pi()/4), (4+1)*5;

select version(); select now(); -- 커맨드라인에서는 동시에 실행

select 
user()
,
current_date(); 

-- 테이블 삭제
drop table pet;

-- 테이블 만들기
create table pet(
name varchar(20),  -- 공간이 최대 20(공간활용, 처리가 상대적으로 느림)
owner varchar(20),
species varchar(20),
gender char(1),  -- 공간이 무조건 1(공간낭비, 처리가 상대적으로 빠름)
birth date,
death date);

-- 스키마 확인
desc pet;

-- 조회
select name, owner, species, gender, birth, death from pet;

-- 데이터 넣기 (생성, creat)
insert 
into pet
value ('먼지', '윤현정', 'dog', 'f', '2012-01-18', null);

-- 데이터 삭제 (삭제, delete)
delete 
from pet 
where name='먼지'; -- where절 없으면 데이터 전체가 삭제 됨

-- load data local file
load data local infile 'c:\\pet.txt' into table pet;

-- update(수정, update)
update petset death = null where death='0000-00-00';
-- update pet set death = null where name! = 'Bowser';

-- 조회1: where
-- 1990년 이후에 태어난 아이들은? (출력: 이름, 종, 생일)
select name , species, birth
from pet
where birth>="1990-01-01";

-- Gwen과 함께 사는 아이들은? (출력: 이름, 종, 집사)
select name, species, owner
from pet
where owner='Gwen';

-- null 다루기1 : 현재 살아있는 아이들은? (출력: 이름, 생일, 사망일)
select name, birth, death
from pet
where death is null; -- null은 '='을 쓸 수 없음 is로 해야..'

-- null 다루기1 : 사망한 아이들은? (출력: 이름, 생일, 사망일)
select name, birth, death
from pet
where death is not null; -- null은 '!='을 쓸 수 없음 is로 해야..'

-- like 검색1(패턴매칭): 이름이 b로 시작하는 아이들은? (출력: 이름)
select name
from pet
where name like 'b%'; -- % 글자수 제한 없음

-- like 검색2(패턴매칭): 이름이 b로 시작하는 아이들 중에 이름이 6자인 아이는? (출력: 이름)
select name
from pet
where name like 'b_____'; -- 언더바로 글자수 지정

-- 정렬 (order by)
-- 아이들을 어린 순으로 출력하세요 (이름, 생일)
select name, birth
from pet
order by birth desc; -- 내림차수(asc 기본값) 오름차순(desc)

-- 아이들을 나이가 많은 순으로 출력하세요 (이름, 생일)
select name, birth
from pet
order by birth asc; -- 내림차수(asc 기본값) 오름차순(desc)

-- 집계(통계) 함수
select count(*) from pet; -- count(*)은 가장 효율적으로 전체 데이터 통계를 집계하는 칼럼을 자동으로 선택, 따로 지정한 칼럼에 null이 있을 경우 null 데이터는 집계 제외
select count(death) from pet; -- == select count(*) from pet where death is not null;

-- select ~ from ~ where ~ order by ~












show databases;

show tables;