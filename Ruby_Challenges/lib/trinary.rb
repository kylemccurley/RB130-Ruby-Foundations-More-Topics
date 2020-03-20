class Trinary
  def initialize(num)
    @number = num
  end
  
  def to_decimal
    return 0 unless @number.chars.all? { |digit| %w(0 1 2).include?(digit) }
    outcomes = []
    power = @number.size - 1

    @number.chars.map(&:to_i).each do |digit|
      outcomes << (digit * (3**power))
      power -= 1
    end

    outcomes.inject(:+)
  end
end
