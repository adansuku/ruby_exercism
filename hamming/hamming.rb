=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(a, b)
    raise ArgumentError, "Strands must be of equal length" if a.length != b.length

    a.chars.zip(b.chars).count { |char_a, char_b| char_a != char_b }
  end
end
