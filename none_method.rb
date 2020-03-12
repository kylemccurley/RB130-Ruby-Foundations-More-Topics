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

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true
