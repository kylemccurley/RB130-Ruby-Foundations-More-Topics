=begin
Objective/Mental Model:
  Take a string as a word problem, and return the answer to the word problem as
  an integer.

Data Structure:
  - Keywords for Computations?
      {
    - 'plus' -> :+
    - 'minus' -> :-
      }
  - 'accumulator' for the final output of answer(), INTEGER

Approach:
    SPLIT phrase only into the essential keywords. (Integers, Keywords)
    ITERATE through each word of essential-phrase using counter:
      IF a keyword is encountered:
        SEND 'keyword' + element_at(counter + 1) to accumulator integer
      ELSIF an integer is encountered:
        SET outcome = integer (First integer in the sequence)
      END
    RETURN accumulator value
=end

class WordProblem
  OPERATIONS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }

  def initialize(phrase)
    @words = cleanup(phrase)
  end

  def answer
    outcome = 0
    counter = 0
    loop do
      break if counter >= (@words.size - 1)

      word = @words[counter]
      if keyword?(word)
        outcome = outcome.public_send(OPERATIONS[word], @words[counter += 1].to_i)
      elsif integer?(word)
        outcome = word.to_i
      end

      counter += 1
    end

    outcome
  end

  private

  def keyword?(word)
    OPERATIONS.keys.include?(word)
  end

  def integer?(word_number)
    word_number.to_i != 0
  end

  def cleanup(phrase)
    words = phrase.split(' ')
    raise ArgumentError unless words.any? { |word| OPERATIONS.keys.include?(word) }

    words = words.select { |word| OPERATIONS.keys.include?(word) || word.to_i != 0 }
    words.map { |word| word.chars.select { |char| char.match?(/([a-z]|\d|-)/i) }.join }
  end
end
