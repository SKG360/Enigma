require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test


    def test_it_can_read_local_directory
        skip
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal ["message.txt"], e.check_local_files
        # this fails for the right reasons
    end

    def test_it_can_pick_message_file_from_local_directory
        # skip
        e = Encrypt.new("message.txt", "encrypted.txt")
        all_files = e.check_local_files
        assert_equal true, e.found_file?
    end

    def test_it_reads_from_file
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal "\"1,2,3... Hello World!\"", e.read_from_file
        # format questions 
    end

    def test_it_displays_error_if_file_not_found
        e = Encrypt.new("wrong_message_file.txt", "encrypted.txt")
        assert_equal "ERROR: File not found", e.read_from_file
    end

    def test_it_can_find_duplicate_target_destinations
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal false, e.found_duplicate_file?
    end

end