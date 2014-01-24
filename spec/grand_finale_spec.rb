require_relative "../lib/airport"
require_relative "../lib/plane"


describe "The Grand Finale" do 
let(:airport) { Airport.new }
let(:planes)  { Array.new(6) { Plane.new } }
let(:tinyairport) { Airport.new(:capacity => 6)}

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

	it "When the airport is full, every plane must take off again" do
		planes.each do |plane|
				tinyairport.land(plane)
			end	
		if tinyairport.full?
			planes.each do |plane|
				tinyairport.takeoff(plane)
			end
		end	
		expect(tinyairport.plane_counter).to eq(0)
	end


end
