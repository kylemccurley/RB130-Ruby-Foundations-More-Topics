=begin
  Given 2x arrays: arr1, arr2:
    - Initialize a local variable: output
      - Set to an empty array: []
    - Initialize a local variable: index
      - Set to 0
    - Enter into a loop that breaks when index is the array's size:
      - Append the array [arr1[index], arr2[index]] to output
    - Return output
    
    FORMAL:
    
  SET output to []
  SET index to 0
  REPEAT-UNTIL index == arr.size
    APPEND [arr1[index], arr2[index]] to output
  END
  RETURN output
=end

def zip(arr1, arr2)
  output = []

  0.upto(arr1.size - 1) do |index|
    element1 = arr1[index]
    element2 = arr2[index]
    output << [element1, element2]
  end
  
  output
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
