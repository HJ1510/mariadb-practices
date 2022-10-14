select *
from (select version())-- => 삽입된 select절이 하나의 테이블 취급받음(테이블의 이름 지정 필요)
where (select * from tbl2) = tbl1.no -- => 삽입된 select절이 연산자와 매치가 되어야함

-- subquery
-- 1) select 절에 위치
-- 2) from 절에 위치
select now() as a, sysdate() as b, 3+1 as c;
select s.a, s.b, s.c
from (select now() as a, sysdate() as b, 3+1 as c) s;
-- 3) where 절에 위치
-- 예제) 현재, Fai Bale이 근무하는 부서의 직원들의 사번, 이름을 출력하세요. 
select dept_no 
from dept_emp de , employees e 
where de.emp_no =e.emp_no
and concat(first_name,' ', last_name)='Fai bale'
and de.to_date ='9999-01-01'; 

select e.emp_no , e.first_name            -- => 두 개의 쿼리가 수행될때 시간차이가 존재
from dept_emp de , employees e 
where de.emp_no =e.emp_no 
and de.to_date ='9999-01-01'
and de.dept_no ='d004';

-- sol  => 동시간에 한번에 수행
select e.emp_no , e.first_name
from dept_emp de , employees e 
where de.emp_no =e.emp_no 
and de.to_date ='9999-01-01'
and de.dept_no = (select dept_no 
					from dept_emp de , employees e 
					where de.emp_no =e.emp_no
					and concat(first_name,' ', last_name)='Fai bale'
					and de.to_date ='9999-01-01');

-- 3-1) 단일행 연산자: =, !=, >, <, >=, <=
-- 실습문제1: 현재 전체사원의 평균 연봉보다 적은 급여를 받고 있는 사원의 이름, 급여를 출력하세요.
select avg(salary)
from salaries
where to_date ='9999-01-01'; -- 72012.2359

select e.first_name , s.salary 
from employees e , salaries s 
where e.emp_no =s.emp_no 
and s.to_date ='9999-01-01'
and s.salary < 72012.2359
order by s.salary desc;

select e.first_name , s.salary 
from employees e , salaries s 
where e.emp_no =s.emp_no 
and s.to_date ='9999-01-01'
and s.salary < (select avg(salary)
				from salaries
				where to_date ='9999-01-01')
order by s.salary desc;


-- 실습문제2: 현재 가장적은 직책별 평균 급여를 받고 있는 직책과 그 급여를 출력하세요
-- 1) 현재 가장 적은 직책별 평균 급여
-- 1-1) 직책별 평균급여
select t.title , avg(s.salary) as avg_salary
from titles t , salaries s 
where t.emp_no =s.emp_no
and t.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
group by t.title;
-- order by avg(s.salary)

-- 1-2) 가장 적은 직책별 평균급여
select min(a.avg_salary)
from (select t.title , avg(s.salary) as avg_salary
	from titles t , salaries s 
	where t.emp_no =s.emp_no
	and t.to_date ='9999-01-01'
	and s.to_date ='9999-01-01'
	group by t.title) a;

-- 2-1) subquery => 1-1 / 1-2 사용
select t.title , avg(s.salary) as avg_salary
from titles t , salaries s 
where t.emp_no =s.emp_no
and t.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
group by t.title
having avg_salary=(select min(a.avg_salary)
					from (select t.title , avg(s.salary) as avg_salary
							from titles t , salaries s 
							where t.emp_no =s.emp_no
							and t.to_date ='9999-01-01'
							and s.to_date ='9999-01-01'
							group by t.title) a);
-- 2-1) top-k => 정렬하는데 시간 필요
select t.title , avg(s.salary) as avg_salary
from titles t , salaries s 
where t.emp_no =s.emp_no
and t.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
group by t.title
order by avg(s.salary) asc
limit 0,1;
												
-- 3-2) 복수행 연산자: in, not in, any, all 
-- any 사용법
-- 1. =any : in과 동일
-- 2. >any , >=any : 최소값
-- 3. <any , <=any : 최대값
-- 4. <>any , !=any : not in과 동일
-- 
-- all 사용법
-- 1. =all : x
-- 2. >all , >=all : 최대값
-- 3. <all , <=all : 최소값
-- 4. <>all , !=all 

-- 예제) 현재 급여가 50000 이상인 직원의 이름과 급여를 출력하세요
-- join 활용
select e.first_name , s.salary 
from employees e, salaries s 
where e.emp_no =s.emp_no 
and s.to_date ='9999-01-01'
and s.salary >= 50000
order by s.salary ;  -- 정렬은 수행 시간이 좀 걸리는 편
-- subquery 활용 (in)
select e.first_name , s.salary 
from employees e , salaries s 
where e.emp_no =s.emp_no 
and s.to_date ='9999-01-01'
and (e.emp_no, s.salary) in (select emp_no , salary       -- in== =any
							 from salaries 
							 where to_date ='9999-01-01'
							 and salary >= 50000) 
order by s.salary; -- 정렬은 수행 시간이 좀 걸리는 편

select emp_no , salary 
from salaries 
where to_date ='9999-01-01'
and salary >= 50000;


select e.first_name , s.salary 
from employees e , salaries s 
where e.emp_no =s.emp_no 
and s.to_date ='9999-01-01'
and (e.emp_no, s.salary) =any (select emp_no , salary       -- in== =any
							 from salaries 
							 where to_date ='9999-01-01'
							 and salary >= 50000) ;


-- 예제) 현재 각 부서별로 최고 급여를 받는 직원의 이름, 근무부서이름, 급여를 출력하세요

-- sol1 where절에 subquery
select a.dept_no , max(b.salary)
from dept_emp a, salaries b
where a.emp_no =b.emp_no 
and a.to_date ='9999-01-01'
and b.to_date ='9999-01-01'
group by a.dept_no ;

select c.first_name , a.dept_name , d.salary 
from departments a, dept_emp b, employees c, salaries d
where a.dept_no =b.dept_no 
and b.emp_no =c.emp_no 
and c.emp_no =d.emp_no 
and b.to_date ='9999-01-01'
and d.to_date ='9999-01-01'
and (a.dept_no, d.salary) in (select a.dept_no , max(b.salary)
							from dept_emp a, salaries b
							where a.emp_no =b.emp_no 
							and a.to_date ='9999-01-01'
							and b.to_date ='9999-01-01'
							group by a.dept_no )
order by d.salary ;
						
-- sol2 from절에 subquery
select c.first_name , a.dept_name , d.salary 
from departments a,
	dept_emp b,
	employees c,
	salaries d,
     (select a.dept_no , max(b.salary) as max_salary
		from dept_emp a, salaries b
		where a.emp_no =b.emp_no 
		and a.to_date ='9999-01-01'
		and b.to_date ='9999-01-01'
		group by a.dept_no) e
where a.dept_no =b.dept_no 
and b.emp_no =c.emp_no 
and c.emp_no =d.emp_no 
and e.dept_no=a.dept_no 
and b.to_date ='9999-01-01'
and d.to_date ='9999-01-01'
and e.max_salary=d.salary 
order by d.salary ;
















