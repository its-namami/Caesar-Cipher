require 'debug'

def encrypt(input, shift)
  lowercase_letters = ('a'..'z').to_a
  lowercase_letters_ascii = lowercase_letters.map(&:ord)

  input.split('').each.with_object('') do |letter, result|
    letter_ascii = letter.ord

    result <<
      case letter_ascii
      when lowercase_letters_ascii.first..lowercase_letters_ascii.last
        shifted_letter_ascii = letter_ascii + shift

        case shifted_letter_ascii
        when lowercase_letters_ascii.first..lowercase_letters_ascii.last
          (letter_ascii + shift).chr
        when -> (shifted_letter) { shifted_letter > lowercase_letters_ascii.first }
          shifted_letter_ascii - lowercase_letters_ascii.last
        else 
          lowercase_letters_ascii.last - lowercase_letters_ascii.first - shifted_letter_ascii
        end
      end
  end
end

puts encrypt(gets.chomp, gets.to_i)
