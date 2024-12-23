# frozen literal: true

# Isogram class
class Isogram
  def self.isogram?(input)
    sanitized_isogram = input.downcase.gsub(/[^a-z]/, "")
    sanitized_isogram.chars.uniq.size == sanitized_isogram.size
  end
end
