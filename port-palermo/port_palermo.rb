module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER =:PALE

  CITY_IDENTIFIERS = {
    "Hamburg" => :HAMB,
    "Rome" => :ROME,
    "Kiel" => :KIEL
  }

  def self.get_identifier(city)
    CITY_IDENTIFIERS[city]
  end

  def self.get_terminal(ship_identifier)
    ["GAS", "OIL"].any? { |word| ship_identifier.to_s.include?(word) } ? :A : :B
  end
end
