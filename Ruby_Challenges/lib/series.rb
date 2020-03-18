=begin
Algorithm For the Slices Method:
  Given an integer: n
  SET outcome = []
  LOOP @slices.each_cons do |sub_array|
    APPEND sub_array to outcome
  END
  RETURN outcome
  
  Replace lines 27 to 32 with Array#each_cons(n):
=end

class Series
  def initialize(str)
    @series_arr = str.chars
  end
  
  def slices(num_slices)
    outcome = []

    raise ArgumentError, 'Slice number is too large' if num_slices > @string.size
    @series_arr.map(&:to_i).each_cons(num_slices) { |sub_arr| outcome << sub_arr }

    outcome
  end
end
