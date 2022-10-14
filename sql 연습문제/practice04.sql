-- practice04 혼합

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
from salaries 
where salary > (select avg(salary)
				from salaries 
				where to_date ='9999-01-01')
				and to_date ='9999-01-01'
and to_date ='9999-01-01';

-- select avg(salary)
-- from salaries 
-- where to_date ='9999-01-01';

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서, 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select e.emp_no, e.first_name , d.dept_name , s.salary
from employees e , departments d , dept_emp de , salaries s
where e.emp_no =de.emp_no 
and d.dept_no =de.dept_no 
and s.emp_no =e.emp_no 
and de.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
and (d.dept_name, s.salary) in (select d.dept_name , max(s.salary) as max_salary
								from salaries s , dept_emp de , departments d 
								where s.emp_no =de.emp_no 
								and de.dept_no =d.dept_no 
								and s.to_date ='9999-01-01'
								and de.to_date ='9999-01-01'
								group by d.dept_name) 
order by s.salary desc;

-- 부서별 최고 급여
-- select d.dept_name , max(s.salary) as max_salary
-- from salaries s , dept_emp de , departments d 
-- where s.emp_no =de.emp_no 
-- and de.dept_no =d.dept_no 
-- and s.to_date ='9999-01-01'
-- and de.to_date ='9999-01-01'
-- group by d.dept_name 
-- order by s.salary asc;


-- 문제3.***
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 

-- 부서별 평균급여
select d.dept_name , avg(s.salary) as avg_salary
from salaries s , departments d , dept_emp de 
where s.emp_no =de.emp_no 
and d.dept_no =de.dept_no
and s.to_date ='9999-01-01'
and de.to_date ='9999-01-01'
group by d.dept_name;

-- 부서 평균보다 급여 높은 사원
select e.first_name , s.salary
from employees e , salaries s , dept_emp de 
where e.emp_no =s.emp_no 
and s.emp_no =de.emp_no 
and s.to_date ='9999-01-01'
and s.salary ;



-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select e.emp_no , e.first_name , manager.first_name, d.dept_name 
from employees e , departments d , dept_emp de ,
 			(select e.first_name , d.dept_name 
			from departments d , dept_manager dm , employees e 
			where d.dept_no =dm.dept_no 
			and dm.emp_no =e.emp_no 
			and dm.to_date ='9999-01-01') as manager
where e.emp_no =de.emp_no 
and de.dept_no =d.dept_no 
and d.dept_name =manager.dept_name
and de.to_date ='9999-01-01' ;

-- 부서 매니저 이름
-- select e.first_name , d.dept_name 
-- from departments d , dept_manager dm , employees e 
-- where d.dept_no =dm.dept_no 
-- and dm.emp_no =e.emp_no 
-- and dm.to_date ='9999-01-01';



-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select e.emp_no , e.first_name ,t.title ,s.salary  
from employees e , titles t , salaries s , departments d , dept_emp de 
where e.emp_no =t.emp_no 
and e.emp_no =s.emp_no 
and de.emp_no =e.emp_no 
and de.dept_no =d.dept_no 
and t.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
and de.to_date ='9999-01-01'
and d.dept_name = (select distinct (d.dept_name )
from departments d , dept_emp de , salaries s ,
		(select d.dept_name, avg(s.salary) as avg_salary
			from salaries s , departments d , dept_emp de 
			where s.emp_no =de.emp_no 
			and d.dept_no =de.dept_no
			and s.to_date ='9999-01-01'
			and de.to_date ='9999-01-01'
			group by d.dept_name) as a		
where d.dept_no =de.dept_no 
and de.emp_no =s.emp_no 
and a.dept_name=d.dept_name 
and de.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
and avg_salary= (select max(a.avg_salary) 
					from (select d.dept_name, avg(s.salary) as avg_salary
							from salaries s , departments d , dept_emp de 
							where s.emp_no =de.emp_no 
							and d.dept_no =de.dept_no
							and s.to_date ='9999-01-01'
							and de.to_date ='9999-01-01'
							group by d.dept_name) a))
order by s.salary ;


-- 부서별 평균급여
-- select d.dept_name, avg(s.salary) as avg_salary
-- from salaries s , departments d , dept_emp de 
-- where s.emp_no =de.emp_no 
-- and d.dept_no =de.dept_no
-- and s.to_date ='9999-01-01'
-- and de.to_date ='9999-01-01'
-- group by d.dept_name;
-- 
-- 평균급여가 가장 높은 부서
-- select distinct (d.dept_name )
-- from departments d , dept_emp de , salaries s ,
-- 		(select d.dept_name, avg(s.salary) as avg_salary
-- 			from salaries s , departments d , dept_emp de 
-- 			where s.emp_no =de.emp_no 
-- 			and d.dept_no =de.dept_no
-- 			and s.to_date ='9999-01-01'
-- 			and de.to_date ='9999-01-01'
-- 			group by d.dept_name) as a		
-- where d.dept_no =de.dept_no 
-- and de.emp_no =s.emp_no 
-- and a.dept_name=d.dept_name 
-- and de.to_date ='9999-01-01'
-- and s.to_date ='9999-01-01'
-- and avg_salary= (select max(a.avg_salary) 
-- 					from (select d.dept_name, avg(s.salary) as avg_salary
-- 							from salaries s , departments d , dept_emp de 
-- 							where s.emp_no =de.emp_no 
-- 							and d.dept_no =de.dept_no
-- 							and s.to_date ='9999-01-01'
-- 							and de.to_date ='9999-01-01'
-- 							group by d.dept_name) a);

				

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select distinct (d.dept_name )
from departments d , dept_emp de , salaries s ,
		(select d.dept_name, avg(s.salary) as avg_salary
			from salaries s , departments d , dept_emp de 
			where s.emp_no =de.emp_no 
			and d.dept_no =de.dept_no
			and s.to_date ='9999-01-01'
			and de.to_date ='9999-01-01'
			group by d.dept_name) as a		
where d.dept_no =de.dept_no 
and de.emp_no =s.emp_no 
and a.dept_name=d.dept_name 
and de.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
and avg_salary= (select max(a.avg_salary) 
					from (select d.dept_name, avg(s.salary) as avg_salary
							from salaries s , departments d , dept_emp de 
							where s.emp_no =de.emp_no 
							and d.dept_no =de.dept_no
							and s.to_date ='9999-01-01'
							and de.to_date ='9999-01-01'
							group by d.dept_name) a);


-- 문제7.
-- 평균 연봉이 가장 높은 직책?
						
-- 직책별 평균연봉
select t.title , avg(s.salary)
from titles t , salaries s 
where t.emp_no =s.emp_no
and t.to_date ='9999-01-01'
and s.to_date ='9999-01-01'
group by t.title 


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
-- 1 매니저 연봉 2 직원 연봉 => 매칭

