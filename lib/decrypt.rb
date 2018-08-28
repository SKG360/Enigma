#runner

require './lib/enigma'
require 'pry'

# encrypted_filename        = ARGV[0]
# decrypted_file_desination = ARGV[1]
# decryption_key            = ARGV[2]
# decryption_date           = ARGV[3]
# date = Date.today.strftime("%d%m%y")

encrypted_filename         = "encrypted.txt"
decrypted_file_destination = "decrypted.txt"
decryption_key             = "12345"
decryption_date            = "280818"


def read_from_file(file)
    File.read(file)
end # => "6895k9gk5cy5r3fr6yzlrb4ll"

def write_to_file(destination, text)
    File.open(destination,'w') { |file| file.write(text)}
end

enigma = Enigma.new
encrypted_message = read_from_file(encrypted_filename)
# decrypted_string = enigma.decrypt(encrypted_message, decryption_key, decryption_date)
decrypted_string = "Hello Nurse!"
write_to_file(decrypted_file_destination, decrypted_string)
