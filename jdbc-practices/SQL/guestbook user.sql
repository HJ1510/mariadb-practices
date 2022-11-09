desc guestbook;

insert into guestbook values(null, '둘리', '1234', '호이', now());
insert into guestbook values(null, '마이콜', '1234', '맛좋은라면', now());

select no, name, contents, date_format(reg_date, '%Y/%m/%d %H:%i:%s')  from guestbook order by reg_date desc ;

select * from guestbook;


desc user ;

select * from user ;

-- join
insert into user values(null,'둘리', 'dooly@gmail.com', '1234', 'male',now());

-- login
select no, name from user where email ='dooly@gmail.com' and password = '1234';

-- update 
select no from user where no=3;

update user set name='마이콜', password='1111', gender='male' where no=3;
update user set name='마이콜', gender='male' where no=3;


