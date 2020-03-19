=begin
algorithm Sieve of Eratosthenes is
    input: an integer n > 1.
    output: all prime numbers from 2 through n.

    let A be an array of Boolean values, indexed by integers 2 to n,
    initially all set to true.
    
    for i = 2, 3, 4, ..., not exceeding √n do
        if A[i] is true
            for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n do
                A[j] := false

    return all i such that A[i] is true
    SET potential_primes = {}
    SET outcome = []
    LOOP potential_primes
=end

class Sieve
  def initialize(limit)
    @limit = limit
    @potential_primes = {}

    2.upto(@limit) { |num| @potential_primes[num] = true }
  end
  
  def primes
    2.upto(@limit) { @potential_primes << true }
    @potential_primes.each do |el, prime?|
      if prime?
        @limit.times { |multiplier| @potential_primes[el**2 + (el * multiplier)] = false }
      end
    end
  end  
end
