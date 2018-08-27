require 'pry'
require 'date'

class Enigma
    attr_reader :key # why is this here?

  def initialize
    @characters   = []
    @todays_date  = Date.today.strftime("%d%m%y")
  end

<<<<<<< HEAD
=======
  def encrypt(my_message, key = random_key, date = @todays_date)
    @date         = date
    @key          = key
    @my_message   = my_message

    # return encrypted_text(my_message, key, @date - @todays_date).join
  end
>>>>>>> af1180a301cbcdf3313c2f479b056d8e9b68b2ce

  def character_map
    letters_array = [*'a'..'z']
    numbers_array = [*'0'..'9']
    other = [" ", ".", ","]
<<<<<<< HEAD
    @characters = letters_array + numbers_array + other
=======
    return letters_array + numbers_array + other
>>>>>>> af1180a301cbcdf3313c2f479b056d8e9b68b2ce
  end # => full character array [a...,].count => 39

  def locate_self_in_array(unit)
    @index_location = 0
    while character_map[@index_location] != unit
      if character_map[@index_location] == unit
        return @index_location
      elsif @index_location += 1
      end
    end
    return @index_location
  end
  # default value 
  def random_key 
    key_string = ""
    5.times do
        key_string += rand(9).ceil.to_s
    end
    return key_string
  end # => five digit string

<<<<<<< HEAD
  # rename
  def encrypted_char(part)
      # date  =>  "240818"
      
      char_array    = character_map
      # char_array.count = 39

      date_square   = (@todays_date.to_i ** 2).to_s 
                                     # => "62909669124"
                                            # => "9124"
      offset_A      = date_square[-4].to_i  # => "9"
      offset_B      = date_square[-3].to_i  # =>  "1"
      offset_C      = date_square[-2].to_i  # =>   "2"
      offset_D      = date_square[-1].to_i  # =>    "4"

      @key = "82648"
      key_pair_A    = @key[0..1].to_i       # => "82"
      key_pair_B    = @key[1..2].to_i       # =>  "26"
      key_pair_C    = @key[2..3].to_i       # =>   "64"
      key_pair_D    = @key[3..4].to_i       # =>    "48"

      rotation_A    = offset_A + key_pair_A # =>  9+82 = 91
      rotation_B    = offset_B + key_pair_B # =>   1+26 = 27 
      rotation_C    = offset_C + key_pair_C # =>    2+64 = 66
      rotation_D    = offset_D + key_pair_D # =>     4+48 = 52

  end


  def encrypt_four(four_character_string_array)
    four_character_string_array.map do |character|
      locate_self_in_array(character.downcase)
=======
  # date.strftime("%d%m%y")
  def encrypted_piece(part)
    # date  =>  "240818"
    # key   =>  "82648"
    date_square = (@date.to_i ** 2).to_s # => "62909669124"
    offsets     = date_square[-4..-1]    # => "9124"
    rotation    = @key[0..1].to_i        # => "82"
    offset      = offsets[0].to_i        # => "9"

    #Refactor with an enumerable
    part.map.with_index do |char, index|
      encrypted_char(char, @key[index..index + 1].to_i, offsets[index].to_i)
    end

  end

    def encrypted_char(character, rotation, offset)

      char_array  = character_map
      sum = char_array.index(character) + rotation + offset
          # => "110"
      encrypted_char = char_array[sum % char_array.length]
>>>>>>> af1180a301cbcdf3313c2f479b056d8e9b68b2ce
    end
  end

<<<<<<< HEAD
  def message_array(message)
    message_slices = message.chars.each_slice(slice_length).to_a
    # => [["H", "i", " ", "t"], ["h", "e", "r", "e"], ["!"]]

  end

  def encryption_array(slice_length)

    encrypted_message_slices = []
    message_slices.map do |four_digit_slice|
      encrypt_four(four_digit_slice)
=======
    def encrypted_parts
      # turn message into parts
      message_parts = @my_message.chars.each_slice(4).to_a
      # encrypt each message part
      encrypted_message_parts = message_parts.map do |part|
        encrypted_piece(part)
        end
      encrypted_message_parts.join
    end

    def decrypt
      decrypted_slices = encrypted_parts.chars.each_slice(4).to_a
      decrypted_message_slices = decrypted_slices.map do |slice|
          decrypted_section(slice)
      end
      decrypted_message_slices
require "pry"; binding.pry
    end

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

>>>>>>> af1180a301cbcdf3313c2f479b056d8e9b68b2ce
    end
    encrypted_message_slices.join
  end

  def encrypt(my_message, key = random_key, date = @todays_date)
    @date         = date
    @key          = key
    @my_message   = my_message

    return encryption_array.join
  end
end

<<<<<<< HEAD
e = Enigma.new
# p e.encrypt("Hi there!")


=======

  # def encrypted_text(message)
  #   message_array(message).map do |four_digit_slice|
  #     encrypt_four(four_digit_slice)
  #   end.join
  # end
>>>>>>> af1180a301cbcdf3313c2f479b056d8e9b68b2ce
