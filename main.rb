require 'debug'

def get_char_from_range(char_array, char_needle, shift)
  shift %= char_array.size

  case char_needle
  when char_array.first..char_array.last
    char_shift = char_needle + shift

    case char_shift
    when char_array.first..char_array.last
      char_shift
    when -> (ch) {ch > char_array.last}
      char_shift - char_array.last + char_array.first - 1
    else 
      char_array.last + shift + 1
    end
  else
    char_needle
  end
end

def encrypt(input, shift)
  lowercase_letters = ('a'.ord..'z'.ord).to_a

  input.split('').each.with_object('') do |letter, result|
    result << get_char_from_range(lowercase_letters, letter.ord, shift).chr
  end
end

puts encrypt(gets.chomp, gets.to_i)
