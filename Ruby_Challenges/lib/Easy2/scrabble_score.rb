=begin
  Input: Word as a String
  Output: Scrabble Score as an Integer
  
  Requirements:
    > Needs to be case insensitive
    > Calculating the Scrabble Score from
    the individual scores of each letter.
  
  Algorithm PseudoCode:
  > score Method
    > Given a word as a string: word
      - Initialize a constant: LETTER_SCORE:
          Set each key to an array of same-scored letters
          Set each value to the score for the group of letters
      - Initialize a local variable: scores: Set to an empty array
      - Iterate through each character of word: letter
        - Calculate the score by passing letter into calculate_letter_score method
        - Append the output of calculate_letter_score method to scores array
      - Inject the addition operator into the scores array
        - Implicit return for the total score
  
  > calculate_letter_score Method:
    > Given a letter as a string: letter
        - Iterate through each key-value pair of LETTER_SCORES: |score_group, score_value|
          - If letter is included in score_group:
            - Return score_value
        - Return 0: (Input is not a letter, so it does not have a value)
=end

class ScrabbleCalculator
  LETTER_SCORES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
}
  def initialize(word)
    @word = word
  end

  def score
    scores = []
    @word.chars.each do |letter|
      scores << calculate_letter_score(letter)
    end
    scores.inject(:+)
  end

  def calculate_letter_score(letter)
    LETTER_SCORES.each do |score_group, score_value|
      return score_value if score_group.include?(letter)
    end
    0 # Given argument is not a letter, so it does not have a value
  end
end
