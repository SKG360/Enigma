#runner

require './lib/enigma'
require 'pry'

encrypted_filename        = ARGV[0]
decrypted_file_desination = ARGV[1]
decryption_key            = ARGV[2]
decryption_date           = ARGV[3]
date = Date.today.strftime("%d%m%y")


def read_from_file(file)
    File.read(file)
end # => "6895k9gk5cy5r3fr6yzlrb4ll"

def write_to_file(text)
    File.open(@encrypted_file_destination,'w') { |file| file.write(text)}
end


enigma = Enigma.new

decrypted_string = enigma.decrypt(read_from_file("encrypted.txt"), "12345", "270818")
write_to_file(decrypted_string)
