require 'pry'
require 'date'

class Enigma
    attr_reader :key # why is this here?

  def initialize
    @characters   = []
    @todays_date  = Date.today.strftime("%d%m%y")
  end


  def character_map
    letters_array = [*'a'..'z']
    numbers_array = [*'0'..'9']
    other = [" ", ".", ","]
    return letters_array + numbers_array + other
  end # => full character array [a...,].count => 39

  def locate_self_in_array(unit)
    @index_location = 0
    character_map.each  do |character|
      if character == unit
        return @index_location
      elsif
        @index_location += 1
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

  def last_four(date)                          # => "240818"
    date_square   = (date.to_i ** 2).to_s # => "62909669124"
    date_square[-4..-1]                   # =>        "9124"
  end

  def offset_A(date, key)
    last_four(date)[-4].to_i + key[0..1].to_i
  end
  def offset_B(date, key)
    last_four(date)[-3].to_i + key[0..1].to_i
  end
  def offset_C(date, key)
    last_four(date)[-2].to_i + key[0..1].to_i
  end
  def offset_D(date, key)
    last_four(date)[-1].to_i + key[0..1].to_i
  end
  
  def encrypted_character(character, rotation_type)
    date = "260818"
    key = "57894"
    if rotation_type == "A"
      # NO IMPLICIT CONVERSION FIXNUM -> STRING
      # test these for typing?
      rotation = locate_self_in_array(character.downcase) + offset_A(date, key)
    elsif rotation_type == "B"
      rotation = locate_self_in_array(character.downcase) + offset_B(date, key)
    elsif rotation_type == "C"
      rotation = locate_self_in_array(character.downcase) + offset_C(date, key)
    elsif rotation_type == "D"
      rotation = locate_self_in_array(character.downcase) + offset_D(date, key)
    end

    new_index_num = rotation % character_map.count
    character_map[new_index_num]
    #working
  end 

  def encrypt_four(array)

    encrypted_four = []
    if array.count > 0
      encrypted_four << encrypted_character(array[0], "A")

      if array.count > 1
        encrypted_four << encrypted_character(array[1], "B")

        if array.count > 2
          encrypted_four << encrypted_character(array[2], "C")

          if array.count > 3
            encrypted_four << encrypted_character(array[3], "D")
          end
        end
      end
    end
    encrypted_four
  end

  def message_array(message)
    message.chars.each_slice(4).to_a
    # => [["H", "i", " ", "t"], ["h", "e", "r", "e"], ["!"]]
  end

  def encrypted_text(message)
    message_array(message).map do |four_digit_slice|
      encrypt_four(four_digit_slice)
    end.join
  end

  def encrypt(my_message, key = random_key, date = @todays_date)
    @date         = date
    @key          = key

    return encrypted_text(my_message, key, @date - @todays_date).join
  end
end

  def decrypt()
  end

e = Enigma.new
date = "260818"
key = "57894"
# binding.pry


