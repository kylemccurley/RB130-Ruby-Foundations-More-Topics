=begin
Algorithm For the Slices Method:
  Given an integer: n
  SET outcome = []
  LOOP @slices.each_with_index do |el, idx|
    SET sub_array = []
    LOOP n times do |offset|
      APPEND @series[idx + offset] to sub_array
    END
    APPEND sub_array to outcome
  END
  RETURN outcome
  
  Replace lines 27 to 32 with Array#each_cons(n):
=end

class Series
  def initialize(str)
    @string = str  
  end
  
  def slices(num_slices)
    outcome = []
    @string.chars.map(&:to_i).each_cons(num_slices) { |sub_arr| outcome << sub_arr }
    outcome
  end
end
