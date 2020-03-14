def pass_block(arr)
  yield arr
end

nums = [1, 2, 3, 4, 5]
pass_block(nums) { |_, _, *numbers| puts numbers }
