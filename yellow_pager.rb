# returns hash that maps all characters in alaphabet to a number
# based on a phone key pad
def get_phone_alpha_mappings()
  phone_mappings = {
    'a' => 2,
    'b' => 2,
    'c' => 2,
    'd' => 3,
    'e' => 3,
    'f' => 3,
    'g' => 4,
    'h' => 4,
    'i' => 4,
    'j' => 5,
    'k' => 5,
    'l' => 5,
    'm' => 6,
    'n' => 6,
    'o' => 6,
    'p' => 7,
    'q' => 7,
    'r' => 7,
    's' => 7,
    't' => 8,
    'u' => 8,
    'v' => 8,
    'w' => 9,
    'x' => 9,
    'y' => 9,
    'z' => 9
  }
  phone_mappings
end
# returns bool if text is exactly 10 characters long
def is_text_valid?(text)
  return text.length == 10
end

def get_phone_from_string(text)
  # ensure text is string by converting it and downcasing it
  text = text.to_s.downcase
  result = ''
  # do checks first
  if is_text_valid?(text)
    # get phone mappings to compare too
    phone_mappings = get_phone_alpha_mappings()
    # split the text into an array with each character as an
    # individual element
    character_list = text.split('')
    # loop over that character list
    character_list.each do |char|
    #  check if character in character list exists
    # in the phone_mappings hash
      if phone_mappings.has_key?(char)
        # if exists add that number (as a string) related to that character 
        # in the phone_mappings hash to the result
        result += phone_mappings[char].to_s
      else
        # if it doesn't exist we can assume the character is not
        # apart of the alphabet and we should just add it
        result = result + char
      end
      # end of loop
    end
    result
  else
    false
  end
end

puts get_phone_from_string('iamawesome')
puts get_phone_from_string('111mawesoe')


# Yellow Pager method requirements

# -given a 10 character string, return a phone number where
# each character in the original string maps to a digit found on a
# phone key pad (ie abc would be 2, cde would be 3)

# -if string is not exactly 10 characters long return false

# examples
# if we passed in "iamawesome"
# it would return '4262937663'

# if we pass in "hello"
# it would return false

# we  have a method and we're calling it phone_num_translator
# it will take a string as an argument
# test the strings length to be exactly 10, other wise return false


# "hey hows it going?".split("") => ["h", "e", "y"
# def phone_num_translator(user_string)
#   if user_string.length == 10
#     # split user string by each character into an arr
#     phone_number = ''
    
#     character_list = user_string.split("")
#     # loop over character_list and do..something
#     character_list.each do |char|
#       # if the letter a is passed return 2
#       # etc.

#       if char == 'a' || char == 'b' || char == 'c'
#         phone_number += '2'
#       elsif char == 'd' || char == 'e'|| char == 'f'
#         phone_number += '3'
#       elsif char == 'g' || char == 'h'|| char == 'i'
#         phone_number += '4'
#       elsif char == 'j' || char == 'k'|| char == 'l'
#         phone_number += '5'
#       elsif char == 'm' || char == 'n'|| char == 'o'
#         phone_number += '6'
#       elsif char == 'p' || char == 'q'|| char == 'r' || char == 's'
#         phone_number += '7'
#       elsif char == 't' || char == 'u'|| char == 'v'
#         phone_number += '8'
#       elsif char == 'w' || char == 'x' || char == 'y'|| char == 'z'
#         phone_number += '9'
#       end
#     end
#     puts phone_number
#   else 
#     false
#   end
# end


# phone_num_translator("hello")
# phone_num_translator("iamawesome")
# # 4262937663























  