=begin
  Algorithm: Given an array: arr
    - Iterate through each element with an index: |el, idx|
      - Yield the element and the element at the index + 1
    - Return nil
=end

def each_cons(arr)
  arr.each_with_index do |el, idx|
    yield(el, arr[idx + 1]) unless arr[idx + 1] == nil
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
