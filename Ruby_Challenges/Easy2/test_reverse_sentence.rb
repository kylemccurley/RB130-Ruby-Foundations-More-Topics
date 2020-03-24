require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/reverse_sentence'

class TestSentenceReverser < Minitest::Test
  def test_reverse_words
    input = SentenceReverse.new('Whats the matter with Kansas.')
    assert_equal 'Whats eht matter htiw Kansas.', input.reverse
  end
  
  def test_keep_terminating_point
    input = SentenceReverse.new('What is going on with Kyle.')
    assert_equal 'What si going no with elyK.', input.reverse
  end
end
