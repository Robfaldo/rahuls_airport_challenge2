class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

 # This method is short and clear. I understood what it does without any real effort 
  def land(plane)
    return false if @planes.length == @capacity
    @planes << plane
    true
  end

# Could you break the reject functionality into it's own feature?
# Took me some working out of what the reject '@planes.reject!' section was doing. It's returning an array where 
    # they aren't the plane taking off. Would it be easier to do a @planes.delete(plane_taking_off)?
  def take_off(plane_taking_off)
    return false unless @planes.include? plane_taking_off
    @planes.reject! { |plane_at_airport|
      plane_at_airport.equal? plane_taking_off
    }
    true
  end

# Do you need to break on the strings into variables, is it short enough to do without? 
  def plane_status(plane)
    gone = "plane not at airport"
    here = "plane still at airport"
    return here if @planes.include? plane
    gone
  end

end
