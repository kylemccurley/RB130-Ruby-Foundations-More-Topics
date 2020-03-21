=begin
Write a program that, given a word and a list of possible anagrams,
selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" 
"google" "inlets" "banana" the program should return a list containing "inlets".
Please read the test suite for exact rules of anagrams.

Objective:
  Select the correct sublist that contains the anagrams of a word
  Input: String, Array of possible anagrams as strings
  
Algorithm for detecting an anagram:
  - Initialize an empty array: anagrams -> []
  - Iterate through each string of anagram_candidates: |candidate|
    - Sort the String#chars of candidate
    - If the sorted candidate is the same as the sorted control_word
      - Append candidate to the anagrams array
      
  SET anagrams = []
  LOOP anagram_candidates do |candidate|
    IF candidate.chars.sort == @control.chars.sort
      APPEND candidate to anagrams
  RETURN anagrams
=end

class Anagram
  def initialize(control_word)
    @control = control_word
  end
  
  def match(anagram_candidates)
    outcome = []
    candidates.each do |candidate|
      outcome << candidate if anagram?(candidate)
    end
    outcome
  end
  
  private
  
  def anagram?(candidate)
    candidate.downcase.chars.sort == @control.downcase.chars.sort &&
    candidate.downcase != @control.downcase
  end
end
