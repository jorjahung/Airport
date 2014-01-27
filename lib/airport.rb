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
		# if you want to throw an exception, do it here, not in the method, e.g.
		# raise "Bad weather" if clear_to_fly?
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
		# It looks like you're using Kernel.rand here only because it's convenient
		# to stub it in the test but there's no need for this.
		weather = Kernel.rand(50)
		# As mentioned above, it's better to raise the exception elsewhere
		raise "Can't fly due to weather conditions" if weather == 50 
	end

	def full?
		plane_counter == capacity
	end


end
