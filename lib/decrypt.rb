#runner

require './lib/enigma'
require 'pry'

encrypted_filename        = ARGV[0]
decrypted_file_desination = ARGV[1]
decryption_key            = ARGV[2]
decryption_date           = ARGV[3]


class Decrypt
    def initialize(encrypted_filename,
            decrypted_file_desination,
            decryption_key,
            decryption_date)

        encrypted_filename        = @encrypted_filename
        decrypted_file_desination = @decrypted_file_desination
        decryption_key            = @decryption_key
        decryption_date           = @decryption_date
    end
end
