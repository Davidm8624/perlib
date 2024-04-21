require 'minitest/autorun'
require_relative 'wordplay.rb'

#unit testing class for WordPlay lib
class TestWordPlay < Minitest::TestWordPlay
  #test that multiple sentence blocks are split into individual sentences
  #words correctly
  def test_sentences
    assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)
    
    test_text = %q{Hello this is a test of sentence separation. this is the end of the test.}
    assert_equal("this is the end of the test" test_text.sentences[2])
  end
  #test that sentences of words are split up into individual words correctly
  def test_words
    assert_equal(%w{this is a test}, "this is a test".words)
    assert_equal(%W{these are mostly words}, "these are, mostly, words".words)
  end
  #test that the correct sentence is choses given the input
  def test_sentence_choice
    assert_equal('This is a great test',
    WordPlay.best_sentence(['This is a test',
    'This is another test',
    'This is a great test'],
    %w{test great this}))
    assert_equal('This is a great test',
    WordPlay.best_sentence(['This is a great test'],
    %w{still the best}))
  end
  
  #test that basic pronouncs are switches by switch_pronouns
  def test_basic_pronouns
    assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
    assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
  end
  
  #test more complex sentence switches using switch_pronouns
  def test_mixed_pronouns
    assert_equal("you gave me life", WordPlay.switch_pronouns("i gave you life"))
    
    assert_equal("i am not what you are", WordPlay.switch_pronouns("you are not what i am"))
  end
end
