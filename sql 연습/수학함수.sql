-- 함수: 수학

-- abs
select abs(1), abs(-1);

-- ceil(x) x보다 큰 정수중에 가장 작은 값
select ceil(3.14);

-- floor(x) x보다 적은 정수중에 가장 큰 값
select floor(3.14);

-- mod(n,m) n을 m으로 나눈 나머지 값
select mod(10,3);

-- round(x) x에 가장 근접한 정수
-- round(x,d) x값 중에 소수점 d자리에 가장 근접한 실수
select round(1.498), round(1.498,1), round(1.498,0);

-- power(x,y), pow(x,y) x의 y승
select power(2,10), pow(2,10);

-- sign(x) 양수판별 => 양수는 1 음수는 -1 0은 0의 값을 보여줌
select sign(20), sign(-100), sign(0);

-- greatest(x,y, ...) 가장 큰 값 / least(x,y, ...) 가장 작은 값
select greatest(10,40,20,50), least(10,40,20,50);
select greatest('b','A','C','B'), least('b','A','C','B'),
greatest('hello', 'help', 'hell') ,least('hello', 'help', 'hell') ;


-- **데이터는 메모리에 저장, 코드는 cpu에서 실행 s='h' => 'h'는 메모리에 올라감 s는 메모리에 있는 'h'의 값을 가져와서 코드 실행
-- 비트 수는 메모리<->cpu 사이의 통로...?

-- 
