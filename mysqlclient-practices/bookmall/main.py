from bookmall.models import model_member
from bookmall.models import model_category
from bookmall.models import model_book
from bookmall.models import model_order
from bookmall.models import model_cart


print('--회원 리스트--')
# model_member.insert(name='윤현정', tel='010-0000-0000', email='yoon@gmail.com', password='yoon' )
# model_member.insert(name='우재남', tel='010-1111-1111', email='woo@gmail.com', password='woo')
results= model_member.findall()
for index, result in enumerate(results):
    print(f'{index+1}:{result["name"]}, {result["tel"]}, {result["email"]}')


print('--카테고리 리스트--')
# model_category.insert('소설')
# model_category.insert('시/에세이')
# model_category.insert('인문')
results= model_category.findall()
for index, result in enumerate(results):
    print(f'{index+1}:{result["name"]}')

print('--상품 리스트--')
# model_book.insert('하얼빈', '14400', '1')
# model_book.insert('인생의 역사','16200','2')
# model_book.insert('방구석 뮤지컬', '14850', '3')
results= model_book.findall()
for index, result in enumerate(results):
    print(f'{index+1}:제목:{result["title"]}, price:{result["price"]}, {result["category"]}')

print('--카트 리스트--')
# model_cart.insert(2,3,2)
# model_cart.insert(1,2,1)
results= model_cart.findall()
for index, result in enumerate(results):
    print(f'{index+1}:제목:{result["title"]}, amount:{result["amount"]}, {result["price"]}')


print('--주문 리스트--')
# model_order.insert('2022100001', '14400', '서울시', 1)
results=model_order.findall()
for index, result in enumerate(results):
    print(f'{index+1}:{result["orders_num"]}, {result["name"]}, {result["email"]}, {result["payment"]}, {result["address"]}')

print('--주문도서 리스트--')
results= model_book.findall()
for index, result in enumerate(results):
    print(f'{index+1}:{result["no"]} {result["title"]}')