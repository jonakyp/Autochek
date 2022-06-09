"""Generates random 10 digit number"""

import random
import string


def random_email(int_range=10):
    """Generates random string that will be used as an email"""
    return ''.join(random.choice(string.ascii_letters) for _ in range(int_range))\
           + "@endtest-mail.io"


def random_ng_phone_digits():
    """Generates random 10 digit number"""
    return random.randint(0, 9999999999)
