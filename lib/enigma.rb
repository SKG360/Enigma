
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
      special = ["!","@","#","$","%","^",
      "&","*","(",")","[","]","<",">",";",
      ":","/","?","\''","|", "'"]
      return letters_array + numbers_array + other + special
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
          (key[0..1].to_i + last_four_of_date_squared(date)[0].to_i) % character_map.length
      elsif type == 1
          (key[1..2].to_i + last_four_of_date_squared(date)[1].to_i) % character_map.length
      elsif type == 2
          (key[2..3].to_i + last_four_of_date_squared(date)[2].to_i) % character_map.length
      elsif type == 3
          (key[3..4].to_i + last_four_of_date_squared(date)[3].to_i) % character_map.length
      end
  end

  def decompose_to_array(message_string)
    message_string.split("").map do |character|
      character_hash[character.downcase]
    end
  end    

  def shift_character_index(array_of_index_nums)
      array_of_index_nums.map do |num|
        num + offset(array_of_index_nums.index(num) % 4)
        # binding.pry
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
    message= decompose_to_array(my_message)
    i = -1
    message.map do |value|
      i += 1
      character_hash.invert[value - offset(i % 4)]
    end.join
  end
end 



# my_message = "abcdabcd"             # File.read("message.txt")
# key = "82648"                       # rand(99999).to_s
# date = Date.new(2018,8,17)          # Date.today.strftime("%m%d%y")

# e = Enigma.new
# a = e.encrypt(my_message, key, date)
# b = e.decrypt(a, key, date)
