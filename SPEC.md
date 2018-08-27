### Encryption Algorithm
The encryption is based on rotation. The character map is made up of all the **lowercase letters**, then the **numbers**, then **space**, then **period***, then **comma**. New lines will not appear in the message nor character map.

### The Key
Each message uses a unique encryption key

The key is five digits, like 41521
#test_key_is_correct_length
## TEST COMPLETE

The first two digits of the key
are the “A” rotation (41)
#test_first_two_digits

The second and third digits of the key are the “B” rotation (15)
#test_second_two_digits

The third and fourth digits of the key are the “C” rotation (52)
#test_third_two_digits

The fourth and fifth digits of the key are the “D” rotation (21)
#test_fourth_two_digits

The Offsets

The date of message transmission is also factored into the encryption

**Consider the date in the format DDMMYY, like 240818**
#test_it_can_convert_date_to_integer

#test_that_it_generates_five_character_key_string
## TEST COMPLETE


#test_it_rejects_non_integer_strings
#TEST COMPLETE

**Square the numeric form (412699225) and find the last four digits (9225)**

The first digit is the “A offset” (9)
The second digit is the “B offset” (2)
The third digit is the “C offset” (2)
The fourth digit is the “D offset” (5)

#test_character_map

#test_character_offset_match

#test_can_multiple_offset_loops


Encrypting a Message
Four characters are encrypted at a time.
#test_it_can_can_convert_to_array
#test_it_can_slice_array
#test_it_can_pop_sliced_characters

#test_it_can_generate_correct_four_digits_from_key
e = Enigma.new
expected = 8689 # integer
actual = e.last_four_digits_of_squared # must return integer
assert_equal expected, actual



The first character is rotated forward by the “A” rotation plus the “A offset”
#test_it_can_calculate_offset_A

The second character is rotated forward by the “B” rotation plus the “B offset”
#test_it_can_calculate_offset_A

The third character is rotated forward by the “C” rotation plus the “C offset”
#test_it_can_calculate_offset_A

The fourth character is rotated forward by the “D” rotation plus the “D offset”
#test_it_can_calculate_offset_A






### Decrypting a Message
The offsets and keys can be calculated by the same methods above. Then each character is rotated **backwards** instead of **forwards**.


### Cracking a Key
When the key is not known, the offsets can still be calculated from the message date. We believe that each enemy message ends with the characters "..end..". Use that to determine when you’ve correctly guessed the key.

Cracking a Key
When the key is not known, the offsets can still be calculated from the message date. We believe that each enemy message ends with the characters "..end..". **Use that to determine when you’ve correctly guessed the key.**




### Iteration 1

Add support for encrypting a message. Create an Enigma class that has a method encrypt that takes a message String as an argument and outputs the encrypted message. The encrypt can optionally take a Key and Date as arguments to use for encryption. If the key and date are not included as arguments, you should generate a random Key and use today’s Date.

The Enigma class should respond to the following interaction pattern:

pry(main)> require 'date'
=> true

pry(main)> require './lib/enigma'
=> true

pry(main)> e = Enigma.new
=> #<Enigma:0x00007ff90f24cb78...>

pry(main)> my_message = "this is so secret ..end.."
=> "this is so secret ..end.."

pry(main)> output = e.encrypt(my_message, "12345", Date.today)
=> # encrypted message here

pry(main)> output = e.encrypt(my_message) #key and date are optional (generate random key and use today's date)
=> # encrypted message here


#Add support for decrypting a message. Add a method decrypt to your Enigma class that outputs a String of the decrypted message. This method takes two arguments. The first is the encrypted message as a String. The second is the Key that was used to encrypt the message. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.

The Enigma class should respond to the following interaction pattern:

pry(main)> require 'date'
=> true

pry(main)> require './lib/enigma'
=> true

pry(main)> e = Enigma.new
=> #<Enigma:0x00007ff90f24cb78...>

pry(main)> my_message = "this is so secret ..end.."
=> "this is so secret ..end.."

pry(main)> output = e.encrypt(my_message, "12345", Date.today)
=> # encrypted message here

pry(main)> e.decrypt(output, "12345", Date.today)
=> "this is so secret ..end.."

pry(main)> e.decrypt(output, "12345") # Date is optional (use today's date)
=> "this is so secret ..end.."

### Iteration 3

# ruby ./lib/encrypt.rb message.txt encrypted.txt
=> Created 'encrypted.txt' with the key 82648 and date 240818

# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
=> Created 'decrypted.txt' with the key 82648 and date 240818
