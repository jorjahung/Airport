require_relative "../lib/airport"
require_relative "../lib/plane"


describe "The Grand Finale" do 
let(:airport) { Airport.new }
let(:planes)  { Array.new(6) { Plane.new } }
let(:tinyairport) { Airport.new(:capacity => 5)}

	it "should land all planes" do
		planes.each do |plane|
			airport.land(plane)
		end
		expect(airport.plane_counter).to eq(6)
	end

	it "all planes should be able to takeoff" do
		planes.each do |plane|
			airport.land(plane)
			airport.takeoff(plane)
		end
		expect(airport.plane_counter).to eq(0)
	end

	it "Tiny airport should only allow 5 planes" do
		planes.each do |plane|
			if !tinyairport.full?
				tinyairport.land(plane)
				expect(plane).to_not be_flying
				expect(plane.flight_status).to eq("On ground")
			else
				tinyairport.takeoff(plane)
				expect(plane).to be_flying
				expect(plane.flight_status).to eq("In flight")
			end	
		end
		expect(tinyairport.plane_counter).to eq(5)
	end


end
