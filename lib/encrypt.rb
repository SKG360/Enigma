require './lib/enigma'
require 'date'


input_filename      = ARGV[0]
unencrypted_message = File.read input_filename


date  = Date.today.strftime("%d%m%y")
  # -- Chosen File Architecture -- #

# Write the output file
output_filename = ARGV[1]
File.write output_filename, enigma.encrypt
# encrypted_message = enigma.encrypt

# print file, key, and date
