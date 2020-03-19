class Sieve
  def initialize(limit)
    @limit = limit
  end
  
  def primes
    outcome = (2..@limit).to_a
  
    outcome.each do |el|
      outcome.reject! { |num| num != el && num % el == 0 }
    end
  
    outcome
  end
end
