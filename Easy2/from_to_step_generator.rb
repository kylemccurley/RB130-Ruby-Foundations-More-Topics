=begin
Algorithm: Given a starting value, ending value, and a step:
  - Initialize a local variable counter to starting_value
  - Enter into a loop that breaks when counter is larger than 
    ending value:
      - Yield to a block; pass in counter as an argument
      - Iterate counter up by 1
  - Return counter

    +-------------+
    |FORMAL PSEUDO|
    +-------------+
Given a: (starting_value, ending_value, and a step_range):

  SET counter to starting_value
  REPEAT-UNTIL counter > ending_value
    YIELD(counter)
    ITERATE counter by 1
  END
  RETURN counter
=end

def step(starting_value, ending_value, step)
  counter = starting_value
  while counter <= ending_value
    yield(counter)
    counter += step
  end
  counter
end

step(1, 10, 3) { |value| puts "value = #{value}" }
