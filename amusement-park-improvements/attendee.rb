class Attendee
  attr_reader :height, :pass_id

  def initialize(height)
    @height = height
    @pass_id = nil
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?
    true if @pass_id
  end

  def fits_ride?(ride_minimum_height)
    true if @height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    true if has_pass? && fits_ride?(ride_minimum_height)
  end
end
