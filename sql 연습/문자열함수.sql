-- 함수: 문자열

-- upper => 대문자로
select upper('seoul'), upper('sEoUl'), upper('Seoul')  ;
select upper(first_name) from employees;

-- lower => 소문자로
select lower('seoul'), lower('sEoUl'), lower('Seoul')  ;
select lower(first_name) from employees;

-- substring (문자열, index, length)
select substring('Hello World',3,2); -- 첫문자는 1 (db에서는 1부터 시작하는 경우가 多)

-- 예제: 1989년에 입사한 사원들의 이름, 입사일 출력
select first_name, hire_date from employees 
where '1989' = substring(hire_date, 1, 4); 
-- where hire_date like '1989%';

-- lpad(오른쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234',10,'-'), rpad('1234',10,'-') ;
-- 예제: 직원들의 월급을 오른쪽 정렬(빈공간은 *)
select lpad(salary,10,'*') from salaries;

-- trim, ltrim, rtrim 입력값 가장자리 공백 삭제
select concat('---',ltrim('   hello   '),'---'),
concat('---',rtrim('   hello   '),'---'),
concat('---',trim(both 'x' from 'xxxhelxloxxx'),'---'),
concat('---',trim(both ' ' from '   hello   '),'---');