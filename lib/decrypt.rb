#runner

require './lib/enigma'
require 'pry'

encrypted_filename        = ARGV[0]
decrypted_file_desination = ARGV[1]
decryption_key            = ARGV[2]
decryption_date           = ARGV[3]
date = Date.today.strftime("%d%m%y")

class Decrypt
    def initialize(encrypted_filename = "encrypted.txt", 
        decrypted_file_desination = "decrypted.txt", 
        decryption_key = rand(99999).to_s, 
        decryption_date = Date.today.strftime("%d%m%y"))

        @encrypted_filename        = encrypted_filename
        @decrypted_file_desination = decrypted_file_desination
        @decryption_key            = decryption_key
        @decryption_date           = decryption_date
    end

    def read_from_file(file)
        File.read(file)
    end # => "6895k9gk5cy5r3fr6yzlrb4ll"

    def write_to_file(text)
        File.open(@encrypted_file_destination,'w') { |file| file.write(text)}
    end
end

enigma = Enigma.new
# binding.pry
d = Decrypt.new("encrypted.txt", "decrypted.txt", "12345", "270818")
# binding.pry
decrypted_string = enigma.decrypt(d.read_from_file("encrypted.txt"), "12345", "270818")
binding.pry
d.write_to_file(decrypted_string)
binding.pry