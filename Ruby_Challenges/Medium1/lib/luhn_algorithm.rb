=begin
Identify Inputs and Outputs:
  Addend Method:
    Input:
      > Instance Variable With Integer: number
    Output:
      > Generates an ARRAY of every other number multiplied by 2

    Requirements/Rules:
      - Double the values of every second digit.
      - Start from the rightmost digit.
      - Subtract 9 for any number >= 10

    Data Structure:
      - String: Characters of the instance variable
      - Integer: Each string character coverted.
      - Array: Output

    Algorithm:
      Given an instance variable: number (Integer)
        1. Initialize a local variable: addends
          > Set to an empty array
        2. Iterate from -(number string size -1) to -1: |idx|
          > Initialize a local variable: digit
            > Convert the element at number[idx] to an Integer
          > If idx is even?
            > Multiply element by 2
            > Append multiplied element to addends
          > Otherwise:
            > Append element at idx to addends.
        3. RETURN addends

  CheckSum Method:
    Input:
      > Instance Variable Referencing Orig. Number
    Output:
      > Sum of the Addendas for the Orig. Number

  Valid? Method:
    Input:
      > Instance Variable Referencing Orig. Number
    Output:
      > Boolean Value Indicating Whether the Number is True/False

  Create Method:
    Input: Integer(Number)
    Output: Integer Value of Valid Number

=end

class Integer
  def last
    self.to_s[-1].to_i
  end

  def multiply
    self * 2 >= 10 ? self * 2 - 9 : self * 2
  end
end

class Luhn
  def initialize(user_input = 0)
    @number = user_input.to_s.chars.map(&:to_i)
  end

  def addends
    @number.reverse.each_with_index.map do |digit, idx|
      if idx.even?
        digit
      else
        digit.multiply
      end
    end.reverse
  end

  def valid?
    checksum.last.zero?
  end

  def checksum
    addends.reduce(:+)
  end

  def self.create(number)
    if new(number * 10).valid?
      number * 10
    else
      remainder = new(number * 10).checksum % 10
      (number * 10) + (10 - remainder)
    end
  end
end
