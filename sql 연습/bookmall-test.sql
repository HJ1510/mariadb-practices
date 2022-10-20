show tables;

show databases;

desc category ;

select no, name from category ;
insert into category values(no, '소설');
insert into category values(no, '시/에세이');
select * from category ;

select title, price, category_no  from book;
insert into book values(no, '하얼빈', 14400, 3);
insert into book values(no, '사랑은 그렇게 하는 것이 아니다', 14850, 4);
select * from book;

desc `member` ;

select b.`no` , b.title, b.price, c.name as category from category c , book b where c.`no` =b.category_no; 

select name , tel , email , password  from member;
insert into member values(no, '가나다', '01011111111', 'a@gmail.com','1234');
insert into member values(no, '라마바', '01022222222', 'b@gmail.com','1234');
select * from member;

select * from order_book;

delete from `member` where name='우재남';
delete from category where name='시/에세이';
delete from book where price=14850;

select * from cart;
desc cart;
select b.title , c.amount , b.price from cart c , book b, `member` m where c.book_no =b.`no` and m.`no` =c.member_no ;


select * from orders ;
delete from orders where address='서울시';
desc orders;
select o.orders_num , m.name ,m.email , o.payment , o.address from orders o , member m where o.member_no =m.`no` ;


