=begin
  Algorithm Summary: Given an array: arr
    - Initialize a local variable: outcome
      - Set to an empty array
    - Initialize a local variable: encountered_false
      - Set to false
    - Iterate through each element of arr: |el|
      - If the yield to a block passing in el returns false.
        - Set encountered_false to true.
      - Append el to outcome if encountered_false.
    - Return outcome
    
    Formal Pseudo-Code: Given an array: arr
-------------------------------------------
    SET outcome to []
    SET encountered_false to false
    LOOP each element in array: |el|
      IF yield(el) == false
        SET encountered_false = true
      END
      APPEND el to outcome IF encountered_false
    END
    RETURN outcome
=end

def drop_while(array)
  outcome = []
  encountered_false = false

  array.each do |el| 
    encountered_false = true if yield(el) == false
    outcome << el if encountered_false
  end
  
  outcome
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
