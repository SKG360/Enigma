require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test


    def test_it_can_read_local_directory
        skip
        e = Encrypt.new("Hello World", "message.txt")
        assert_equal ["message.txt"], e.check_local_files
        # this fails for the right reasons
    end

    def test_it_can_pick_message_file
        e = Encrypt.new("Hello World", "message.txt")
        all_files = e.check_local_files
        assert_equal true, e.found_file?
    end

    def test_recieves_first_arg
        skip
        #message to encrypt
    end

    def test_recieves_second_arg
        skip
        #decrypted text destination
    end


end