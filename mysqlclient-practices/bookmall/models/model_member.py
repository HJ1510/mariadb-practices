from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def conn():
    db = connect(user='bookmall',
                 password='bookmall',
                 host='127.0.0.1',
                 port=3306,
                 db='bookmall',
                 charset='utf8')
    return db

def findall():
    try:
        db = conn()
        cursor = db.cursor(DictCursor)

        sql = "select name , tel , email , password  from member"
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        # 에러 처리
        print(f'에러:{e}')

def insert(name, tel, email, password):
    try:
        db =  conn()
        cursor = db.cursor(DictCursor)

        sql = "insert into member values(null, %s, %s , %s ,%s)"
        count = cursor.execute(sql, (name, tel, email, password))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')