
import random

def numbers(max):
    i = 0
    while i < max:
        yield i
        i += 1

max = 1000000

[print(x) for x in numbers(max) if random.randint(0, 100) < 40]
