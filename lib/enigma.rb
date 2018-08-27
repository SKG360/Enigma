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
  def encrypted_piece(part)
    # date  =>  "240818"
    # key   =>  "82648"
    date_square = (@date.to_i ** 2).to_s # => "62909669124"
    offsets     = date_square[-4..-1]    # => "9124"
    rotation    = @key[0..1].to_i        # => "82"
    offset      = offsets[0].to_i        # => "9"

    # encrypted_index_a = encrypted_char(part[0]), @key[0..1].to_i, offsets[0].to_i)
    # encrypted_index_b = encrypted_char(part[1]), @key[1..2].to_i, offsets[1].to_i)
    # encrypted_index_c = encrypted_char(part[2]), @key[2..3].to_i, offsets[2].to_i)
    # encrypted_index_d = encrypted_char(part[3]), @key[3..4].to_i, offsets[3].to_i)

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
    end

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
    end

    def decrypted_section(slice)
      date_square = (@date.to_i ** 2).to_s # => "62909669124"
      offsets     = date_square[-4..-1]    # => "9124"
      rotation    = @key[0..1].to_i        # => "82"
      offset      = offsets[0].to_i        # => "9"

      slice.map.with_index do |char, index|
        decrypted_char(char, @key[index..index + 1].to_i, offsets[index].to_i)
      end
    end

    def decrypted_char(character, rotation, offset)
      char_array  = character_map.reverse

      sum = char_array.index("6") + rotation + offset

      encrypted_char = char_array[sum % char_array.length]
    end
end
