#runner

require './lib/enigma'


def read_from_file(file)
  File.read(file)
end # => "6895k9gk5cy5r3fr6yzlrb4ll"

def write_to_file(destination, text)
  File.open(destination,'w') { |file| file.write(text)}
end

unencrypted_file_name            = ARGV[0]
encrypted_file_destination       = ARGV[1]

enigma = Enigma.new
key = enigma.key
date = enigma.date

raw_message = read_from_file(unencrypted_file_name)
encrypted_message = enigma.encrypt(raw_message, key, date)

my_message = encrypted_message
write_to_file(encrypted_file_destination, my_message)

puts "Created '#{encrypted_file_destination}' with the key #{key} and date #{date.strftime("%m%d%y")}"