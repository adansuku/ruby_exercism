# frozen_string_literal: true

# Verifies if a given ISBN-10 is valid
class IsbnVerifier
  def self.valid?(isbn_number)
    return false unless valid_input?(isbn_number)

    sanitized = sanitize(isbn_number)
    return false unless sanitized.size == 10

    checksum = calculate_checksum(sanitized)
    checksum % 11 == 0
  end

  class << self
    private

    # Validates input format: no invalid characters are allowed
    def valid_input?(isbn_number)
      isbn_number.is_a?(String) && !isbn_number.match?(/[^0-9X-]/)
    end

    # Removes non-numeric characters except for 'X'
    def sanitize(isbn_number)
      isbn_number.gsub(/[^0-9X]/, '')
    end

    # Converts "X" to 10 if it's the check digit
    def handle_x(char, index)
      char == 'X' && index == 9 ? 10 : char.to_i
    end

    # Calculates checksum for the ISBN-10
    def calculate_checksum(sanitized)
      sanitized.chars.map.with_index { |char, idx| handle_x(char, idx) }
                     .each_with_index
                     .sum { |digit, idx| digit * (idx + 1) }
    end
  end
end
