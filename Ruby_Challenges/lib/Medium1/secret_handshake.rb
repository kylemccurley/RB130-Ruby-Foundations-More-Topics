=begin
Write a program that will take a decimal number, and convert it 
to the appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those who don't.
You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

Identify Expected Inputs and Outputs:
-------------------------------------
  Input: 
    - String (Binary)
    - Integer(Decimal)

  Output:
    - Array of Commands
  
Identify Expected Rules/Requirements:
-------------------------------
  1. Convert the integer decimal to a binary (Base-2) string (Integer#to_s(base))
  2. Return 0 if an invalid binary string is passed


PROBLEM DOMAIN:
-------------------------------
-1 -> 'wink'
-2 -> 'double blink'
-3 -> 'close your eyes'
-4 -> 'jump'

-5 -> Reverse the order of the operations in the secret handshake.

  
Algorithm for CONSTRUCTOR method: 
  Objective/Purpose of Method: Process the input
    Given a string or an integer: input
      > IF input's class is an Integer
        > SET @number = intput#to_s(2)
      > IF the inputs class is a String:
        > SET @number = CHECK_BINARY(input)
  
Algorithm for COMMANDS method:
  Objective/Purpose of Method: Convert input to array of commands
    Given an instance variable containing a string: @number

      SET COMMAND_KEY constant to hash:
        -1 => 'wink'
        -2 => 'double blink'
        -3 => 'close your eyes'
        -4 => 'jump'

      > SET a local variable: outcome
        > []
      > LOOP from (-4 upto -1): |command|
        > NEXT unless @number[command] == '1'
        > APPEND @number[command] to outcome
      > IF @number[-5] == '1'
        > REVERSE outcome

Algorithm for CHECK_BINARY method:
  Objective: Check whether the given string is a valid binary number
    Given a string: input_string
      IF ALL characters in input string are 0s and 1s:
        RETURN input_string
      OTHERWISE:
        RETURN 0
=end

class SecretHandshake
  COMMAND_KEY = {
    -1 => 'wink',
    -2 => 'double blink',
    -3 => 'close your eyes',
    -4 => 'jump'
  }

  def initialize(user_input)
    if user_input.class == Integer
      @number = user_input.to_s(2)
    else
      @number = check_binary(user_input)
    end
  end
    
  def commands
    output = []

    (-1).downto(-5) do |command|
      next unless @number[command] == '1'
      return output.reverse if command == -5

      output.append(COMMAND_KEY[command])
    end

    output
  end

  private

  def check_binary(str)
    if str.chars.all? { |char| %w(0 1).include?(char) }
      return str
    end
    0
  end
end
