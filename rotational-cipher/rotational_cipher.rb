class RotationalCipher
  ALPHABET = "abcdefghijklmnopqrstuvwxyz".chars

  def self.rotate(input, key)
    input.chars.map do |char|
      rotate_character(char, key)
    end.join
  end

  private

  def self.rotate_character(char, key)
    index = ALPHABET.index(char.downcase)
    return char unless index

    rotated_char = ALPHABET[(index + key) % ALPHABET.size]
    is_upcase(char) ? rotated_char.upcase : rotated_char
  end

  def self.is_upcase(char)
    char.upcase == char
  end
end
