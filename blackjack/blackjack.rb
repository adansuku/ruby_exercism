require 'byebug'
module Blackjack
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten", "jack", "queen", "king" then 10
    when "joker" then 0
    end
  end

  def self.card_range(card1, card2)
    range = parse_card(card1) + parse_card(card2)

    case range
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when ..21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    cards_sum = parse_card(card1) + parse_card(card2)

    case
    when card1 && card2 == "ace" then "P"
    when cards_sum == 21 && (dealer_card != "ace") then "W"
    when cards_sum < 11 then "H"
    when ["ace", "king", "queen", "jack", 11].include?(dealer_card) then "S"
    when (12..16).include?(cards_sum) && parse_card(dealer_card) >= 7 then "H"
    when (12..16).include?(cards_sum) && parse_card(dealer_card) < 7 then "S"
    when (17..20).include?(cards_sum) then "S"
    end

  end

  def split(card1, card2, dealer_card)

  end
end
