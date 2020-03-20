class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def initialize(*multiples)
    @multiples = *multiples
    @multiples = DEFAULT_MULTIPLES if multiples.empty?
  end
  
  def self.to(limit = DEFAULT_MULTIPLES)
    self.new.to
  end

  def to(limit = DEFAULT_MULTIPLES)
    find_all_multiples(limit).inject(:+)
  end

  private

  def find_all_multiples(limit)
    outcome = []
    1.upto(limit - 1) do |potential_multiple|
      outcome << potential_multiple if multiple?(potential_multiple)
    end
  end
  
  def multiple?(potential_multiple)
    @multiples.any? { |num| num % potential_multiple == 0 }
  end
end
