dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
  result = Hash.new(0)

  words = word.downcase.split(/\W+/) #Split the string wherever punctuation or spaces appear

  dictionary.each do |substring|
    substring = substring.downcase

    words.each do |w|
      if w.include?(substring)
        result[substring] += 1
      end
    end
  end

  result
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)