# Write a method that takes an array as an argument.
# The method should yield the contents of the array to a block,
# which should assign your block variables 
# in such a way that it ignores the first two elements, 
# and groups all remaining elements as a raptors array.

def pass_block(arr)
  yield arr
end

nums = [1, 2, 3, 4, 5]
pass_block(nums) { |_, _, *numbers| puts numbers }
