from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def conn():
    db = connect(user='webdb',
                 password='webdb',
                 host='127.0.0.1',
                 port=3306,
                 db='webdb',
                 charset='utf8')
    return db


def findall():
    try:
        db=conn()
        cursor = db.cursor(DictCursor)

        sql = 'select first_name, last_name, email from emaillist order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results

    except OperationalError as e:
        # 에러 처리
        print(f'에러:{e}')


def insert(firstname, lastname, email):
    try:
        db = conn()
        cursor = db.cursor()

        # sql = f"insert into emaillist values(null,'{firstname}','{lastname}','{email}')"
        # count = cursor.execute(sql)
        sql="insert into emaillist values(null, %s, %s, %s)"
        count = cursor.execute(sql, (firstname, lastname, email))

        db.commit()
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러:{e}')


def deletebyemail(email):
    try:
        db = conn()
        cursor = db.cursor()

        sql='delete from emaillist where email = %s'
        count = cursor.execute(sql, (email,))

        db.commit()
        cursor.close()
        db.close()

        return count == 1
    except OperationalError as e:
        print(f'에러:{e}')
