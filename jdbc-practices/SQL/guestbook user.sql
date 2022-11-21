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

desc board;

select * from board b ;

insert into board values(null, '안녕2', '헬로우~~', 0, now(), 1 , 1, 0, (select no from user where name='둘리'));

update board set user_no = 3 where title='그만';

select title , contents, user_no from board where no=3 ;

select a.no, a.title, a.contents, a.hit, date_format(a.reg_date, '%Y/%m/%d %H:%i:%s' ),a.group_no, a.order_no, a.depth , a.user_no, b.name 
from board a, user b 
where a.user_no =b.no 
order by no desc, group_no desc, order_no asc;
-- limit (page-1)*3,3
-- pstmt.setInt(1,(page-1)*3)

update board set hit=hit+1 where no=3;

select no, name, contents, date_format(reg_date, '%Y/%m/%d %H:%i:%s') from guestbook order by reg_date desc;

insert into board values(null, '안녕2', '헬로우~~', 0, now(), max(group_no)+1 , 1, 0, (select no from user where name='둘리'));

select no, name, contents, reg_date from guestbook order by reg_date desc;

select no, name, contents, reg_date as regDate from guestbook order by regDate asc;

insert into guestbook values(null, '둘리', '1234', '호이', now());
select last_insert_id();
