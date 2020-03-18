# Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

=begin
  - Constructor will take the string
  of digits.
  - Series is a class
  - Slices is an instance method.
    - Input: Integer (n)
    - Output: Nested Array
      - Sub-arrays contain n elements
      
Algorithm For the Slices Method:
  Given an integer: n
    - Initialize a local variable:outcome
      - Set to []
    - Iterate through each element of
    the passed in string with index: (Array#each_with_index)
      - Initialize a local variable: sub_array
        - Set to []
      - Iterate n times using (Integer#times): |offset|
        - Append element at @series[index + offset] to sub_array
      - Append sub_array to outcome
=end

class Series
  def initialize(str)
    @string = str  
  end
  
  def slices(num_slices)
    outcome = []

    @string.chars.each_with_index do |char, idx|
      sub_array = []

      num_slices.times do |offset|
        sub_array << @string.chars[idx + offset].to_i
      end

      outcome << sub_array
    end
    
    outcome
  end
end


