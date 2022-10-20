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

        sql = "select b.no, b.title, b.price, c.name as category  from category c , book b where c.`no` =b.category_no"
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        print(f'에러:{e}')


def insert(title, price, category_no):
    try:
        db = conn()
        cursor = db.cursor(DictCursor)

        sql = "insert into book values(null, %s, %s, %s)"
        count = cursor.execute(sql, (title, price, category_no))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')
