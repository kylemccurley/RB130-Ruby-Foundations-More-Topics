class Octal
  def initialize(octal_num)
    @octal = octal_num
  end
  
  def to_decimal
    return 0 unless @octal.chars.all? { |char| %w(0 1 2 3 4 5 6 7).include?(char) }
    outcomes = []
    counter = @octal.size - 1

    @octal.chars.map(&:to_i).each do |digit|
      outcomes << digit * (8 ** counter)
      counter -= 1
    end
  
    outcomes.inject(:+)
  end
end
