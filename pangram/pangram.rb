=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end
class Pangram
  def self.pangram?(sentence)
    # The best solution
    # ('a'..'z').all? { |e| phrase.downcase.include?(e) }
    return false if sentence.empty?

    ('a'..'z').to_a.each do |char|
      return false unless sentence.strip.downcase.include?(char)
    end
  end
end
