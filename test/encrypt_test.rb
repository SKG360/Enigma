require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test


    def test_it_can_read_local_directory
        e = Encrypt.new("Hello World", "message.txt")
        assert_equal ["message.txt"], e.check_local_files
    end

    

    def test_recieves_first_arg
        #message to encrypt
    end

    def test_recieves_second_arg
        #decrypted text destination
    end


end