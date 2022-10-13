-- 조인
-- inner join : 조인 조건 만족하는 데이터만 출력 => equi join / join ~ on(표준)
-- outter join : 조인 조건 만족하지 못하는 데이터도 함께 출력 => join left ~ on / join right ~ on / join full ~ on(마리아db 지원x)

select *
from dept_manager ;

select *
from dept_emp ;

-- 예제1) 현재 근무하고 있는 직원의 이름과 직책을 모두 출력 하세요. 
select employees.emp_no 
from employees, titles 
where employees.emp_no = titles.emp_no  -- join 조건의 수는 (n-1) => 두 테이블 합쳐서 커다란 하나의 테이블
and titles.to_date ='9999-01-01'; -- row선택조건

select a.first_name , b.title 
from employees a, titles b
where a.emp_no = b.emp_no  
and b.to_date ='9999-01-01'; 

-- 예제2) 현재 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어(engineer)만 출력하세요
select a.first_name , a.gender , b.title 
from employees a, titles b
where a.emp_no = b.emp_no   -- join 조건(n-1)
and b.to_date like '9999%' -- row 선택조건1
and a.gender ='f'           -- row 선택조건2
and b.title ='engineer';    -- row 선택조건3

-- ANSI/ISO SQL1999 JOIN 표준문법
-- 1) Natural Join
-- 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않아도 암묵적으로 조인이 됨
select a.first_name , b.title                           -- line17에 있는 것과 같음
from employees a join titles b on a.emp_no = b.emp_no 
where b.to_date ='9999-01-01'; 

select a.first_name , b.title                           -- line17에 있는 것과 같음
from employees a natural join titles b  
where b.to_date ='9999-01-01'; 

-- 2) Join ~ using
-- natural join의 문제점 => 
select count(*)                       -- <=의도치 않은 결과(값은 이름의 칼럼이 다 join되어버린것)
from salaries a natural join titles b 
where b.to_date ='9999-01-01';


select count(*)
from salaries a join titles b using(emp_no)
where b.to_date ='9999-01-01';

-- 3) join ~ on
-- 예제) 현재 근무중인 직원의 직책별 평균연봉을 큰 순서대로 출력하세요.
select b.title '직책', avg(salary) '평균연봉'
from salaries a 
join titles b on a.emp_no =b.emp_no 
where b.to_date = '9999-01-01'
and a.to_date = '9999-01-01'
group by b.title 
order by avg(salary) desc;

-- 실습문제1: 현재 회사 상황을 반영한 직원별 근무부서를 사번, 직원 전체이름, 근무부서를 출력하세요.
select b.emp_no '사번', concat(a.first_name,' ',a.last_name) '이름', c.dept_name '근무부서'
from employees a 
join dept_emp b on a.emp_no = b.emp_no 
join departments c on b.dept_no =c.dept_no 
where b.to_date ='9999-01-01'
order by a.emp_no;

select a.emp_no , a.first_name , b.dept_name 
from employees a, departments b, dept_emp c
where a.emp_no =c.emp_no 
and b.dept_no =c.dept_no 
and c.to_date ='9999-01-01';

-- 실습문제2: 
-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요.
-- 사번, 전체이름, 연봉 형태로 출력하세요.
select e.emp_no , e.first_name , s.salary 
from employees e , salaries s 
where e.emp_no = s.emp_no 
and s.to_date ='9999-01-01';

-- 실습문제3:
-- 현재 직책별로 평균 연봉과 인원수를 구하되,
-- 직책별로 인원이 100명 이상인 직책만 출력 하세요.
select t.title , avg(s.salary), count(*)
from titles t , salaries s 
where t.emp_no = s.emp_no 
group by t.title
having count(*) >= 100; 

-- 실습문제4: 
-- 현재 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요. 부서이름, 평균급여 출력.
select a.dept_name , avg(salary)
from departments a, dept_emp b, salaries c, titles d
where a.dept_no =b.dept_no 
and b.emp_no =c.emp_no 
and c.emp_no =d.emp_no 
and b.to_date ='9999-01-01'
and c.to_date ='9999-01-01'
and d.to_date ='9999-01-01'
and d.title ='engineer'
group by a.dept_name 
order by avg(salary) desc;



