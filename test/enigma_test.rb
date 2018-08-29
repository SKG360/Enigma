require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

    def setup
        @e = Enigma.new
        @my_message = "Hello World"         # File.read("message.txt")
        @key_string = "82648"               # rand(99999).to_s
        @date = Date.new(2018,8,17)  # Date.today.strftime("%m%d%y")

    end

    def test_it_exists
        assert_instance_of Enigma, @e
    end

    def test_todays_date_is_string
        assert_instance_of String, @e.last_four_of_date_squared(@date)
    end

    def test_length_of_date_string
        assert_equal 4, @e.last_four_of_date_squared(@date).length
    end

    def test_correct_last_four_digits_of_date_squared
        assert_equal "9124", @e.last_four_of_date_squared(@date)
    end

    def test_character_map
        skip
        expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "[", "]", "<", ">", ";", ":", "/", "?", "''", "|", "'"]
        assert_equal expected, @e.character_map
    end

    def test_character_map_holds_strings
        @e.character_map.all? do |x|
            assert_instance_of String, x
        end
    end

    def test_character_hash_is_correct
        skip
        expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, "0"=>26, "1"=>27, "2"=>28, "3"=>29, "4"=>30, "5"=>31, "6"=>32, "7"=>33, "8"=>34, "9"=>35, " "=>36, "."=>37, ","=>38, "!"=>39, "@"=>40, "#"=>41, "$"=>42, "%"=>43, "^"=>44, "&"=>45, "*"=>46, "("=>47, ")"=>48, "["=>49, "]"=>50, "<"=>51, ">"=>52, ";"=>53, ":"=>54, "/"=>55, "?"=>56, "''"=>57, "|"=>58, "'"=>59}
        assert_equal expected, @e.character_hash
    end

    def test_random_key_passes_string
        assert_instance_of String, @e.key
    end

    def test_key_is_five_integers
        refute_equal 0, @e.key.to_i
    end

    def test_offset_A
        assert_equal 29, @e.offset(0)
    end

    def test_offset_B
        assert_equal 9, @e.offset(1)
    end

    def test_offset_C
        assert_equal 23, @e.offset(2)
    end         

    def test_offset_D
        assert_equal 22, @e.offset(3)
    end

    def test_it_produces_correct_array
        expected = [30, 11, 26, 26, 34, 15, 30, 30, 38]
        assert_equal expected, @e.shift_character_index([1,2,3,4,5,6,7,8,9])
    end

    def test_encrypt_output
        expected = " n88%&&%*80"
        assert_equal expected, @e.encrypt("Hello World", @key_string, @date)
    end

    def test_decrypt_output
        e = Enigma.new
        my_message = "abcdabcd"             # File.read("message.txt")
        key = "82648"                       # rand(99999).to_s
        date = Date.new(2018,8,17)          # Date.today.strftime("%m%d%y")
        
        a = e.encrypt(my_message, key, date)
        b = e.decrypt(a, key, date)
        assert_equal my_message, b
    end

    def test_it_can_find_space_character
        e = Enigma.new
        # binding.pry
        assert_equal 36, e.character_hash[" "]
        assert_equal " ", e.character_hash.invert[36]
    end

    
    def test_encryption_loop
        i = 4
        assert_equal @e.offset(0), @e.offset(i % 4)
    end                                 



end