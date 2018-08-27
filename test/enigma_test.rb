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

  def test_the_message_string_exists
    e = Enigma.new
    my_message = "this is so secret ..end.."
    assert_instance_of String, e.encrypt(my_message, "12345", Date.today.strftime("%d%m%y"))
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
    actual = e.random_key.length
    assert_equal 5, actual
  end

    # to prevent letters, or characters from being in key
  def test_it_rejects_non_integer_string_character
    key = "a5555"
    assert_equal 0, key.to_i
  end

  def test_one_encrypted_char
    # skip
    e = Enigma.new
    date = Date.new(2017,8,26).strftime("%d%m%y")
    key = "82648"
    actual = e.encrypted_char("this is so secret ..end.."[0], key[0..1].to_i, "9".to_i)
    assert_equal "6", actual
  end

  def test_one_sliced_message_part
    # skip
    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    e.encrypt("this is so secret ..end..", key, date)
    assert_equal ["4", ",", "9", "5"], e.encrypted_parts[0..3].chars
  end

  def test_the_encrypted_message
    # skip
    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    expected = "4,95iagk3gy5p7fr42zlpf4lj"
    assert_equal expected, e.encrypt("this is so secret ..end..", key, date)
  end

  def test_full_phrase_encryption
    e = Enigma.new
    date = Date.today.strftime("%d%m%y")
    key = "82648"
    e.encrypt("this is so secret ..end..", key, date)
    expected = "4,95iagk3gy5p7fr42zlpf4lj"
    assert_equal expected, e.encrypted_parts
  end


  # def test_one_to_four_digit_encryption
  #   skip
  #   #more important than it seems
  #   #try translating a nil string!
  #   e = Enigma.new
  #   assert_equal "1", e.encrypt_four(["a"])
  #   assert_equal "1u", e.encrypt_four(["a","b"])
  #   assert_equal "1uw", e.encrypt_four(["a","b","c")
  #   assert_equal "1uwz", e.encrypt_four(["a","b","c","d"])
  # end

 
end
