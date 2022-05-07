# @version 0.3.3

interface Greeter:
    def setGreeting(_string: String[32]): nonpayable
    def greet() -> String[32]: view

GREETER: immutable(address)

@external
def __init__(greeterAddress: address):
    GREETER = greeterAddress

@external
def setAndCallGreeter(_string: String[32]) -> String[32]:
    Greeter(GREETER).setGreeting(_string)
    return Greeter(GREETER).greet()