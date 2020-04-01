=begin
  Rule 1: If a word begins with a vowel sound,
    add an "ay" sound to the end of the word.

  Rule 2: If a word begins with a consonant sound,
    move it to the end of the word, and then add an "ay"
    sound to the end of the word.

  Identify Expected Inputs/Outputs:
    Input: String of Word or Phrase (String)
    Output: String of Word(s) translated to PigLatin

  Rules/Requirements:
    => Should be Able to Translate a Phrase
      > Separate Individual Words (Spaces)

    => Word Begins With a Vowel:
      > Add an 'ay' to the end of the word

    => Word Begins with Consonant:
      > Move Consonant-Sounding Letter-Pairs to
        end of the word.
      > Add an 'ay' to the end of the newly translated word.

    ** Need to use Reg-Ex to identify consonant-sounding
       letter-pairs occuring at the beginning of the word.

    Data Structure:
      Array: List of Matched Consonant Char Sets
      Boolean: Indicator for a match with vowel

    Mental Model:
      Write a program that translates a given word into PigLatin.
      All words will have the string 'ay' appended to the end. Words
      with a consonant at the beginning will have the consonant set
      moved the end, then the appended 'ay'. Words with a vowel at the
      beginning will just have 'ay' appended to the end.

    Algorithm:
      Objective: Append 'ay' to a given word,
      if consonant is set at the beginning, move consonant set the end.
      > SET local variable: regex_consonant_check:
        - Set to the Regex for consonants at the beginning of the string.
      > IF consonant_check match (String#match?(regex)):
        - SET local variable: consonant_char_set:
          -> Output of String#match(regex_cons...)
        - DELETE consonant_char_set FROM word
      > RETURN word + 'ay'

  REGEX for Finding First Consonants Within the Character Set:
    /^[^aeiou]/
=end

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, the_rest_of_word = parse_for_consonant(word)
      the_rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.begins_with_vowel_sound?(word)
    %w(a e i o u).include?(word[0])
    word.match?(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.parse_for_consonant(word)
    consonant_regex = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/
    consonant_split = word.match(consonant_regex)
    [consonant_split[1], consonant_split[2]]
  end
end
