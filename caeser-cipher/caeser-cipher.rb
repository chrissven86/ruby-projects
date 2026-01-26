def caeser_cipher(text)
  shift = -3
  result = ""

  text.each_char do |char|
    if char >= "a" && char <= "z"
      new_code = ((char.ord - 'a'.ord + shift) % 26) + 'a'.ord
      result << new_code.chr
    elsif char >= "A" && char <= "Z"
      new_code = ((char.ord - 'A'.ord + shift) % 26) + 'A'.ord
      result << new_code.chr
    else
      result << char
    end
  end

  result
end

puts "Input the phrase you want to cipher"
text = gets.chomp

puts caeser_cipher(text)