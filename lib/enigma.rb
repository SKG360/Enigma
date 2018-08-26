require 'pry'

class Enigma
    attr_reader :key

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

  def generate_key #default value for 
    key_string = ""
    5.times do
        key_string += rand(9).ceil.to_s
    end
    return key_string
  end

  # date.strftime("%d%m%y")

end

