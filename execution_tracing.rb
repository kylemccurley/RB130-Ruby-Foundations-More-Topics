# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end                                                # clears screen first, then outputs "> hi there"


# Execution starts at method invocation: Line 8

# 8, 2, 3, 9, 4, 5

# 8: Method invoked for the say() method.
# 2: The method local variable words is assigned to the string 'hi there'. 
# 3: The yield keyword invokes a block passed into the method, if the return value of the Kernel#block_given instance method is truthy, which in this example it is.
# 9: The block is executed, the string 'clear' is passed into the Kernel#system instance method.
# 4: After the block is executed, execution reverts back to line 4, printing '> ' along with the words assigned to the method local variable words.
# 5: Line 5 marks the conclusion of the say(words) method using the end keyword.

#-------------------------------------------------------------------------------------


# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end

=begin
  Trace the Code Execution:
  ---------------------------------------------------
  1. Execution starts with method invocation on line 10.
  2. Method local variable |number| is assigned the integer 5 on line 2.
  3. Conditional is evaluated as to whether the method has received a block. 
  4. Since a block was given to the increment(number) method, execution moves to line 4 where the yield keyword passes in the argument of number + 1. 
  5. Execution moves to line 10, where the block parameter num is assigned the value of number + 1, which is 6. So the block parameter num is assigned the value 6.
  6. Execution moves to line 11, where the block parameter num is passed into the Kernel#puts method. This prints the value of the block parameter num to the console.
  7. After the block has been executed, the program moves to line 6, since the if statement has already been executed. This returns the local variable number incremented up by 1. It is returned because it is at the very end of the increment(number) method.
  8. On line 6, the end keyword is defined, ending the increment(number) method.
=end
