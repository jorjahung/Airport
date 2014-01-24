class Airport

	attr_accessor :airport

	def ramp 
		@ramp ||= []
	end
		
	def plane_counter 
		ramp.count
	end

	def land(plane)
		raise "Can't land due to weather conditions" if weather == "stormy"
		ramp << plane	
		
	end

	def takeoff(plane)
		raise "Can't fly due to weather conditions"	if weather == "stormy"
		ramp = @ramp.delete(plane) 		
	end

	def weather
		weather = Kernel.rand(50)
		if weather == 50 
			return "stormy"
		else "sunny"
		end
	end

end
