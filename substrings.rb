def substrings(string, dictionary)
  string = string.downcase.split(' ')
  substr_hash = Hash.new
  dictionary.map do |dict_word|
    string.map do |str_word|
      if (str_word.include?(dict_word))
        if (substr_hash[dict_word] == nil)
          substr_hash[dict_word] = 1
        else
          substr_hash[dict_word] += 1
        end
      end
    end
  end
  return substr_hash
end

def run()
  puts "Enter words for dictionary"
  user_dictionary = gets.chomp.split(' ')
  while (true)
    puts "Enter string to test with dictionary"
    user_string = gets.chomp
    p substrings(user_string, user_dictionary)
  end
end

run()
