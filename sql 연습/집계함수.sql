-- 집계쿼리: select 절에 그룹함수(avg, max, min, count, sum, ...)가 적용된 경우 

select avg(salary), sum(salary)
from salaries ;

-- select절에 그룹함수가 있는 경우, 어떤 컬럼도 select절에 올 수 없다.
-- 아래 emp_no는 아무 의미 없다. 오류가 나야하는데 mysql에서 오류로 잡지 않음
select avg(salary), emp_no 
from salaries ; -- => 10001번의 평균연봉 아님!!!!

-- query 순서 
-- 1) from: 접근테이블 확인
-- 2) where: 조건에 맞는 row 선택 => 메모리에 올라감
-- 3) 집계 
-- 4) projection (화면출력)
select avg(salary)
from salaries 
where emp_no = '10060';

-- group by에 참여하고 있는 컬럼은 projection이 가능(select절에 올 수 있다)
select emp_no , avg(salary)
from salaries 
group by emp_no ;

-- SELECT(DISTINCT) 칼럼명(ALIAS)
-- FROM 테이블명
-- WHERE 조건식
-- GROUP BY 칼럼명
-- HAVING 조건식
-- ORDER BY 칼럼이나 표현식 (ASC 또는 DESC)

-- having 집계된 임시테이블에 조건을 걸 때
-- 집계결과(결과 임시 테이블)에서 row를 선택해야하는 경우 vs.where 원 테이블에서 row 선택
-- 이미 where절은 실행이 되었기때문에 having절에서 이 조던을 주어야 한다
select emp_no , avg(salary) as avg_salary
from salaries 
group by emp_no 
having avg_salary > 60000
order by avg_salary desc;

-- 예제
-- salaries 테이블에서 사번이 10060인 직원의 사번, 급여 평균과 총합을 출력하세요
-- 문법적으로 오류! 의미적으로는 맞다..
select emp_no as '사번' , avg(salary), sum(salary)
from salaries 
where emp_no = '10060';
-- 문법적으로 옳다
select emp_no , avg(salary), sum(salary)
from salaries
group by emp_no 
having emp_no = '10060' ;

























