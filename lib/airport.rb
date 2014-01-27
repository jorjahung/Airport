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
		# if you want to throw an exception, do it here
		raise "Bad weather" if !clear_to_fly?
		raise "Airport is full" if full?
		plane.landing
		ramp << plane	
	end

	def takeoff(plane)
		raise "Bad weather" if !clear_to_fly?
		plane.takeoff
		ramp = @ramp.delete(plane) 		
	end

	def clear_to_fly?
		# It looks like you're using Kernel.rand here only because it's convenient
		# to stub it in the test but there's no need for this.
		weather = [["sunny"]*50 + ["stormy"]].sample
		# As mentioned above, it's better to raise the exception elsewhere
		false if weather == "stormy"
		true
	end

	def full?
		plane_counter == capacity
	end


end
