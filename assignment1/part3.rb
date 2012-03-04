def combine_anagrams(words)
  hash = Hash.new()
  words.each do |word|
    new_word = word.downcase.chars.sort.join
    if hash.has_key?(new_word) then
      hash[new_word].push(word)
    else
      hash[new_word] = [word]
    end
  end
  return hash.values
end

words = ['scream', 'Maercs', 'reamcs','abc','cBa','bac', 'foor','roof']
print combine_anagrams(words)
