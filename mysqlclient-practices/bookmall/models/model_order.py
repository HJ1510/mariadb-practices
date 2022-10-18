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

        sql = "select o.orders_num , m.name ,m.email , o.payment , o.address from orders o , member m where o.member_no =m.`no` "
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        # 에러 처리
        print(f'에러:{e}')

def insert(order_num, payment, address, member_no):
    try:
        db =  conn()
        cursor = db.cursor(DictCursor)

        sql = "insert into orders values(null, %s, %s, %s, %s)"
        count = cursor.execute(sql, (order_num, payment, address, member_no,))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')
