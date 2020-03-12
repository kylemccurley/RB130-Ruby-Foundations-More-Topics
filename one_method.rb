=begin
Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Algorithm:
  Given an array: arr
  - Initialize an empty array: output.
  - Iterate through each element of arr: |el|
    - Append the return value of the block yield to output. 
  - Return true if the count for true in output array is 1
  - Otherwise, false.
  
# FORMAL PSEUDO:
#----------------------------
GIVEN AN ARRAY: array
#----------------------------
  SET output to []
  REPEAT-UNTIL array.last |el|
    APPEND yield el to output.
  IF output count of true == 1
    RETURN true
  ELSE
    RETURN false
  END
=end

def all?(array)
  array.each { |num| return false unless yield num }
  true
end

def any?(array)
  array.each { |num| return true if yield num }
  false
end

def none?(array)
  return true if array.empty?
  array.each { |num| return false if yield num }
  true
end

def one?(arr)
  output = []
  arr.each { |el| output << yield(el) }
  return true if output.count(true) == 1
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true  # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? } == false   # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true# -> true
p one?([1, 3, 5, 7]) { |value| true } == false        # -> false
p one?([1, 3, 5, 7]) { |value| false } == false     # -> false
p one?([]) { |value| true } == false                 # -> false
