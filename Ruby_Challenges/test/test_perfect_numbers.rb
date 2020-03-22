=begin
'Meta-View' of The Program:
  - Calculate the factors of the given number
  - Calculate the sum of the factors
  - Based on the sum of the factors:
    - Decide if:
      - Perfect
      - Abundant
      - Deficient
      
  Calculate the Factors of The Given Number:
    - Initialize a local variable: outcome
      - Set to an empty array
    - Iterate from 1 upto (given_number - 1): |factor|
      - If num % factor == 0 (If this factor is in fact a factor):
        - Append the factor to outcome
    - Based on the sum of the factors:
      - If sum == given number:
        - Return 'perfect'
      - If the sum > number:
        - Return 'abundant'
      - If the sum < number:
        - Return 'deficient'
=end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    factors = [] # First, Calculate the factors of @number:
    1.upto(number - 1) do |factor|
      factors << factor if number % factor == 0
    end
    sum_of_factors = factors.reduce(:+) # Find the sum of the factors
    # Categorize/Return the number:
    if sum_of_factors < number
      'deficient'
    elsif sum_of_factors > number
      'abundant'
    else
      'perfect'
    end
  end
end
