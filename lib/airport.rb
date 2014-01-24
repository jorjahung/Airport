class Airport

	attr_accessor :airport

	def ramp 
		@ramp ||= []
	end
		
	def plane_counter 
		ramp.count
	end

	def land(plane)
		ramp << plane	
	end

	def takeoff(plane)
		ramp = @ramp.delete(plane)
	end

end
