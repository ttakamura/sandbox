class Animal:
    def __init__(self, name):
        self.name = name

    def say(self):
        print("Hello, " + self.name)

class Cat(Animal):
    def __init__(self, name):
        Animal.__init__(self, "Cat (" + name + ")")

    def hello(self):
        print("This is a pen...")
        self.say()

def hoge():
    return 9999

print(hoge())

animal = Animal("Nanika")
animal.say()

cat = Cat("Mike")
cat.hello()
