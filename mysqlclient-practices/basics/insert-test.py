from MySQLdb import connect, OperationalError

try:
    # 1. 연결
    db = connect(user='webdb',
               password='webdb',
               host='127.0.0.1',
               port=3306,
               db='webdb',
               charset='utf8') # mysql에서는 uft-8로 하면 오류

    # 2. cursor 생성
    cursor=db.cursor()

    # 3. sql(insert문) 실행
    sql="insert into pet values('먼지', '윤현정', 'dog', 'f', '2013-01-18', null)"
    count=cursor.execute(sql)

    # 4. commit
    db.commit()

    # 5. 자원정리
    cursor.close()
    db.close()

    # 결과 확인
    print(f'실행결과: {count}')

except OperationalError as e:
    # 에러 처리
    print(f'에러:{e}')