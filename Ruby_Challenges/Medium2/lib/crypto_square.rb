=begin
class Crypto:
  Methods:
    - normalize_plaintext:
      - Extract just alphanumerics and convert the word
        to downcase.

plaintext_segments() Method:
  Input: Phrase As a String
  Output: Array of Plaintext Segments
  
  Requirements:
    - Sub-Segment Size Is Determined By The Plaintext Size
  
  Algorithm: 
    Given a String: Normalize_Plaintext
      Initialize a Local Variable: Segment_Size = normalize_plaintext.size  
      Initialize a local variable: outcome = []
      Initialize a local variable: index = 0
      REPEAT UNTIL index == normalize_plaintext_size
        SET word = ''
        REPEAT UNTIL (index + 1) % plaintext_size == 0
          SET char = normalize_plaintext(index)
          ADD normalize_plaintext(index) to word UNLESS char is nil?
          ITERATE index up by 1
        END
        APPEND word to outcome
      END
      RETURN outcome
      
ciphertext() Algorithm:
  Input: Array of plaintext_segments
  Output: Array of The Message Encoded With Columns Down
  
  Requirements:
    - Encoded Text is Grouped By Column
    - Code Message Obtained by Reading Down the Columns going left to right.
    
  Algorithm:
    Given an array of strings from plaintext_segments: segments:
      SET a local variable: outcome = []
      SET largest_segment_size = MAP(segments.size)#max
      LOOP 0#upto (largest_segment_size - 1): |index|
        SET local variable: word = ''
        ITERATE through each segment of plaintext_segments: |segment|
          ADD segment[index] to word
        END
        APPEND word to outcome
      RETURN outcome
  
ciphertext()s
  Algorithm:
    Given an array of strings from plaintext_segments: segments:
      SET a local variable: outcome = []
      SET largest_segment_size = MAP(segments.size)#max
      LOOP 0#upto (largest_segment_size - 1): |index|
        SET local variable: word = ''
        ITERATE through each segment of plaintext_segments: |segment|
          ADD segment[index] to word
        END
        APPEND word to outcome
      RETURN outcome

plaintext_segments():
  Given a String: normalize_plaintext
      Initialize a Local Variable: Segment_Size = normalize_plaintext.size  
      Initialize a local variable: outcome = []
      Initialize a local variable: index = 0
      REPEAT-UNTIL index == normalize_plaintext_size
        SET word = ''
        REPEAT-UNTIL (index + 1) % plaintext_size == 0
          SET char = normalize_plaintext(index)
          ADD normalize_plaintext(index) to word UNLESS char is nil?

          ITERATE index up by 1
        END
        APPEND word to outcome
      END 
      RETURN outcome
=end

class Crypto
  def initialize(phrase)
    @text = phrase  
  end
  
  def normalize_plaintext
    @text.chars.select do |char|
      char.match?(/[a-z0-9]/i)
    end.join.downcase
  end
  
  def size
    normalized_size = normalize_plaintext.size
    Math.sqrt(normalized_size).ceil
  end
  
  def plaintext_segments
    word = ''
    index = 0
    outcome = []
    segment_size = size
    text = normalize_plaintext

    while index < normalize_plaintext.size
      word += text[index] unless text[index].nil?
  
      if (index + 1) % segment_size == 0
        outcome << word
        word = ''
      end

      index += 1
    end

    outcome << word unless word.empty?
    outcome
  end
  
  def ciphertext
    largest_segment_size = plaintext_segments.map(&:size).max
    0.upto(largest_segment_size - 1).map do |index|
      word = ''
      plaintext_segments.each do |segment| 
        word += segment[index] unless segment[index].nil?
      end
      word
    end.join
  end
  
  def normalize_ciphertext
    largest_segment_size = plaintext_segments.map(&:size).max
    0.upto(largest_segment_size - 1).map do |index|
      word = ''
      plaintext_segments.each do |segment| 
        word += segment[index] unless segment[index].nil?
      end
      word
    end.join(' ')
  end
end
