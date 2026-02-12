# frozen_string_literal: true

# Implement password for ciphering
# Password is converted to a number and used for the character shift
def generate_shift(password)
  password.chars.sum(&:ord) % 26
end

def caesar_cipher(text, password, decrypt: false)
  raise ArgumentError, 'Password cannot be empty' if password.empty?

  shift = generate_shift(password)
  shift = 1 if shift.zero? # fix for certain password combinations when modulo 26 on sum = 0
  shift *= -1 if decrypt # reverse shift when password provided

  text.each_char.map do |char|
    case char
    when 'a'..'z'
      (((char.ord - 'a'.ord + shift) % 26) + 'a'.ord).chr
    when 'A'..'Z'
      (((char.ord - 'A'.ord + shift) % 26) + 'A'.ord).chr
    else
      char
    end
  end.join
end

puts "--- ENCRYPTION --- \n"
puts 'Input the phrase you want to cipher'
text = gets.chomp
puts 'Enter password for the cipher'
password = gets.chomp

encrypted = caesar_cipher(text, password)
puts "Encrypted: #{encrypted}"

puts "\n--- DECRYPTION --- \n"
loop do
  puts 'Enter password:'
  decrypt_password = gets.chomp

  decrypted = caesar_cipher(encrypted, decrypt_password, decrypt: true)

  if decrypted == text
    puts "Decrypted!: #{decrypted}"
    break
  else
    puts "Wrong password. Try again! \n"
  end
end
