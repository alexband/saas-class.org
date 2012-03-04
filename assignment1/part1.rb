# hw part1 palindrome
 
def palindrome?(string)
  new_string = string.gsub(/\W/,'').downcase.reverse
  return string.gsub(/\W/,'').downcase == new_string
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")

def count_words(string)
  counts = Hash.new(0)
  new_string = string.split(/\b/)
  new_string.each do |word| 
    new_word = word.gsub(/\W/,'').downcase
    counts[new_word] = counts[new_word] + 1
  end
  counts.delete('')
  return counts
end

puts count_words("A man, a plan, a canal")
puts count_words("Doo bee doo bee doo")
