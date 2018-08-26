require './lib/enigma'
require 'date'


input_filename      = ARGV[0]
output_filename     = ARGV[1]

# unencrypted_message = File.read input_filename
# File.write output_filename, enigma.encrypt

date  = Date.today.strftime("%d%m%y")

class Encrypt
  def initialize(input_filename, output_filename)
    @input_filename = input_filename
    @output_filename = output_filename
  end

  def check_local_files
    Dir.glob("*.txt")
  end

  def found_file?
    check_local_files.include?(@input_filename)
  end

  def found_duplicate_file?
    check_local_files.include?(@output_filename)
  end

  def read_from_file
    # binding.pry
    if found_file?
      @message_text = File.read(@input_filename)
      # binding.pry
    else
      "ERROR: File not found"
    end
  end


  def write_to_file
    if found_duplicate_file?
      "WARNING: the target file already exists. Do you want to overwrite?"
    elsif 
      " "
    end
  end
  
  
  #input_filename => ARGV[0] => message.txt
  #output_filename => ARGV[1] => encrypted.txt
end
