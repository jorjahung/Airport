require_relative "../lib/plane"


describe Plane do 
	let(:cathay_pacific) { Plane.new }

	it "flight status should be 'flying' when created" do
		expect(cathay_pacific).to be_flying
		expect(cathay_pacific.flight_status).to eq("In flight")
	end

	it "can take off and status must be flying" do
		cathay_pacific.takeoff
		expect(cathay_pacific).to be_flying
		expect(cathay_pacific.flight_status).to eq("In flight")
	end

	it "can land and status must be 'Landed'" do
		cathay_pacific.landing
		expect(cathay_pacific).to_not be_flying
		expect(cathay_pacific.flight_status).to eq("On ground")
	end

	it "can land and then take off" do
		cathay_pacific.landing
		expect(cathay_pacific).to_not be_flying
		expect(cathay_pacific.flight_status).to eq("On ground")
		cathay_pacific.takeoff
		expect(cathay_pacific).to be_flying
		expect(cathay_pacific.flight_status).to eq("In flight")
	end

end
