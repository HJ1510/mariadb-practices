from MySQLdb import connect, OperationalError

try:
    # 연결
    db = connect(user='webdb',
               password='webdb',
               host='127.0.0.1',
               port=3306,
               db='webdb',
               charset='utf8') # mysql에서는 uft-8로 하면 오류
    print('연결 성공')
except OperationalError as e:
    print(f'에러:{e}')

# print('end!')