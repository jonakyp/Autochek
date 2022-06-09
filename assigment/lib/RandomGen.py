import random
import string


def random_email(y=10):
    return ''.join(random.choice(string.ascii_letters) for x in range(y)) + "@endtest-mail.io"


def random_ng_phone_digits():
    return random.randint(0, 9999999999)
