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
