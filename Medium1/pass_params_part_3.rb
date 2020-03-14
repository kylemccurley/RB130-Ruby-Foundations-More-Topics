items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
  
  
gather(items) do |*first_three, last_one |
  puts first_three.join(', ')
  puts last_one
end

puts ''

gather(items) do |apple, *other_items, wheat|
  puts apple
  puts other_items.join(', ')
  puts wheat
end

puts ''

gather(items) do |apple,*remaining_items|
  puts apple
  puts remaining_items.join(', ')
end

puts ''

gather(items) do |apples, corn, cabbage, wheat|
  puts [apples, corn, cabbage, wheat].join(', ')
end
