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
    skip
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
    skip
    e = Enigma.new
    actual = e.generate_key.length
    assert_equal 5, actual
  end

    # to prevent letters, or characters from being in key
  def test_it_rejects_non_integer_string_character
    skip
    e = Enigma.new
    key = "a5555"
    date = Date.new(2017,8,26)
    e.encrypt("Hello", key, date)
    assert_equal 0, e.key.to_i
  end

  def test_it_converts_key_string_to_integer
    skip
    e = Enigma.new
    date = Date.new(2017,8,26)
    key = "55555"
    e.encrypt("Hello", key, date)
    assert_equal 55555, e.key.to_i
  end
    
  









  #test_default_date_is_today


  #test_default_key_is_generated



  def test_it_calculates_last_four_of_date
    e = Enigma.new
    date = "260818"
    assert_equal "9124", e.last_four(date)
  end


  def test_it_calculates_ecryption_rotations
    skip
    e = Enigma.new
    date = "260818"
    key = "57894"
    assert_equal 66, e.offset_A(date, key)
    assert_equal 58, e.offset_B(date, key)
    assert_equal 59, e.offset_C(date, key)
    assert_equal 61, e.offset_D(date, key)
  end

  def test_different_types_same_character
    e = Enigma.new
    assert_equal "1", e.encrypted_character("a", "A")
    assert_equal "t", e.encrypted_character("a", "B")
    assert_equal "u", e.encrypted_character("a", "C")
    assert_equal "w", e.encrypted_character("a", "D")
  end
  
  def test_same_type_different_character
    e = Enigma.new
    assert_equal "1", e.encrypted_character("a", "A")
    assert_equal "2", e.encrypted_character("b", "A")
    assert_equal "3", e.encrypted_character("c", "A")
    assert_equal "4", e.encrypted_character("d", "A")
  end



  def test_one_to_four_digit_encryption
    #more important than it seems
    #try translating a nil string!
    e = Enigma.new
    assert_equal "1", e.encrypt_four(["a"])
    assert_equal "1u", e.encrypt_four(["a","b"])
    assert_equal "1uw", e.encrypt_four(["a","b","c")
    assert_equal "1uwz", e.encrypt_four(["a","b","c","d"])
  end

  def test_it_can_encrypt_phrase
    e = Enigma.new
    assert_equal "8x57cqd f4xw", e.encrypted_text("Hello World!")
    assert_equal "81tt3t7t9qaw,3rccqw3i w3945w", e.encrypted_text("Hi, can I talk to Churchill?")
  end
end
