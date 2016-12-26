class CaesarCipher
  def initialize
    @AtoZ = (0..25).each_with_object({}) do |key,h|
      @str = [*"A".."Z"].rotate(key).join
      h[key] = @str + @str.downcase
    end
  end

  def encrypt(key, plaintext)
    (1..25) === key or raise ArgumentError, "key not in 1..25"
    plaintext.tr(@AtoZ[0], @AtoZ[key])
  end

  def decrypt(key, ciphertext)
    (1..25) === key or raise ArgumentError, "key not in 1..25"
    ciphertext.tr(@AtoZ[key], @AtoZ[0])
  end
end

original = "Mohith Works for Cerner"
object=CaesarCipher.new

en = object.encrypt(3, original)
de = object.decrypt(3, en)

[original, en, de].each {|e| puts e}

puts 'OK' if
(1..25).all? {|k| original == object.decrypt(k, object.encrypt(k, original))}