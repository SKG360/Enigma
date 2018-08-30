
require 'pry'
require 'date'

class Enigma
  attr_reader :key

  def initialize
      @characters  = []
      # @date = Date.new(2018,8,27)
      # "270818"
  end

  def date(date = Date.today)
    @date = date
  end

  def key
    rand(99999).to_s
    return "80818"
  end

  def datestamp
    @date.strftime("%d%m%y")
  end

  def character_map
      letters_array = [*'a'..'z']
      numbers_array = [*'0'..'9']
      other = [" ", ".", ","]
      # special = ["!", "@", "#", "$", "%", "^", 
      # "&", "*", "(", ")", "[", "]", "<", ">", ";", 
      # ":", "/", "?", "\'", "|",  "'"]
      return letters_array + numbers_array + other #+ special
  end #this is good because it scales

  def character_hash
      hash = {}
      character_map.each do |char|
          hash[char] = character_map.index(char)
      end
      hash
  end

  def last_four_of_date_squared(date)
      integer_date = date.strftime("%d%m%y").to_i # => MMDDYY
      squared = (integer_date ** 2).to_s
      last_four = squared[-4..-1]
  end

  def offset(type)
      if type == 0
          (key[0..1].to_i + last_four_of_date_squared(date)[0].to_i)
      elsif type == 1
          (key[1..2].to_i + last_four_of_date_squared(date)[1].to_i)
      elsif type == 2
          (key[2..3].to_i + last_four_of_date_squared(date)[2].to_i)
      elsif type == 3
          (key[3..4].to_i + last_four_of_date_squared(date)[3].to_i)
      end
  end

  def encrypt(my_message, key = random_key, date = @todays_date)
        @date  = date
        @key   = key
    return encrypted_parts(my_message).join
  end

  def random_key
    key_string = ""
    5.times do
        key_string += rand(9).ceil.to_s
    end
    return key_string
  end # => five digit string

  def decompose_to_array(message_string)
    message_string.split("").map do |character|
      character_hash[character.downcase]
    end
  end    

  def shift_character_index(array_of_index_nums)
    i = -1  
    array_of_index_nums.map do |num|
      i += 1
      (num + (offset(i % 4)) ) % character_map.length
    end
  end

  def unshift_character_index(array_of_index_nums)
    i = -1  
    array_of_index_nums.map do |num|
      i += 1
      (num - (offset(i % 4)) ) % character_map.length
    end
  end
  
  def encrypt(my_message, key, date)
    @key = key
    @date = date
    shift_character_index(decompose_to_array(my_message)).map do |value|
      character_hash.invert[value]
    end.join
  end

  def decrypt(my_message, key, date)
    @key = key
    @date = date

    unshift_character_index(decompose_to_array(my_message)).map do |value|
      character_hash.invert[value]
    end.join
  end
end 

