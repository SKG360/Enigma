require 'minitest/autorun'
require 'minitest/pride'
require './lib/Untitled-1'

class EnigmaTest < Minitest::Test

    def setup
        @e = Enigma.new
        @date = Date.new(2018,8,17)
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
        expected = ["a", "b", "c", "d", 
        "e", "f", "g", "h", "i", "j", "k", 
        "l", "m", "n", "o", "p", "q", "r", 
        "s", "t", "u", "v", "w", "x", "y", "z", 
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
        " ", ".", ","]
        assert_equal expected, @e.character_map
    end

    def test_character_map_holds_strings
        @e.character_map.all? do |x|
            assert_instance_of String, x
        end
    end

    def test_character_hash_is_correct
        expected = { "a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,
        "f"=>5,"g"=>6,"h"=>7,"i"=>8,"j"=>9,"k"=>10,"l"=>11,
        "m"=>12,"n"=>13,"o"=>14,"p"=>15,"q"=>16,"r"=>17,
        "s"=>18,"t"=>19,"u"=>20,"v"=>21,"w"=>22,"x"=>23,
        "y"=>24,"z"=>25,"0"=>26,"1"=>27,"2"=>28,"3"=>29,
        "4"=>30,"5"=>31,"6"=>32,"7"=>33,"8"=>34,"9"=>35,
        " "=>36,"."=>37,","=>38}
        assert_equal expected, @e.character_hash
    end

    def test_random_key_passes_string
        assert_instance_of String, @e.random_key
    end

    def test_key_is_five_integers
        refute_equal 0, @e.random_key.to_i
    end

    def test_offset_A
        assert_equal 21, @e.offset_A
    end

    def test_offset_B
        assert_equal 24, @e.offset_B
    end

    def test_offset_C
        assert_equal 36, @e.offset_C
    end         

    def test_offset_D
        assert_equal 49, @e.offset_D
    end

    def test_decomposed_array 
        expected = ["h", "i", " ", "t", "h", "e", "r", "e", " ", "e", "v", "e", "r", "y", "o", "n", "e", " ", "i", "n", " ", "t", "h", "e", " ", "u", "n", "i", "v", "e", "r", "s", "e"]
        assert_equal expected, @e.decompose_array("Hi there everyone in the universe")
    end

    #current index

    def test_it_produces_correct_array
        expected = [21, 25, 38, 52, 21, 29, 42, 29, 38, 29, 46, 29, 42, 37]
        assert_equal expected, @e.apply_offset_rotations(["h", "i", " ", "t", "h", "e", "r", "e", " ", "e", "v", "e", "r", "y"])
    end

    
    


end