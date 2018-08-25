require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'

require 'pry'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_the_message_string
    e = Enigma.new
    my_message = "this is so secret ..end.."
    expected = "this is so secret ..end.."
    assert_equal expected, e.encrypt(my_message, "12345", Date.today)
  end

  def test_for_character_map
    e = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal expected, e.character_map
  end

end
