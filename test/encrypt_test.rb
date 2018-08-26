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
        assert_equal "\"1,2,3... Hello World!\"", e.read_from_file("message.txt")
        # format questions 
    end

    def test_it_displays_error_if_file_not_found
        e = Encrypt.new("wrong_message_file.txt", "encrypted.txt")
        assert_equal "ERROR: File not found", e.read_from_file("message.txt")
    end

        #these two methods are WIP, failing properly
    def test_it_can_find_duplicate_target_destinations
        skip 
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal false, e.found_duplicate_file?
    end
    def test_it_gives_warning_before_overwriting_destination_file
        skip
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal false, e.found_duplicate_file?
    end

    def test_it_can_read_output_file_for_output_string
        skip
        e = Encrypt.new("message.txt", "encrypted.txt")
        assert_equal "A string of encrypted data", e.read_from_file("encrypted.txt")
    end

    def test_it_can_transfer
        skip # skipped because it acts on files
        e = Encrypt.new("message.txt", "encrypted.txt")   
        output_string = e.read_from_file("message.txt")
        e.write_to_file(output_string)
        assert_equal e.read_from_file("message.txt"), e.read_from_file("encrypted.txt")
    end


    #assert_not_equal message_text, encrypted_out_string
end