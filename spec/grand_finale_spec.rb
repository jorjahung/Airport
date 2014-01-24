require_relative "../lib/airport"
require_relative "../lib/plane"


describe "The Grand Finale" do 
let(:airport) { Airport.new }
let(:planes)  { Array.new(6) { Plane.new } }
let(:tinyairport) { Airport.new(:capacity=> 5)}

	it "should land all planes" do
		planes.each do |plane|
			plane.landing
			airport.land(plane)
			expect(plane).to_not be_flying
			expect(plane.flight_status).to eq("On ground")
		end
		expect(airport.plane_counter).to eq(6)
	end

	it "all planes should be able to takeoff" do
		planes.each do |plane|
			plane.landing
			airport.land(plane)
			plane.takeoff
			airport.takeoff(plane)
			expect(plane).to be_flying
			expect(plane.flight_status).to eq("In flight")
		end
		expect(airport.plane_counter).to eq(0)
	end

	it "first plane should take off when airport is full" do
		planes.each do |plane|
			plane.landing
			airport.land(plane)
			expect(plane).to_not be_flying
			expect(plane.flight_status).to eq("On ground")
		end
		expect(airport.plane_counter).to eq(5)
	end


end
