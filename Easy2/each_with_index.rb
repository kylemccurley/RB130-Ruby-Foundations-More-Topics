=begin
Write a method called each_with_index that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should yield each element and an index number to the block. each_with_index should return a reference to the original Array.
=end

=begin
  Algorithm for Each_with_index:
    - Take an array as the argument.
    - Take an implicitly available block
    
    - Yield each element as well as an index number to the block
    - Return original array
=end

def each_with_index(array)
  index = 0
  while index < array.size
    element = array[index]
    yield(element, index)

    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
