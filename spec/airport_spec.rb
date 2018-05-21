require "airport"

describe Airport do
# really like how you're swapping out all of this up here, makes the below much easier to read 
  let(:plane) { double :plane }
  let(:plane_a) { double :plane }
  let(:plane_b) { double :plane }
  let(:plane_c) { double :plane }
  let(:airport) { described_class.new }
  let(:another_airport) { described_class.new(25) }
  let(:capacity) { described_class::DEFAULT_CAPACITY }

# could you break the #land and #take_off into describe blocks?
  context "landing and taking off" do
    # You've split the expect lines into 2, would 1 not be easier to read? 
    it "#land - should make airport incorporate plane" do
      expect(airport.land(plane)).
        to be true
    end

# is this a magic number? Could you use described.class::DEFAULT_CAPACITY.times instead?
    it "#land - should fail when airport is full" do
      100.times { airport.land(plane) }
      expect(airport.land(plane)).
        to be false
    end

    it "#take_off - should remove plane from airport" do
      airport.land(plane)
      expect(airport.take_off(plane)).
        to be true
    end

    it "#take_off - should fail when plane wasn't at airport to begin with" do
      expect(airport.take_off(plane)).
        to be false
    end

# is this testing the right thing? Can the doubles represent different things?
    it "the same plane should take off" do
      airport.land(plane_a)
      airport.land(plane_b)
      airport.land(plane_c)
      airport.take_off(plane_b)
      expect(airport.planes).not_to include plane_b
    end
  end

# Is this repeating the feature etsting capacity above? Could we not just do expect(capacity).to be true 
  context "other features" do
    it "should have a default capacity" do
      capacity.times { airport.land(plane) }
      expect(airport.land(plane)).
        to be false
    end

# does this not rely on default capacity not being 26 (or else this would pass without it being changed?). 
# could it be capacity + 10 to get a different number?  
    it "'s capacity should be settable" do
      25.times { another_airport.land(plane) }
      expect(another_airport.land(plane)).
        to be false
    end

    it "#plane_status(plane) - a plane that has left should register as gone" do
      airport.land(plane_a)
      airport.land(plane_b)
      airport.land(plane_c)
      airport.take_off(plane_b)
      expect(
        airport.plane_status(plane_b)
      ).to eq "plane not at airport"
    end

    it "#plane_status(plane) - a plane that is at the airport should register als still there" do
      airport.land(plane_a)
      expect(
        airport.plane_status(plane_a)
      ).to eq "plane still at airport"
    end
  end

end
