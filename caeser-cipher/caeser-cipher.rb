def caeser_cipher(text)
  shift = -3
  result = ""

  text.each_char do |char|
    if char >= "a" && char <= "z"
      new_code = char.ord + shift
      new_code += 26 if new_code < "a".ord
      result << new_code.chr
    elsif char >= "A" && char <= "Z"
      new_code = char.ord + shift
      new_code += 26 if new_code < "A".ord
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