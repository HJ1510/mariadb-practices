-- 식별관계
-- 다른 테이블에서 가져온 reference key를 본인의 pk로 씀
-- 비식별관계 => 대부분
-- 다른 테이블에서 가져온 reference key를 본인의 pk로 쓰지 않음(pk따로)

-- outer join 
desc dept;
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');
select * from dept;

desc emp ;
-- insert into emp values(null, '둘리', 1);
-- insert into emp values(null, '마이클', 2);
-- insert into emp values(null, '또치', 3);
-- insert into emp values(null, '길동', null);
select * from emp ;

select e.name as '이름', d.name as '부서'
from emp e join dept d on e.dept_no =d.no ;

-- left join 
select e.name as '이름', ifnull(d.name, '없음') as '부서'
from emp e left join dept d on e.dept_no =d.no ;

-- right join
select ifnull(e.name, '사원없음') as '이름', d.name as '부서'
from emp e right join dept d on e.dept_no =d.no ;
