class CollatzConjecture
  def self.steps(number)
    raise ArgumentError unless number.positive?

    counter = 0
    while number != 1
      number = number.even? ?  number / 2 : number * 3 + 1
      counter += 1
    end
    counter
  end
end
