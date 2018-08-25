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

    assert_equal "this is so secret ..end..", e.encrypt(my_message, "12345", Date.today)

  end
end
