show tables;

show databases;

select * from category ;
insert into category values(no, '소설');
insert into category values(no, '시/에세이');
select * from category ;

select * from book;
insert into book values(no, '하얼빈', 14400, 1);
insert into book values(no, '사랑은 그렇게 하는 것이 아니다', 14850, 2);
select * from book;

select * from member;
insert into member values(no, '가나다', '01011111111', 'a@gmail.com','1234');
insert into member values(no, '라마바', '01022222222', 'b@gmail.com','1234');
select * from member;

select * from order_book;