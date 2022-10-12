show tables;

select count(*) from employees;

select count(*) from departments;


-- 논리 데이터베이스 설계(ERD) -> 물리 데이터베이스(tables) 포워드 엔지니어링
-- 논리 데이터베이스 설계(ERD) <- 물리 데이터베이스(tables) 리버스 엔지니어링 (역공학) *

select distinct(title) from titles;

select from_date, to_date from titles limit 0, 10; -- 현재시점까지 진행중 9999-01-01

-- ④select c1,c2,c3=>distinct는 이 시점에서 ①from tbl ②where (coud)=>row 골라냄 ③order by c1 asc/desc, c2 asc/desc ...

-- select 연습
select * from departments;
select dept_no, dept_name from departments;

-- alias (as)
-- 예제1: employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select first_name as "성", last_name as "이름", gender as "성별", hire_date as "입사일" from employees;

-- 예제2: employees 테이블에서 직원의 이름,  성별, 입사일을 출력, concat 함수 사용
select concat('hello',' ','world');
select concat(first_name, ' ', last_name) as "이름", gender as "성별", hire_date as "입사일" from employees;

-- distinct
-- 예제:  titles 테이블에서 모든 직급의 이름 출력
select distinct(title) from titles;

-- where절
-- 예제1: employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력 (조건연산자)
select first_name, gender, hire_date from employees 
where hire_date < '1991-01-01';
-- 예제2: employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력 (논리연산자)
select first_name, gender, hire_date from employees
where hire_date < '1989-01-01' and gender='f';
-- 예제3: dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력 (in연산자) or조건을 in을 활용할 수 있음
select emp_no, dept_no from dept_emp
where dept_no in ('d005', 'd009');
-- where dept_no='d005' or dept_no='d009';
-- 예제4: employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력 (like 검색)
select first_name, hire_date from employees 
where hire_date like '1989%';
-- where '1989-01-01'<=hire_date and hire_date <= '1989-12-31';
-- where hire_date between '1989-01-01' and '1989-12-31';

-- order by절
-- 예제1: salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
select emp_no, salary, from_date, to_date from salaries
where from_date like '2001%' and to_date like '2001%'
order by salary desc;
-- 예제2: 남자 직원의 이름, 성별, 입사일을 입사일순(선임순)으로 출력
select concat(first_name," ",last_name) as '이름', gender as '성별', hire_date as '입사일' from employees
where gender='m'
order by '입사일' asc;
-- 예제3: 직원들의 사번, 월급을 사번(asc), 월급(desc) 순으로 출력하세요
select emp_no, salary from salaries
order by emp_no asc, salary desc;
