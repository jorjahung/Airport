require_relative "../lib/airport"
require_relative "../lib/plane"


describe Airport do 
let(:airport) { Airport.new }
let(:plane) { Plane.new }

	context "Creating a new airport" do
		it "should have 0 planes when created" do
			expect(airport.plane_counter).to eq(0)
		end
	end	

	context "Taking off and landing when sunny" do
		before :each do 
			# that's a smart piece of code but it's not the right way of doing it
			# What you wanted to do is to just stub the method, e.g.
			# airport.stub(:check_weather).and_return(true) # or something like that
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
		end

		it "plane should be able to takeoff when sunny" do
			airport.land(plane)
			airport.takeoff(plane)
			expect(airport.plane_counter).to eq(0)
		end

		it "plane should be able to land when sunny" do
			airport.land(plane)
			expect(airport.plane_counter).to eq(1)
		end
	end

	context "Taking off and landing when stormy" do
		before :each do 
			test_values = [50]
			Kernel.stub(:rand).and_return( *test_values )
		end

		it "plane shouldn't be able to takeoff if stormy" do
			expect{airport.takeoff(plane)}.to raise_error
		end

		it "plane shouldn't be able to land if stormy" do
			expect{airport.land(plane)}.to raise_error
		end
	end


	context "Traffic control" do
		before :each do 
			test_values = (1..49).to_a
			Kernel.stub(:rand).and_return( *test_values )
			airport.capacity.times {airport.land(Plane.new)}
		end

		it "should know when airport is full" do
			expect(airport).to be_full
		end

		it "should not be able to land when airport is full" do
			expect{airport.land(plane)}.to raise_error
		end
	end

end
