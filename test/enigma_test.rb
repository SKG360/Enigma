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
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal expected, e.character_map
  end

  def test_that_it_generates_five_character_key_string
    e = Enigma.new
    actual = e.generate_key.length
    assert_equal 5, actual
  end

    # to prevent letters, or characters from being in key
  def test_it_rejects_non_integer_string_character
    e = Enigma.new
    key = "a5555"
    date = Date.new(2017,8,26)
    e.encrypt("Hello", key, date)
    assert_equal 0, e.key.to_i
  end

  def test_it_converts_key_string_to_integer
    e = Enigma.new
    date = Date.new(2017,8,26)
    key = "55555"
    e.encrypt("Hello", key, date)
    assert_equal 55555, e.key.to_i
  end

  def test_one_encrypted_char
    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    e.encrypt("this is so secret ..end..", key, date)
    assert_equal "6", e.encrypted_char(['t','h','i','s'])
  end

  def test_one_sliced_message_part

    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    e.encrypt("this is so secret ..end..", key, date)
    assert_equal ["6", "u", "v", "5"], e.encrpyted_parts
  end

  def test_the_encrypted_message

    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    e.encrypt("this is so secret ..end..", key, date)
    expected = "6uv5kv5k51k5rp4r6kllr0qll"
    assert_equal expected, e.encrpyted_parts
  end



end
