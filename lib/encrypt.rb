require './lib/enigma'
require 'date'


input_filename      = ARGV[0]
output_filename     = ARGV[1]

# unencrypted_message = File.read input_filename
# File.write output_filename, enigma.encrypt

date  = Date.today.strftime("%d%m%y")

class Encrypt
  def initialize(input_filename, output_filename)
    input_filename = @input_filename
    output_filename = @output_filename
  end

  def check_local_files
    @directory_files = Dir.glob("*.txt")
  end
  #input_filename => ARGV[0] => message.txt
  #output_filename => ARGV[1] => encrypted.txt
end
