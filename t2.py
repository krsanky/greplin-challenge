#!/usr/bin/env python

"""
Level 2

	----------------------------------------

	Congratulations.  You have reached level 2.

	To get the password for level 3, write code to find the first prime
	fibonacci number larger than a given minimum.  For example, the first
	prime fibonacci number larger than 10 is 13.

	When you are ready, go here or call this automated
	number (415) 799-9454.

	You will receive additional instructions at that time.  For the second portion
	of this task, note that for the number 12 we consider the sum of the prime divisors
	to be 2 + 3 = 5.  We do not include 2 twice even though it divides 12 twice.

"""

import math

def is_prime(num):
    """
    assume num is positive integer

    (10:22:34 PM) tinker: it sufficies to check if every number from 2 to roof(sqrt(A) ) does not divide into A
    (10:22:41 PM) tinker: to establish if A is prime
    """
    #for i in range(2, int(math.ceil(math.sqrt(num)))):
    for i in range(2, num):
        if num % i == 0:
            return False
    return True

def fibo():
    """a generator for Fibonacci numbers, goes to next number in series on each call"""
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

def next_gt_fibo(num):
    """
    assume num is pos. int
    return the next fibo num *greater than* num
    """
    f = fibo()
    next = f.next()
    while next <= num:
        next = f.next()
    return next

def next_fibo_prime(num):
    next = next_gt_fibo(num)
    while True:
        if is_prime(next):
            return next
        next = next_gt_fibo(next)

if __name__ == '__main__':
    print "question 2"
