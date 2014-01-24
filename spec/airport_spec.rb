require_relative "../lib/airport"
require_relative "../lib/plane"


describe Airport do 
let(:airport) {Airport.new }
let(:cathay_pacific) { Plane.new }


	it "should have 0 planes when created" do
		expect(airport.plane_counter).to eq(0)
	end

	it "plane should be able to land" do
		airport.land(cathay_pacific)
		expect(airport.plane_counter).to eq(1)
	end

	it "plane should be able to takeoff" do
		airport.land(cathay_pacific)
		airport.takeoff(cathay_pacific)
		expect(airport.plane_counter).to eq(0)
	end


end
