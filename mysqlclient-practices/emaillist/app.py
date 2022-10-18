
while True:
    cmd = input('(l)ist (a)dd (d)elete (q)uit > ')

    if cmd == 'q':
        break
    elif cmd == 'l':
        print('list 처리')
    elif cmd == 'a':
        print('add 처리')
    elif cmd == 'd':
        print('delete 처리')
    else:
        print('알 수 없는 명령입니다.')