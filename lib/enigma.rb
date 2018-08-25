require 'pry'

class Enigma
  def initialize
    @characters   = []
  end

  def encrypt(my_message, key, date)
    @date         = date
    @key          = key
    @my_message   = my_message
  end

  def character_map
    letters_array = [*'a'..'z']
    numbers_array = [*'0'..'9']
    other = [" ", ".", ","]
    @characters = letters_array + numbers_array + other
  end

end

