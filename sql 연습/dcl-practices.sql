-- 데이터베이스 생성
create database webdb;

-- 데이터베이스 생성 확인
show databases;

-- db사용자 삭제
drop user'webdb'@'locahost';

-- db 사용자 생성
create user 'webdb'@'localhost' identified by 'webdb';

-- 권한 부여
grant all privileges on webdb.* to 'webdb'@'locahost';

-- 권한 정보 재로딩
flush privileges;