class AssemblyLine
  PRODUCTION_RATE_PER_HOUR = 221

  SUCCESS_RATES = {
    (1..4) => 1.0,
    (5..8) => 0.9,
    (9..9) => 0.8,
    (10..10) => 0.77
  }.freeze

  def initialize(speed)
    @speed = validate_speed(speed)
  end

  def production_rate_per_hour
    calculate_production_rate
  end

  def working_items_per_minute
    (calculate_production_rate / 60).floor
  end

  private

  attr_reader :speed

  def validate_speed(speed)
    raise ArgumentError, "Speed must be between 0 and 10" unless (0..10).include?(speed)
    speed
  end

  def success_rate
    SUCCESS_RATES.find { |range, _| range.include?(speed) }&.last || 0.0
  end

  def calculate_production_rate
    PRODUCTION_RATE_PER_HOUR * speed * success_rate
  end
end
