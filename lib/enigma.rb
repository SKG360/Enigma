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
  def encrypted_char(part)
      # date  =>  "240818"
      # key   =>  "82648"
      char_array  = character_map
      date_square = (@date.to_i ** 2).to_s # => "62909669124"
      offsets     = date_square[-4..-1]    # => "9124"
      rotation    = @key[0..1].to_i        # => "82"
      offset      = offsets[0].to_i        # => "9"
      sum = char_array.index(part[0]) + rotation + offset
                                           # => "110"
      encrypted_char = char_array[sum % char_array.length]

    end

    def encrpyted_parts
      # turn message into parts
      message_parts = @my_message.chars.each_slice(4).to_a
      # encrypt each message part
      # encrypted_message_parts = []
      encrypted_message_parts = message_parts.map do |part|
        part.map do |mini_part|
        encrypted_char(mini_part)
        end
      end
      encrypted_message_parts
      require "pry"; binding.pry
    end
end
