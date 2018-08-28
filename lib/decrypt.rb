#runner

require './lib/enigma'
require 'pry'


enigma = Enigma.new
e.decrypt("encrypted.txt", "decrypted.txt", "12345", "270818")
decrypted_string = enigma.decrypt(d.read_from_file("encrypted.txt"), "12345", "270818")
d.write_to_file(decrypted_string)