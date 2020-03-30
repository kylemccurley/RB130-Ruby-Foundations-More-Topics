=begin
valid?:
  Problem Domain:
    > What conditions must be met for a number to be valid?
      > Number must be 10 digits long
      > Number is 11 digits, but the first number is 1
      > There should not be any alphabetical characters in @number.

  Algorithm for valid? algorithm:
    IF any alphabetical character is in @number
      RETURN false
    ELSIF @number#size is 11 && @number[0] is 1
      RETURN true
    ELSIF @number.size is 10
      RETURN true
    ELSE
      RETURN false
    END
=end
class PhoneNumber
  INVALID = '0000000000'

  def initialize(number)
    @number = clean_up(number)
  end

  def number
    return INVALID unless valid?
    return INVALID if letter_included?

    @number = valid_11_digit? ? @number[1, 10] : @number
  end

  def to_s
    "(#{area_code}) #{@number[3, 3]}-#{@number[6, 4]}"
  end

  def area_code
    self.number[0, 3]
  end

  private

  def valid_11_digit?
    (@number.size == 11) && (@number[0] == '1')
  end

  def valid?
    if valid_11_digit? ||
       @number.size == 10
      true
    else
      false
    end
  end

  def clean_up(number)
    number.chars.select do |char|
      char.match?(/\w/)
    end.join
  end

  def letter_included?
    @number.match?(/[a-z]/i)
  end
end
