class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    size = letters.size

    top_half = letters.map.with_index do |char, index|
       outer_spaces = ' ' * (size - index - 1)
      if index == 0
        "#{outer_spaces}#{char}#{outer_spaces}\n"
      else
        inner_spaces = ' ' * (2 * index - 1)
        "#{outer_spaces}#{char}#{inner_spaces}#{char}#{outer_spaces}\n"
      end
    end

    bottom_half = top_half[0...-1].reverse

    (top_half + bottom_half).join
  end
end
