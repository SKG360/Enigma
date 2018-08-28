require 'pry'
require 'date'

class Enigma

    def initialize
        @characters  = []
        @date = Date.today
        @date = Date.new(2018,8,27)
        # "270818"
        @key = "12345"
    end

    def character_map
        letters_array = [*'a'..'z']
        numbers_array = [*'0'..'9']
        other = [" ", ".", ","]
        return letters_array + numbers_array + other
    end

    def character_hash
        hash = {}
        character_map.each do |char|
            hash[char] = character_map.index(char)
        end
        hash
    end

    def random_key 
        rand(99999).to_s
    end # => five digit string

    def last_four_of_date_squared(date)
        integer_date = date.strftime("%d%m%y").to_i # => MMDDYY
        squared = (integer_date ** 2).to_s
        last_four = squared[-4..-1]
    end

    def offset_A
        @key[0..1].to_i + last_four_of_date_squared(@date)[0].to_i
    end

    def offset_B
        @key[1..2].to_i + last_four_of_date_squared(@date)[1].to_i
    end

    def offset_C
        @key[2..3].to_i + last_four_of_date_squared(@date)[2].to_i
    end

    def offset_D
        @key[3..4].to_i + last_four_of_date_squared(@date)[3].to_i
    end

    def decompose_array(string)
        array = string.split("")
        lowercased = array.map do |element|
            element.downcase
        end
    end

    def produce_index_array(array)
        array.map do |element|
            character_hash[element]
        end
    end

    def apply_offset_rotations(array)
        current = array.map do |element|
            character_hash[element]
        end
        current.map do |element|
            if current.index(element) % 4 == 0
                current.index(element) + offset_A
            elsif current.index(element) % 4 == 1
                current.index(element) + offset_B
            elsif current.index(element) % 4 == 2
                current.index(element) + offset_C
            else current.index(element) % 4 == 3
                current.index(element) + offset_D
            end
        end
    end

    def encrypt(my_message, key, date)
        array = decompose_array(my_message)
        offsets = produce_index_array(array)
        new_index = apply_offset_rotations(offsets)

        new_index.map do |element|
            character_hash.invert[element]
        end.join
    end
    


end


my_message = "this is so secret ..end.."
key = "12345"
date = Date.today

e = Enigma.new
# e.encrypt(my_message, key, date)
binding.pry