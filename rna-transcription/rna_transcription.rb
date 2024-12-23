=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end


class Complement
  # This is amazing
  # def self.of_dna(dna)
  #   dna.tr('GCTA', 'CGAU')
  # end

  DNA_CLASSIFICATION = {
    G: "C",
    C: "G",
    T: "A",
    A: "U"
  }

  def self.of_dna(dna)
    return '' if dna.empty?

    result = []
    dna.upcase.chars.map do |char|
      result << DNA_CLASSIFICATION[char.to_sym]
    end

    return result.join
  end
end
