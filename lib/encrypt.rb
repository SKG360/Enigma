#runner

require './lib/enigma'
require 'date'

date  = Date.today.strftime("%d%m%y")

key = "82648"
date = "250818"

# default
# # added for convenience
# if ARGV[0] == nil
#   ARGV[0] = "message.txt"
# end

# if ARGV[1] == nil
#   ARGV[1] = "encrypted.txt"
# end


unencrypted_file_name            = ARGV[0]
encrypted_file_destination       = ARGV[1]


def read_from_file(file)
  File.read(file)
end # => "6895k9gk5cy5r3fr6yzlrb4ll"

def write_to_file(destination, text)
  File.open(destination,'w') { |file| file.write(text)}
end


enigma = Enigma.new
raw_message = read_from_file(unencrypted_file_name)
# encrypted_message = enigma.encrypt(raw_message, key, date)
encrypted_message = "this is so secret ..end.."
encrypted_file_destination = "encrypted.txt"


my_message = encrypted_message
write_to_file(encrypted_file_destination, my_message)

