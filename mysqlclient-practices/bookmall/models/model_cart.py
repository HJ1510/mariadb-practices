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

        sql = "select b.title , c.amount , b.price from cart c , book b, `member` m where c.book_no =b.`no` and m.`no` =c.member_no"
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        print(f'에러:{e}')

def insert(member_no, book_no, amount):
    try:
        db = conn()
        cursor = db.cursor(DictCursor)

        sql = "insert into cart values(%s, %s, %s)"
        count = cursor.execute(sql, (member_no, book_no, amount))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')
