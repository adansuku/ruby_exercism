# frozen_string_literal: true

# Acronym class
class Acronym
  def self.abbreviate(phrase)
    phrase
      .split(/[\s\W]+/)
      .map { |word| word[0].upcase }
      .join
  end
end
