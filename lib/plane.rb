class Plane
  attr_reader :id

# love this. SO clear and simple 
# one thing, do you need the 'if weather == sunny'? I think it can be removed 
  def land(airport:, weather:)
    land_storm_error if weather == :stormy
    attempt_landing(airport) if weather == :sunny
  end

# same as before, could the 'if weather == sunny' be removed?
  def take_off(airport:, weather:)
    takeoff_storm_error if weather == :stormy
    attempt_takeoff(airport) if weather == :sunny
  end

  private

# lvoe this, clear and concise 
  def attempt_landing(airport)
    airport.land(self) ? true : airport_full_error
  end

  def attempt_takeoff(airport)
    airport.take_off(self) ? true : not_in_airport_error
  end

  def land_storm_error
    raise "plane can't land, stormy weather"
  end

  def airport_full_error
    raise "plane can't land, airport full"
  end

  def not_in_airport_error
    raise "plane is not in specified airport"
  end

  def takeoff_storm_error
    raise "plane can't take off, stormy weather"
  end

end
