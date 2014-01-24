require_relative "../lib/airport"
require_relative "../lib/plane"


describe Airport do 
let(:airport) {Airport.new }
let(:cathay_pacific) { Plane.new }

	context "Creating a new airport" do
		it "should have 0 planes when created" do
			expect(airport.plane_counter).to eq(0)
		end
	end	

	context "Taking off and landing" do

		it "plane should be able to land when sunny" do
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
			airport.land(cathay_pacific)
			expect(airport.plane_counter).to eq(1)
		end

		it "plane should be able to takeoff when sunny" do
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
			airport.land(cathay_pacific)
			airport.takeoff(cathay_pacific)
			expect(airport.plane_counter).to eq(0)
		end

		it "plane shouldn't be able to takeoff if stormy" do
			test_values = [50]
			Kernel.stub(:rand).and_return( *test_values )
			expect{airport.takeoff(cathay_pacific)}.to raise_error
		end

		it "plane shouldn't be able to land if stormy" do
			test_values = [50]
			Kernel.stub(:rand).and_return( *test_values )
			expect{airport.land(cathay_pacific)}.to raise_error
		end
	end

	context "Traffic control" do

		it "should know when airport is full" do
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
			expect(airport).not_to be_full
			25.times {airport.land(Plane.new)}
			expect(airport).to be_full
		end

		it "should not be able to land when airport is full" do
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
			25.times {airport.land(Plane.new)}
			expect{airport.land(cathay_pacific)}.to raise_error
		end
	end


end
