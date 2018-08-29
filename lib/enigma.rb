require 'pry'
require 'date'

class Enigma
    attr_reader :key, :date

  def initialize
    @characters   = []
    @todays_date  = Date.today.strftime("%m%d%y")
  end

  def encrypt(my_message, key = random_key, date = @todays_date)
        @date  = date
        @key   = key
    return encrypted_parts(my_message).join
  end

  def character_map
    letters_array = [*'a'..'z']
    numbers_array = [*'0'..'9']
    other         = [" ", ".", ","]
    return letters_array + numbers_array + other
  end # => full character array [a...,].count => 39

  def random_key
    key_string = ""
    5.times do
        key_string += rand(9).ceil.to_s
    end
    return key_string
  end # => five digit string

  def encrypted_char(character, rotation, offset)
    char_array  = character_map
    sum = char_array.index(character).to_i + rotation + offset
    char_array[sum % char_array.length]  # => "string"
  end # => character = "t"

  def encrypted_piece(part)
    # date  =>  "240818"
    # key   =>  "82648"
    date_square = (@todays_date.to_i ** 2).to_s # => "62909669124"
    offsets     = date_square[-4..-1]           # => "9124"
    rotation    = @key[0..1].to_i               # => "82"
    offset      = offsets[0].to_i               # => "9"
    #Refactor with an enumerable
    part.map.with_index do |char, index|
      encrypted_char(char, @key[index..index + 1].to_i, offsets[index].to_i)
    end
  end
  #
  def encrypted_parts(my_message)

    message_parts = my_message.chars.each_slice(4).to_a
    encrypted_message_parts = message_parts.map do |part|
      encrypted_piece(part)
    end
    encrypted_message_parts
  end
  # => "encrypted message string"
  def decrypt(encrypted_sting, key, date)
    decrypted_slices = encrypted_parts(encrypted_sting).each_slice(4).to_a

    decrypted_message_slices = decrypted_slices.map do |slice|
        decrypted_section(slice)
    end
    decrypted_message_slices
    # require "pry"; binding.pry
  end
  #
  def decrypted_section(slice)
    # - - - - Refactor as separate method - - - -  #
    date_square = (@date.to_i ** 2).to_s # => "62909669124"
    offsets     = date_square[-4..-1]    # => "9124"
    rotation    = @key[0..1].to_i        # => "82"
    offset      = offsets[0].to_i        # => "9"
    # - - - - -seprate method - - - -  - - - - - -#

    slice.map.with_index do |char, index|
      decrypted_char(char, @key[index..index + 1].to_i, offsets[index].to_i)
    end
  end

  def decrypted_char(character, rotation, offset)
    char_array  = character_map.reverse
    sum = char_array.index(character) + rotation + offset
    encrypted_char = char_array[sum % char_array.length]
    encrypted_char
  end
end

#
# e = Enigma.new
# e.decrypt("Hi", "82648", Date.today)
