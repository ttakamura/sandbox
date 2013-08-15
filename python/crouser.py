
def new_inc(num):
    def inc():
        nonlocal num
        num = num + 1
        return num
    return inc

def outer(val):
    def inner(valB):
        return val + valB
    return inner

def gen_counter(num):
    while True:
        yield num
        num = num + 1
        print("counter is {0}".format(num))

x = outer(10)
print(x(20))

x = new_inc(100)
print(x())
print(x())

x = gen_counter(33)
next(x)
next(x)
next(x)
next(x)
