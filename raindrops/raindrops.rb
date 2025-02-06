# If a given number:

# - is divisible by 3, add "Pling" to the result.
# - is divisible by 5, add "Plang" to the result.
# - is divisible by 7, add "Plong" to the result.
# - **is not** divisible by 3, 5, or 7, the result should be the number as a string.

# class Raindrops
#   def self.convert(n)
#     s = ""
#     s += "Pling" if n % 3 == 0
#     s += "Plang" if n % 5 == 0
#     s += "Plong" if n % 7 == 0

#     s.empty? ? n.to_s : s
#   end
# end

module Raindrops
  FACTOR_SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    converted_number = FACTOR_SOUNDS.select { |key, factor| number % key == 0 }.values
    converted_number.empty? ? number.to_s : converted_number.join
  end
end
