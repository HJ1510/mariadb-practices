create table member(
	no int(11) not null auto_increment,
	email varchar(100) not null,
	password varchar(64) not null,
	name varchar(100) not null,
	department varchar(100),
	primary key(no)
);
desc member;

alter table member add column juminbunho char(13) not null;
desc member;

alter table member drop juminbunho;
desc member;

alter table member add column juminbunho char(13) not null after email;
desc member;

alter table member change department department varchar(200) not null;
desc member;

alter table member add self_intro text;
desc member;

alter table member drop juminbunho;
desc member;

-- insert 
insert 
	into member
	values (null, 'a@gmail.com', password('1234'),'이름', '개발팀', null); 
select * from member;

insert 
	into member(no, email, name, password, department)
	values (null, 'a@gmail.com','이름2', password('1234'), '개발팀'); 
select * from member;

-- update 
update member 
	set email='b@gmail.com', password=password('4321')
	where no =2;
select * from member;

-- delete 
delete
	from member
	where no=2;
select * from member;

-- 트랜잭션 transaction 업무 단위 하나의 기능을 구현하기 위해 여러 명령어가 묶여 있는 것
select @@autocommit;
set autocommit=0;

insert 
	into member(no, email, name, password, department)
	values (null, '5@gmail.com','이름5', password('1234'), '개발팀'); 
commit;
select * from member;




























