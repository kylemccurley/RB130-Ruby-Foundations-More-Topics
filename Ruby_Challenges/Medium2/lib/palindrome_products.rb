=begin
  - find all combinations of numbers from @min to @max
    - Palindrome?
      - Yes:
        - Store away in palindromes

  - Be able to report the value and the factors for the Palindrome

  class Palindrome
    @value
    @factors
  end
=end



class Palindrome
  include Comparable
  attr_reader :value, :factors

  def initialize(factors)
    @value = factors.inject(:*)
    @factors = factors.sort
  end

  def <=>(other)
    self.value <=> other.value
  end
end

class Palindromes
  def initialize(factors)
    @max = factors[:max_factor]
    @min = factors[:min_factor] || 1
    @palindromes = {}
  end

  def generate
    (@min..@max).to_a.repeated_combination(2) do |f1, f2|
      if palindrome?(f1 * f2)
        @palindromes[f1 * f2] ||= []
        @palindromes[f1 * f2] << [f1, f2].sort
      end
    end
  end

  def largest
    max_value = @palindromes.keys.max
    Struct.new(:value, :factors).new(max_value, @palindromes[max_value])
  end

  def smallest
    min_value = @palindromes.keys.min
    Struct.new(:value, :factors).new(min_value, @palindromes[min_value])
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
