class Airport

	DEFAULT_CAPACITY = 25 

	def initialize(options ={})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def ramp 
		@ramp ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity=value
	end
		
	def plane_counter 
		ramp.count
	end

	def land(plane)
		check_weather
		raise "Can't land because airport is full" if full?
		plane.landing
		ramp << plane	
	end

	def takeoff(plane)
		check_weather
		plane.takeoff
		ramp = @ramp.delete(plane) 		
	end

	def check_weather
		weather = Kernel.rand(50)
		raise "Can't fly due to weather conditions" if weather == 50 
	end

	def full?
		plane_counter == capacity
	end


end
