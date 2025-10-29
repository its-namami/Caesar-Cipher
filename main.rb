# frozen_string_literal: true

def char_shift_case(char_array, _char_needle, shift, char_shift)
  case char_shift
  when char_array.first..char_array.last
    char_shift
  when ->(ch) { ch > char_array.last }
    char_shift - char_array.last + char_array.first - 1
  else
    char_array.last + shift + 1
  end
end

def char_shift(char_array, char_needle, shift)
  shift %= char_array.size

  case char_needle
  when char_array.first..char_array.last
    char_shift = char_needle + shift

    char_shift_case(char_array, char_needle, shift, char_shift)
  else
    false
  end
end

def caesar_cipher(input, shift)
  lowercase_letters = ('a'.ord..'z'.ord).to_a
  uppercase_letters = ('A'.ord..'Z'.ord).to_a

  input.split('').map do |letter|
    char_ascii = char_shift(lowercase_letters, letter.ord,
                            shift) || char_shift(uppercase_letters, letter.ord, shift) || letter.ord

    char_ascii.chr
  end.join('')
end

def ask_text
  print "Enter the text\n>>> "
  gets.chomp
end

def ask_shift
  print "Enter the shift\n>>> "
  shift = gets.chomp

  shift.split('').each do |char|
    raise 'err' unless ('0'..'9').include?(char) || ['-', '.'].include?(char)
  end.join('').to_i
rescue StandardError
  puts 'Only numbers allowed!'
  retry
end

puts 'Welcome to Caesar Cipher!'
puts "Result:\n#{caesar_cipher(ask_text, ask_shift)}"
