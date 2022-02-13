from django.test import TestCase

# Create your tests here.
class Foo:
    def __init__(self, x):
        self.x = x

    def __iter__(self):
        return self

    def __next__(self):
        self.x += 1
        return self.x


f = Foo(3)
for i in f:
    print(i)