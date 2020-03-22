# Write a program that given a phrase can count the 
# occurrences of each word in that phrase.

=begin
Algorithm for word_count:
  - Initialize an empty hash: outcome
  - Iterate through each unique element of @sentence: |word|
    - Set the key to word, set the count of word in @sentence as value
  - Return the outcome array
  
  SET outcome = {}
  LOOP unique elements of @sentence
    SET outcome[word] = @sentence.split(' ').count(word)
  END
  RETURN outcome
  
  NEED TO MODIFY THE ALGORITHM FOR DETECTING WORDS:
    - Initialize a local variable: words
      - Set to []
    - Initalize a local variable: word
      - Set to an empty string
    - Iterate through each individual character of sentence: |char|
      - If the character is an alphabetical letter:
        - Add char to word
      - Otherwise: (This means there is a punctuation mark, space, or number)
        - Add word to words
        - Set word to an empty string
    - Return words

  Bug Tracker:
    - Program not including the last word in sentence
    
  Hint: Use Reg-Ex!
  
  Algorithm for detect_words:
    - String#scan generates an array of all of the matches specified in the argument.
    - Match?
=end

class Phrase
  def initialize(sentence)
    @sentence = sentence.downcase
  end
  
  def word_count
    matches = @sentence.scan(/\b[\w']+\b/)
    output = {}
    matches.uniq.each do |word|
      output[word] = matches.count(word)
    end
    output
  end
end
