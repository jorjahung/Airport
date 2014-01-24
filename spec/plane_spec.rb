require_relative "../lib/plane"


describe Plane do 
	let(:plane) { Plane.new }

	it "flight status should be flying when created" do
		expect(plane).to be_flying
	end

	it "can take off and status must be 'In flight'" do
		plane.takeoff
		expect(plane.flight_status).to eq("In flight")
	end

	it "can land and status must be 'On ground'" do
		plane.landing
		expect(plane.flight_status).to eq("On ground")
	end

	it "can land and then take off" do
		plane.landing
		plane.takeoff
		expect(plane.flight_status).to eq("In flight")
	end

end
