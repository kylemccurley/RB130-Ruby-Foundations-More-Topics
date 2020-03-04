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
