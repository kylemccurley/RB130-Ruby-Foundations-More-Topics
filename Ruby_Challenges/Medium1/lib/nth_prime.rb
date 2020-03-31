=begin
nth Prime Method:
  Input: Integer (nth Prime Number)
  Output: nth Prime Number

  Questions:
    > How to calculate a prime number/next prime number?

  Brainstorm:
    1. Loop 1-by-1 through each integer and calculate whether that number is prime
      > Append true prime tested numbers into an array of primes

  Problem Domain:
    > WHAT IS A PRIME NUMBER?
      > Number who's factors are only 1 and the number itself.

    > Shortcut 1:
      > Only test prime numbers smaller than the number you are testing
    > Shortcut 2:
      > Only test numbers that are below the square root of the
        number you are testing.

    > Shortcuts 1 + 2:
      > Only test prime numbers that are below the square root
        of the number you are testing.

  Algorithm: Find the nth Prime Number
    Given a number: nth_prime
      > SET primes = []
      > SET counter = 2
      > REPEAT-UNTIL primes array is the size nth_prime
        > APPEND counter to primes if prime?(counter) is true
      > Return the last element of primes

  prime? method:
    Input: Integer
    Output: Boolean Value (Is the input integer a prime number?)

    Algorithm: Given an integer: number
      > 2.REPEAT-UNTIL (i - 1): |factor|
        > RETURN false IF number divides evenly into factor (number % factor == 0)
      > RETURN true
=end

class Prime
  def self.nth(nth_prime)
    raise ArgumentError if nth_prime.zero?

    primes = []
    number = 2

    while primes.size < nth_prime
      primes << number if prime?(number)
      number += 1
    end

    primes.last
  end

  private

  def self.prime?(num)
    2.upto(num - 1) do |factor|
      return false if num % factor == 0
    end
    true
  end
end
