require './lib/enigma'
require 'date'

# unencrypted_message = File.read input_filename
# File.write output_filename, enigma.encrypt

# date  = Date.today.strftime("%d%m%y")

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

  def read_from_file(file)
    if found_file?
      @message_text = File.read(file)
    else
      "ERROR: File not found"
    end
  end

  def display_warning_and_option(encrypted_string)
    p "WARNING: the target file already exists. Do you want to overwrite? (y)es, (n)o"
    print ">"
    #can't use gets because of terminal args
    reply = $stdin.gets.chomp.to_s
    if reply == 'y'
      File.open(@output_filename,'w') { |file| file.write(encrypted_string)}
    end
  end

  def write_to_file(encrypted_string)
    if found_duplicate_file?
      display_warning_and_option(encrypted_string)
    elsif 
      File.open(@output_filename,'w') { |file| file.write(encrypted_string)}
    end
  end
end
   

key = "82648"
date = "250818"


enigma = Enigma.new
encrypted_message = enigma.encrypt("this is so secret ..end..", key, date)

e = Encrypt.new(ARGV[0], ARGV[1])
my_message = e.read_from_file(ARGV[0])
e.write_to_file(encrypted_message)



