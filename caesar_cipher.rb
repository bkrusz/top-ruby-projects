ALPHABET_UPPER = Array('A'..'Z').join.codepoints()
ALPHABET_LOWER = Array('a'..'z').join.codepoints()
NUMBERS = Array(0..9).join.codepoints()

def shift(codepoint_array, shift_amount)
  shifted_codepoint_array = []
  codepoint_array.map do |codepoint|
    if(ALPHABET_UPPER.include?(codepoint))
      codepoint += shift_amount
      if(codepoint > ALPHABET_UPPER.last)
        codepoint = codepoint - 1 - ALPHABET_UPPER.last + ALPHABET_UPPER.first
      end
      shifted_codepoint_array.push(codepoint)
    elsif(ALPHABET_LOWER.include?(codepoint))
      codepoint += shift_amount
      if(codepoint > ALPHABET_LOWER.last)
        codepoint = codepoint - 1 - ALPHABET_LOWER.last + ALPHABET_LOWER.first
      end
      shifted_codepoint_array.push(codepoint)
    elsif(NUMBERS.include?(codepoint))
      codepoint += shift_amount
      if(codepoint > NUMBERS.last)
        codepoint = codepoint - 1 - NUMBERS.last + NUMBERS.first
      end
      shifted_codepoint_array.push(codepoint)
    else
      shifted_codepoint_array.push(codepoint)
    end
  end
  return shifted_codepoint_array
end

def shift_string(string, shift_amount)
  codepoint_string = string.codepoints()
  shifted_codepoint_string = shift(codepoint_string, shift_amount)
  shifted_codepoint_string.map { |codepoint| codepoint.chr}
end

def caesar_cipher()
  user_string = ""
  puts "type $Q$ to quit"
  until user_string == '$Q$'
    puts "Enter a string: "
    user_string = gets.chomp
    if(user_string == '$Q$')
      next
    end
    puts "Enter amount to shift: "
    user_shift = gets.chomp.to_i
    shifted_string = shift_string(user_string, user_shift)
    puts shifted_string.join
  end
end

caesar_cipher()