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

        sql = "select no, name from category"
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        # 에러 처리
        print(f'에러:{e}')

def insert(name):
    try:
        db =  conn()
        cursor = db.cursor(DictCursor)

        sql = "insert into category values(null, %s)"
        count = cursor.execute(sql, (name,))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')
