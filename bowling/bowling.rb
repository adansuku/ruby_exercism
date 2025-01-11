class Game
  class BowlingError < StandardError; end

  def initialize
    @rolls = []
    @score = 0
  end

  def roll(pins)
    raise Game::BowlingError if pins.negative? || pins > 10
    @rolls << pins
  end

  def score
    raise Game::BowlingError, "El juego no está completo" unless game_complete?

    raise Game::BowlingError if @rolls.size > 20 || @rolls.size < 10

    roll_index = 0
    @score = 0

    10.times do
      if is_strike?(roll_index) # Strike
        @score += 10 + strike_bonus(roll_index)
        roll_index += 1
      elsif is_spare?(roll_index) # Spare
        @score += 10 + spare_bonus(roll_index)
        roll_index += 2
      else # Open Frame
        @score += frame_score(roll_index)
        roll_index += 2
      end
    end

    @score
  end

  private

  def is_strike?(roll_index)
    @rolls[roll_index] == 10
  end

  def strike_bonus(roll_index)
    @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
  end

  def is_spare?(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
  end

  def spare_bonus(roll_index)
    @rolls[roll_index + 2].to_i
  end

  def frame_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
  end

  def game_complete?
    frames = 0
    roll_index = 0

    while roll_index < @rolls.size && frames < 10
      if is_strike?(roll_index)
        roll_index += 1
      else
        roll_index += 2
      end
      frames += 1
    end

    # Si estamos en el décimo frame, verifica lanzamientos adicionales
    if frames == 10
      last_frame_start = roll_index - 2
      return false if is_spare?(last_frame_start) && @rolls.size < roll_index + 1
    end

    frames == 10
  end

end
