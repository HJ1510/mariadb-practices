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
    sql="delete from pet where name='먼지'"
    count=cursor.execute(sql)

    # 4. commit
    db.commit()

    # 5. 자원정리
    cursor.close()
    db.close()

    # 결과 확인
    # if count==1:
    #     print('실행결과: 성공')
    # else:
    #     print('실행결과: 실패')
    print(f'실행결과: {"성공" if count>=1 else "실패" }') # f'{값}'

except OperationalError as e:
    # 에러 처리
    print(f'에러:{e}')