class Airport

	CAPACITY = 25 
	attr_accessor :airport

	def ramp 
		@ramp ||= []
	end
		
	def plane_counter 
		ramp.count
	end

	def land(plane)
		check_weather
		raise "Can't land because airport is full" if full?
		ramp << plane	
		
	end

	def takeoff(plane)
		check_weather
		ramp = @ramp.delete(plane) 		
	end

	def check_weather
		weather = Kernel.rand(50)
		raise "Can't fly due to weather conditions" if weather == 50 
	end

	def full?
		plane_counter == CAPACITY
	end


end
