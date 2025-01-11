module Chess
  # TODO: define the 'RANKS' constant
  # TODO: define the 'FILES' constant
  FILES = 'A'..'H'
  RANKS = 1..8
  def self.valid_square?(rank, file)
    RANKS.include?(rank.to_i) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    (first_name[0..1] + last_name[-2..-1]).upcase
  end

  def self.move_message(first_name, last_name, square)
    if valid_square?(square.chars[1], square.chars[0])
      "#{nick_name(first_name, last_name)} moved to #{square}"
    else
      "#{nick_name(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
