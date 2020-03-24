class SentenceReverse
  def initialize(sentence)
    @sentence = sentence  
  end
  
  def reverse
    sentence = @sentence.split(' ')
    reversed_sentence = []

    sentence.each_with_index do |word, position|
      if position == sentence.size - 1 && position.odd?
        reversed_sentence << word[0..-2].reverse + word[-1]
      elsif position.odd?
        reversed_sentence << word.reverse
      else
        reversed_sentence << word
      end
    end

    reversed_sentence.join(' ')
  end
end
